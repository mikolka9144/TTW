# FNF Music beat states

These classes are meant to allow you to use the game's default behavior in your custom screens.
While it's also possible to use Flixel's classes for it, it's recommended to use those instead:

- [`MusicBeatState`](./../../../source/funkin/ui/MusicBeatState.hx) over `FlxState`
- [`MusicBeatSubState`](./../../../source/funkin/ui/MusicBeatSubState.hx) over `FlxSubState`

## Additional functionality

- You have access to a special `controls` variable, which allows you to easily use the game's input system
- Additional right and left watermark texts are present, so you can easily put some funnies in them or sth.
- `refresh()` function for re-ordering things if you need to...
- both `F4` (emergency exit) and `F5` (hot reload) keys working as intended
- access to both `stepHit()` and `beatHit()` methods to override
