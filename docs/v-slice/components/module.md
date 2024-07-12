# Modules

[Modules](./../../../source/funkin/modding/module/Module.hx) are the most basic code component of any mod as they run across the entire game.

Make sure to override the default constructor, which will let you define its name as well as its priority (the higher the priority, the later it'll run).

It's [playstate's scripted class.](./../generic/playstate-script.md)

Other than that, it also exposes `active` field, which lets you disable or enable a module.

Additional override methods:

> onStateChangeBegin(event:StateChangeScriptEvent):Void

Gets triggered at the **beginning** of any state transition.
Here you can set fields in specific states or other things that must be done **before it creates itself**.

Changing to other states here will fail!!

`event`
- `targetState` the state the game will switch to.

  To use this properly first check if it's the type of state you want to change with `Std.isOfType(evevt.targetState, <State type>)`, then put it in a variable like this:
  `var state = cast(event.targetState, <State type>)`.

> onStateChangeEnd(event:StateChangeScriptEvent):Void

Gets triggered at the **end** of any state transition.
Here you can set fields in specific states or other things that must be done **after it creates itself**.

Here you can safely travel to other states.

`event` works here the same way as above.

> onSubStateOpenBegin(event:SubStateScriptEvent):Void

Gets triggered at the **start** of **opening** a substate.

`event`
- `targetState` the substate the game will switch to.

> onSubStateOpenEnd(event:SubStateScriptEvent):Void

Gets triggered at the **end** of **opening** for a substate. `event` works here the same way as above.

> onSubStateCloseBegin(event:SubStateScriptEvent):Void

Gets triggered at the **start** of **closing** for a substate. `event` works here the same way as above.

> onSubStateCloseEnd(event:SubStateScriptEvent):Void

Gets triggered at the **end** of **closing** for a substate. `event` works here the same way as above.
