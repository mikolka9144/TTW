package mod;

import flixel.FlxG;
import funkin.modding.base.ScriptedMusicBeatSubState;
import funkin.modding.events.ScriptEvent.UpdateScriptEvent;
import funkin.modding.module.ModuleHandler;
import funkin.ui.options.PreferencesMenu;
import funkin.ui.options.OptionsState;
import funkin.ui.options.OptionsState.PageName;
import funkin.modding.events.ScriptEvent.StateChangeScriptEvent;
import funkin.modding.module.Module;

/**
 * This is example module showing how to manipulate game's states
 */
class ExampleModule extends Module
{
  public function new()
  {
    super("test module", 1000);
  }

  override function onStateChangeEnd(ev:StateChangeScriptEvent)
  {
    //* Typical way to check if we're in a desired state
    if (Std.isOfType(ev.targetState, OptionsState))
    {
      //* We know a state's type here
      var setState = cast(ev.targetState, OptionsState);
      //* so we can cast to it here

      var prefs = cast(setState.pages.get(PageName.Preferences), PreferencesMenu);
      // Inject options to the options menu
      prefs.createPrefItemCheckbox("test option", "", (v) -> {
        // Obtaining "remote" module in ./misc/RemoteModule.hx
        var funnyModule = ModuleHandler.getModule("remote");

        // calling custom function from "remote"
        funnyModule.scriptCall("remoteCall", ["classic"]);
        //* As you can see it's displayed as a 'missing field'

        //* but with `mockPolymodCalls` enabled you can do this
        funnyModule.polymodExecFunc("remoteCall", ["new and improved"]);
      }, false);
    }
    super.onStateChangeEnd(ev);
  }

  //* this method runs on every update in EVERY STATE
  override function onUpdate(event:UpdateScriptEvent)
  {
    if (FlxG.keys.justPressed.F1)
    {
      // If you press F1, we bring you to test subState
      var subState = ScriptedMusicBeatSubState.init("ExampleSubState");
      FlxG.state.openSubState(subState);
    }
    super.onUpdate(event);
  }
}
