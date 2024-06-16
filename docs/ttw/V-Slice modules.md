# V-slice classes

Base game modding is done using classes, that extend specific classes from the game itself.
Any classes that don't extend any special types might fail to work in the game.

**This list is not exhaustive and there might be additional classes that can help you in modding.**

# Mod Classes

## Generic classes

These classes represent standard FNF objects used by a game, which allow you to add additional content to it.

In addition, many of them allow you to catch in-game script events (so that functionality is not exclusive to Modules).

This includes:
- [`Module`](./../../source/funkin/modding/module/Module.hx)

  Defines behavior, that can be present independently from the game's current state. They also gain priority over code from Songs and Stages.

  For this reason, you might want to make sure, that you're in the right place for your code to run
- [`Level`](./../../source/funkin/ui/story/Level.hx)

    stores information regarding FNF's 'weeks'.
    For example, this class is used to hide special song
    from displaying in story mode until the week is beaten

- [`Song`](./../../source/funkin/play/song/Song.hx)

  stores behavior for custom songs both in menus and while playing them. It's the second place for writing song-specific code (besides Stages)
- [`MultiSparrowCharacter`](./../../source/funkin/play/character/MultiSparrowCharacter.hx),
  [`SparrowCharacter`](./../../source/funkin/play/character/SparrowCharacter.hx) and
  [`PackerCharacter`](./../../source/funkin/play/character/PackerCharacter.hx)

  These three allow you to define custom behavior for a given character. Be mindful about what's the graphic type for a given character and use an appropriate class.

- [`Stage`](./../../source/funkin/play/stage/ScriptedStage.hx)

  Contains code for creating a given stage. It's not necessary to have one of those files for a modded stage if you're not intending to utilize custom stage behavior.
- [`DialogueBox`](./../../source/funkin/play/cutscene/dialogue/DialogueBox.hx)
## Scripted classes

These allow you to create objects extending commonly used types, which then can be created by `<type>.init("<className>")`.

These include:

- ScriptedModule
- ScriptedLevel
- ScriptedSong
- ScriptedMultiSparrowCharacter
- ScriptedPackerCharacter
- ScriptedSparrowCharacter
- ScriptedStage
- ScriptedDialogueBox
- ScriptedAnimateAtlasCharacter
- ScriptedAlbum
- ScriptedBaseCharacter
- ScriptedBopper
- ScriptedConversation
- ScriptedFlxAtlasSprite
- ScriptedFlxRuntimeShader
- ScriptedFlxSprite
- ScriptedFlxSpriteGroup
- ScriptedFlxSubState
- ScriptedFlxTransitionableState
- ScriptedFlxUIState
- ScriptedFunkinSprite
- ScriptedMusicBeatState
- ScriptedMusicBeatSubState
- ScriptedNoteStyle
- ScriptedSpeaker
