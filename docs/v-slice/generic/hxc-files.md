# .hxc files

These are the files holding definitions of any scripted classes that you have created.
These are located in `mod_base/scripts`.

It's not recommended to use those with TTW, instead create them in `source/`mod` as a standard Haxe class (with .hx extension) and let the compiler take care of them for you.

## Scripted classes

.hxc files contain classes, that extend specific classes from the game itself.
Any classes that don't extend any special types might fail to work in the game.

Any class, that has a "Scripted" equivalent can be extended in your scripted class.
These classes represent standard FNF objects used by the game, which allow you to add additional content to it.

For instance, you can extend the class "Song" in your script because there's "ScriptedSong" class available.
To create an instance of a scripted class you can use `Scripted<type>.init("<className>",[<args>])`.

The general execution of code from those classes goes as follows (from up to down):
- Module
- Current Stage
- Active Characters
- current Song
- current Conversation
- Note

# TTW scripted classes

To add a new class, simply create `.hx` file in `source/mod` and use the template `class` to generate all necessary code. Don't forget to add `package` declaration to it.

Example class:
```cs
package mod;

class RemoteModule
{

}
```

Now extend it with any scripted class like so:

```cs
package mod;

import funkin.modding.module.Module;

class RemoteModule extends Module
{

}
```

Depending on the class you extend you may also override the constructor and define additional properties like so:
```cs
package mod;

import funkin.modding.module.Module;

class RemoteModule extends Module
{
  public function new()
  {
    super("exampleName", 0); // 0 is priority of this module
  }

}
```
To override any method simply type in `override` and pick the method you want to override.

Example override:
```cs
package mod;

import funkin.modding.events.ScriptEvent.SongTimeScriptEvent;
import funkin.modding.module.Module;

class RemoteModule extends Module
{
  public function new()
  {
    super("remote", 0);
  }

  override function onBeatHit(event:SongTimeScriptEvent)
  {
    super.onBeatHit(event);
    trace("Doki");
  }
}
```
