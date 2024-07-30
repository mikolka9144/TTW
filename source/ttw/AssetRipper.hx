package;

import sys.io.File;
import haxe.io.Path;
import haxe.Http;
import sys.FileSystem;

class AssetRipper
{
  // I hate you Eric
  public static var nodes:Array<String> = [
    "LICENSE.md",
    "exclude/data/credits.json",
    "exclude/data/ui/chart-editor/main-view.xml",
    "exclude/data/ui/chart-editor/components/style.xml",
    "exclude/data/ui/chart-editor/components/menubar.xml",
    "exclude/data/ui/chart-editor/components/playbar-head.xml",
    "exclude/data/ui/chart-editor/components/playbar.xml",
    "exclude/data/ui/chart-editor/context-menus/default.xml",
    "exclude/data/ui/chart-editor/context-menus/event.xml",
    "exclude/data/ui/chart-editor/context-menus/hold-note.xml",
    "exclude/data/ui/chart-editor/context-menus/note.xml",
    "exclude/data/ui/chart-editor/context-menus/selection.xml",
    "exclude/data/ui/chart-editor/context/test.xml",
    "exclude/data/ui/chart-editor/dialogs/about.xml",
    "exclude/data/ui/chart-editor/dialogs/character-icon-selector.xml",
    "exclude/data/ui/chart-editor/dialogs/edit-song-event.xml",
    "exclude/data/ui/chart-editor/dialogs/upload-chart.xml",
    "exclude/data/ui/chart-editor/dialogs/upload-vocals-entry.xml",
    "exclude/data/ui/chart-editor/dialogs/upload-vocals.xml",
    "exclude/data/ui/chart-editor/dialogs/welcome.xml",
    "exclude/data/ui/chart-editor/toolboxes/difficulty.xml",
    "exclude/data/ui/chart-editor/toolboxes/event-data.xml",
    "exclude/data/ui/chart-editor/toolboxes/freeplay.xml",
    "exclude/data/ui/chart-editor/toolboxes/metadata.xml",
    "exclude/data/ui/chart-editor/toolboxes/note-data.xml",
    "exclude/data/ui/chart-editor/toolboxes/offsets.xml",
  ];
  public static var downTemplate = "https://raw.githubusercontent.com/FunkinCrew/funkin.assets/main/";

  public static function main()
  {
    if (FileSystem.exists("../../assets"))
    {
      trace("Assets already present (remove 'assets' folder to redownload them)");
      showPressToContinue();
      return;
    }
    FileSystem.createDirectory("../../assets");
    for (x in nodes)
    {
      var dir = Path.directory(x);
      FileSystem.createDirectory("../../assets/" + dir);
      File.saveContent("../../assets/" + x, Http.requestUrl(downTemplate + x));
      trace(x);
    }
    return;
  }

  static function showPressToContinue()
  {
    Sys.print("Press any key to continue");
    Sys.getChar(false);
  }
}
