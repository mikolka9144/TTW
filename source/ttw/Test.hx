package;

import haxe.io.Eof;
import sys.thread.Thread;
import sys.io.Process;
import haxe.Exception;
import sys.io.File;
import haxe.io.Path;
import sys.FileSystem;

using StringTools;

// haxe --run Test.hx -m Test
class Test
{
  //* CONFIGURATION
  // Name of the mod folder
  public static var Mod_Directory:String = "workbench";

  // location of v-slice engine directory (beginning in "source" folder)
  public static var baseGameDir:String = "funkinGame";

  // location of v-slice engine's "mods" directory (beginning in "source/ttw" folder)
  public static var baseGane_modDir:String = '../../$baseGameDir/mods';

  // Once enabled strips "package" line at the beginning of each file
  // (you still need that line even if you disable that)
  public static var stripPackage:Bool = true;

  // Allows you to utilise haxe's safe casts, like "cast (obj,type)"
  public static var convertCasts:Bool = true;

  // Fixes imports not being recognised by polymod (especially enums)
  public static var convertImports:Bool = true;

  // Allows you to utilise mock calls to polymod to fix missing mothod error
  public static var mockPolymodCalls:Bool = true;

  //* CONFIG END
  public static function main()
  {
    var args = Sys.args();
    trace(args);
    var compileMode:String = args.length == 1 ? args[0] : "";

    if (compileMode != "just-run")
    {
      deleteDirRecursively(Path.join([baseGane_modDir, Mod_Directory]));
      copyTemplate();
      walk();
    }
    if (compileMode != "")
    {
      var linux_bin = FileSystem.exists(Path.join([baseGane_modDir, "..", "Funkin"]));
      var windows_bin = FileSystem.exists(Path.join([baseGane_modDir, "..", "Funkin.exe"]));
      var mac_bin = FileSystem.exists(Path.join([baseGane_modDir, "..", "Funkin.app"])); // not supported
      if (windows_bin)
      {
        if (Sys.systemName() == "Windows") spawnProcess("Funkin.exe");
        else
        {
          trace("[INFO] Windows build on non-windows machine. Attempting to run using wine...");
          spawnProcess("Funkin.exe", "wine ");
        }
      }
      else if (linux_bin)
      {
        if (Sys.systemName() == "Linux") spawnProcess("Funkin");
        else
          displayError('Incompatible FNF version. Replace it with the windows one.');
      }
      else if (mac_bin && Sys.systemName() == "Mac") displayError("I personally don't know how to run the game natively on your platform\n"
        + "You might try to install wine and use Windows build instead");
      else
        displayError('No FNF binary found. Make sure that there\'s copy of FNF in $baseGameDir directory.');
    }
  }

  static function spawnProcess(pathShard:String, prefix:String = "")
  {
    Sys.setCwd(Path.join([baseGane_modDir, ".."]));
    var proc = new Process('$prefix ./$pathShard');

    while (true)
    {
      try
      {
        var logline = proc.stdout.readLine();
        Sys.println(logline);
      }
      catch (Eof)
      {
        try
        {
          var code:Int = proc.exitCode();
          if (code != 0) showPressToContinue();
        }
        catch (Exception)
          displayError("Fatality occurred while running the game!");
        break;
      } // ? this is the weirdest way to re-direct output I have ever seen.
    }
  }

  static function displayError(msg:String)
  {
    trace(msg);
    showPressToContinue();
  }

  static function showPressToContinue()
  {
    Sys.print("Press any key to continue");
    Sys.getChar(false);
  }

  private static function copyTemplate(path:String = "")
  {
    for (shard in FileSystem.readDirectory(Path.join(["../../mod_base", path])))
    {
      var fullPath:String = Path.join([path, shard]);
      if (FileSystem.isDirectory(Path.join(["../../mod_base", fullPath])))
      {
        copyTemplate(fullPath);
      }
      else
      {
        FileSystem.createDirectory(Path.join([baseGane_modDir, Mod_Directory, path]));
        File.copy(Path.join(["../../mod_base", fullPath]), Path.join([baseGane_modDir, Mod_Directory, fullPath]));
      }
    }
  }

  private static function walk(path:String = "../mod")
  {
    for (shard in FileSystem.readDirectory(path))
    {
      var fullPath:String = Path.join([path, shard]);
      if (FileSystem.isDirectory(fullPath))
      {
        walk(fullPath);
      }
      else
      {
        trace(fullPath);

        var filter:EReg = ~/package ([a-z.]+) *;/i;
        var content:String = File.getContent(fullPath);
        if (!filter.match(content))
        {
          displayError('File $fullPath is missing "package" line');
          Sys.exit(0);
        }

        var result = stripPackage ? filter.replace(content, "") : content;
        if (convertCasts) result = ~/cast *\((.*),.*\)/g.replace(result, "$1"); // strip casts (polymod doesn't need them)
        if (convertImports) result = ~/import +([a-zA-z.]*)\.[A-Z]\w+\.([A-Z]\w+);/g.replace(result, "import $1.$2;");
        if (mockPolymodCalls) result = ~/\.polymodExecFunc *\((.*),(.*)\)/sg.replace(result, ".scriptCall($1,$2)");

        var filePackage = filter.matched(1).split(".");
        filePackage[0] = Path.join([baseGane_modDir, Mod_Directory, 'scripts']);

        var targetDir = Path.join(filePackage);
        FileSystem.createDirectory(targetDir);
        trace(shard);
        File.saveContent(Path.join([targetDir, shard + "c"]), result);
      }
    }
  }

  private static function deleteDirRecursively(path:String):Void
  {
    if (sys.FileSystem.exists(path) && sys.FileSystem.isDirectory(path))
    {
      var entries = sys.FileSystem.readDirectory(path);
      for (entry in entries)
      {
        if (sys.FileSystem.isDirectory(path + '/' + entry))
        {
          deleteDirRecursively(path + '/' + entry);
          sys.FileSystem.deleteDirectory(path + '/' + entry);
        }
        else
        {
          sys.FileSystem.deleteFile(path + '/' + entry);
        }
      }
    }
  }
}
