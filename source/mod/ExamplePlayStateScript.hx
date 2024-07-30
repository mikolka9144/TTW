package mod;

import funkin.Conductor;
import funkin.Paths;
import openfl.Lib;
import flixel.FlxG;
import funkin.modding.events.ScriptEvent;
import funkin.audio.FunkinSound;
import funkin.play.PlayState;
import funkin.modding.events.ScriptEvent.UpdateScriptEvent;
import funkin.modding.events.ScriptEvent.SongTimeScriptEvent;
import funkin.modding.module.Module;

/**
 * This class will show how to create playState scripts
 * by re-implementing sounds from charting
 */
class ExamplePlayStateScript extends Module
{
  public function new()
  {
    super("play", 0);
  }

  override function onUpdate(event:UpdateScriptEvent)
  {
    super.onUpdate(event);
    if (PlayState.instance == null || !PlayState.instance.active) return;
    //* This line checks for 2 things (inverted)
    //* 1. is there an instance of PlayState
    //* 2. is it active

    // this will run on every update IN PlayState
    Lib.application.window.title = PlayState.instance.scoreText.text;
  }

  override function onBeatHit(event:SongTimeScriptEvent)
  {
    // this will run on every in-game beat

    // ? Apparently this also runs in other states
    //* If you would like to limit this to just playState, use this:
    // if (PlayState.instance == null || !PlayState.instance.active) return;
    if (Conductor.instance.currentBeat % 4 == 0)
    {
      FunkinSound.playOnce(Paths.sound("chartingSounds/metronome1"), 0.4);
    }
    else
    {
      FunkinSound.playOnce(Paths.sound("chartingSounds/metronome2"), 0.4);
    }
    super.onBeatHit(event);
  }

  override function onStepHit(event:SongTimeScriptEvent)
  {
    // this will run on every in-game step (it's 1/4 of a beat I think)

    super.onStepHit(event);
  }

  override function onNoteHit(event:HitNoteScriptEvent)
  {
    // This runs for EVERY hitted note

    if (event.note.noteData.getMustHitNote())
    {
      //* it's player note
      FunkinSound.playOnce(Paths.sound("chartingSounds/hitNotePlayer"));
    }
    else
    {
      FunkinSound.playOnce(Paths.sound("chartingSounds/hitNoteOpponent"));
    }
    super.onNoteHit(event);
  }

  override function onDestroy(event:ScriptEvent)
  {
    super.onDestroy(event);
  }
}
