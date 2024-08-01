package;

import haxe.io.Bytes;
import haxe.macro.Expr.Catch;
import haxe.zip.Reader;
import haxe.zip.Entry;
import haxe.zip.Writer;
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

  // location of v-slice engine directory (beginning in root directory)
  public static var baseGameDir:String = "funkinGame";

  public static var modAssetsDir:String = "mod_base";

  public static var fnfcFilesDir:String = "fnfc_files";

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
  // location of v-slice engine's "mods" directory (beginning in "source/ttw" folder)
  public static var baseGane_modDir:String = '../../$baseGameDir/mods';

  //* INTERNAL CONFIG END
  public static function main()
  {
    var args = Sys.args();
    trace(args);
    var compileMode:String = args.length == 1 ? args[0] : "";
    try
    {
      switch (compileMode)
      {
        case "just-run":
          {
            Task_RunGame();
          }
        case "just-compile":
          {
            Task_CompileGame();
            trace("Done!");
          }
        case "run":
          {
            Task_CompileGame();
            Task_RunGame();
          }
        case "export":
          {
            Task_ExportGame();
            trace("Done!");
          }
        default:
          {
            displayError('Compile task ${compileMode} is not defined. Are you sure you typed that correctly?');
          }
      }
    }
    catch (x:Exception)
    {
      displayError('Fatal error occurred while running in "$compileMode" :\n\n${x.details()}\n');
    }
  }

  static function Task_ExportGame()
  {
    if (!isManifestPresent()) Sys.exit(0);
    var manifestPath = '../../$modAssetsDir/_polymod_meta.json';
    var poly_json = File.getContent(manifestPath);

    var varGetter:EReg = ~/"mod_version": *"([0-9.]+)" */i;
    if (!varGetter.match(poly_json))
    {
      displayError('It seems like your "_polymod_meta.json" is missing a "mod_version" attribute...');
      Sys.exit(0);
    }
    Sys.print("Type in a name for your exported file (without .zip):");
    var userModName = Sys.stdin().readLine();
    Sys.print('What version number should be used for this mod version? Leave blank to use the current one (${varGetter.matched(1)}): ');
    var userModVersion = Sys.stdin().readLine();

    if (userModVersion != "")
    {
      var validator:EReg = ~/[0-9.]+/i;
      if (!validator.match(userModVersion))
      {
        displayError("Invalid version string. Use Semacic versioning here!");
        return;
      }
      var new_poly = varGetter.replace(poly_json, '"mod_version": "${userModVersion}"');
      File.saveContent(manifestPath, new_poly);
      trace('Updated you mod\'s version to ${userModVersion}');
    }

    Task_CompileGame();

    // create the output file
    var out = sys.io.File.write('../../${userModName}.zip', true);
    var zip = new haxe.zip.Writer(out);
    var nodes = getEntries(Path.join([baseGane_modDir, Mod_Directory]));
    nodes.add(createIgnoreNode());

    zip.write(nodes);
  }

  static function isManifestPresent():Bool
  {
    var manifestPath = '../../$modAssetsDir/_polymod_meta.json';

    if (!FileSystem.exists(manifestPath))
    {
      displayError("Your mod doesn't contain \"_polymod_meta.json\". Please create a valid metadata file for this mod first!");
      return false;
    }
    return true;
  }

  static function Task_CompileGame()
  {
    if (!isManifestPresent()) Sys.exit(0);
    deleteDirRecursively(Path.join([baseGane_modDir, Mod_Directory]));
    copyTemplate();
    compileFnfcFiles();
    compileModCode();
  }

  static function compileFnfcFiles()
  {
    var root = "../../" + fnfcFilesDir;
    FileSystem.createDirectory(root);
    trace("[STAGE] Compiling FNFC...");

    scanDirectory(root, s -> {
      if (!s.endsWith(".fnfc"))
      {
        trace('[WARN] $s is not a valid chart file. Ignoring!');
        return;
      }
      var zip = Reader.readZip(File.read(Path.join([root, s])));
      trace(s.substr(1));

      var fnfc_manifestList = zip.filter(s -> s.fileName == "manifest.json");
      if (fnfc_manifestList.length != 1)
      {
        displayError('File $s doesn\'t contain a valid "manifest.json" file');
        Sys.exit(0);
      }
      var fnfc_manifest = fnfc_manifestList.first().data.toString();
      var varGetter:EReg = ~/"songId": *"(.+)" */i;
      if (!varGetter.match(fnfc_manifest))
      {
        displayError('It seems like "manifest.json" in $s is missing a "songId" attribute...');
        Sys.exit(0);
      }
      var songId = varGetter.matched(1);
      for (node in zip)
      {
        var target_File = "";
        if (node.fileName.endsWith(".json"))
        {
          target_File = Path.join([baseGane_modDir, Mod_Directory, "data/songs", songId, node.fileName]);
        }
        else if (node.fileName.endsWith(".ogg"))
        {
          target_File = Path.join([baseGane_modDir, Mod_Directory, "songs", songId, node.fileName]);
        }
        else
        {
          trace('[WARN] file ${node.fileName} is not known to be valid. Ignoring!');
          continue;
        }
        FileSystem.createDirectory(Path.directory(target_File));
        File.saveBytes(target_File, node.data);
      }
    }, s -> {});
  }

  static function Task_RunGame()
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

  static function getEntries(dir:String, entries:List<haxe.zip.Entry> = null, inDir:Null<String> = null)
  {
    if (entries == null) entries = new List<Entry>();
    if (inDir == null) inDir = dir;

    scanDirectory(dir, s -> {
      var path = haxe.io.Path.join([dir, s]);
      var bytes:haxe.io.Bytes = haxe.io.Bytes.ofData(sys.io.File.getBytes(path).getData());
      var entry:haxe.zip.Entry =
        {
          fileName: StringTools.replace(path, inDir, ""),
          fileSize: bytes.length,
          fileTime: Date.now(),
          compressed: false,
          dataSize: FileSystem.stat(path).size,
          data: bytes,
          crc32: haxe.crypto.Crc32.make(bytes)
        };
      entries.push(entry);
    }, s -> {});
    return entries;
  }

  static function createIgnoreNode():haxe.zip.Entry
  {
    return {
      fileName: ".disable_gb1click",
      fileSize: 0,
      fileTime: Date.now(),
      compressed: false,
      dataSize: 0,
      data: Bytes.alloc(0),
      crc32: haxe.crypto.Crc32.make(Bytes.alloc(0))
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
    trace("[ERROR] " + msg);
    showPressToContinue();
  }

  static function showPressToContinue()
  {
    Sys.print("Press any key to continue");
    Sys.getChar(false);
  }

  private static function copyTemplate()
  {
    FileSystem.createDirectory("../../" + modAssetsDir);
    scanDirectory("../../" + modAssetsDir, s -> {
      FileSystem.createDirectory(Path.join([baseGane_modDir, Mod_Directory, Path.directory(s)]));
      File.copy('../../$modAssetsDir/$s', Path.join([baseGane_modDir, Mod_Directory, s]));
    }, s -> {});
  }

  static function safelyCopyFile(from:String, to:String)
  {
    FileSystem.createDirectory(Path.directory(to));
    File.copy(from, to);
  }

  private static function compileModCode(path:String = "../mod")
  {
    trace("[STAGE] Compiling HX code...");

    scanDirectory(path, s -> {
      var shard = Path.join([path, s]);

      var filter:EReg = ~/package ([a-z.]+) *;/i;
      var content:String = File.getContent(shard);
      if (!filter.match(content))
      {
        displayError('File $shard is missing "package" line');
        Sys.exit(0);
      }

      var result = stripPackage ? filter.replace(content, "") : content;
      if (convertCasts) result = ~/cast *\((.*),.*\)/g.replace(result, "$1"); // strip casts (polymod doesn't need them)
      if (convertImports) result = ~/import +([a-zA-z.]*)\.[A-Z]\w+\.([A-Z]\w+);/g.replace(result, "import $1.$2;");
      if (mockPolymodCalls) result = ~/\.polymodExecFunc *\((.*),(\W*\[.*\]\W*)\)/g.replace(result, ".scriptCall($1,$2)");

      var filePackage = filter.matched(1).split(".");
      filePackage[0] = Path.join([baseGane_modDir, Mod_Directory, 'scripts']);

      var targetDir = Path.join(filePackage);
      FileSystem.createDirectory(targetDir);
      trace(s.substr(1));
      File.saveContent(Path.join([targetDir, Path.withoutDirectory(s) + "c"]), result);
    }, s -> {});
  }

  private static function deleteDirRecursively(path:String):Void
  {
    scanDirectory(path, s -> FileSystem.deleteFile(Path.join([path, s])), s -> FileSystem.deleteDirectory(Path.join([path, s])));
  }

  private static function scanDirectory(prefix:String, onFile:String->Void, onDir:String->Void, path:String = "")
  {
    var fullPath = Path.join([prefix, path]);
    if (FileSystem.exists(fullPath) && FileSystem.isDirectory(fullPath))
    {
      var entries = FileSystem.readDirectory(fullPath);
      for (entry in entries)
      {
        if (FileSystem.isDirectory(fullPath + '/' + entry))
        {
          scanDirectory(prefix, onFile, onDir, path + "/" + entry);
          onDir(path + '/' + entry);
        }
        else
        {
          onFile(path + '/' + entry);
        }
      }
    }
  }
}
