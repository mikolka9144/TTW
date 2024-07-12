package mod.misc;

import funkin.play.character.ScriptedCharacter.ScriptedBaseCharacter;
import funkin.modding.base.ScriptedFlxAtlasSprite;
import funkin.graphics.FunkinSprite;
import funkin.Paths;
import funkin.audio.FunkinSound;
import flixel.FlxG;
import flixel.ui.FlxButton;
import funkin.modding.base.ScriptedMusicBeatSubState;

/**
 * Example on how to create Scripted MusicBeatSubState
 *
 * There're more types supporting scripting
 */
class ExampleSubState extends ScriptedMusicBeatSubState // MusicBeatSubState
{
  public function new(message:String, val:String)
  {
    trace("creating sub-state " + message + " " + val);
    super();
  }

  //* Notice how `FunkinSprite` and `FunkinSound` have different way of using assets
  //* In `FunkinSprite` you just type the name of the asset to use
  //* While `FunkinSound` has to be resolved with `Paths.sound`
  // ! It's easy to make a mistake here
  override function create()
  {
    var bg = FunkinSprite.create(0, 0, "stageback");
    bg.height = FlxG.height;
    bg.width = FlxG.width;
    bg.updateHitbox();

    var btn:FlxButton = new FlxButton(FlxG.width / 2, FlxG.height / 2, "try to click me", () -> {
      FunkinSound.playOnce(Paths.sound("piano"), 0.6);
    });

    add(bg);
    add(btn);
    // We have a button in here, so it's good idea to show cursor here
    FlxG.mouse.visible = true;
    super.create();
  }

  override function update(elapsed:Float)
  {
    // update loop for this sub-state
    super.update(elapsed);

    //* it's recommended to have a way of existing any custom (sub)state
    if (controls.BACK)
    {
      // Exiting, so we hide cursor we showed earlier
      FlxG.mouse.visible = false;
      close();
    }
  }
}
