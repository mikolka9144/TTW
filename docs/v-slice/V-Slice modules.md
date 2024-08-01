# V-slice Modding

> NOTE: because the devs have made official documentation for V-slice those will be removed soon. That is when knowleade currently provided by it gets integrated...

Welcome to TTW's V-slice modding documentation. Most of the things you see here are still under the writing and might have some missing information or errors of any kind.

This wiki is meant to help you better understand the V-slice modding system,
but it's also recommended to search things on your own (the game's code is located in `source/funkin`).

## General knowledge

Here's a list of documents containing some general knowledge about v-slice modding.

- [`Scripted classes`](generic/hxc-files.md)
- [`Animation types`](generic/anim-types.md)
- [`Animations in .json files`](generic/animation.md)

## Mod components

Mods can be split into different components. Some of them are just pure code while others only "allow" you to use code in them,
but they can also be used without it. Here's a list of them:

Purely scripted:
- [`Flixel native components`](./components/haxe-natives.md)
- [`Modules`](components/module.md)
- [`Song Event`](components/song-event.md)
- [`Custom states`](components/states.md)

Possible to extend with code:
- [`Characters`](components/characters.md)
- [`Levels`](components/level.md)
- [`Songs`](components/song.md)
- [`Stages`](components/stage.md)

Unusable
- [`Albums`](components/albums.md)

Not documented yet:
- ScriptedBopper
- ScriptedFunkinSprite
- FlxAtlasSprite

- ScriptedDialogueBox
- ScriptedConversation
- ScriptedSpeaker

- ScriptedNoteStyle
