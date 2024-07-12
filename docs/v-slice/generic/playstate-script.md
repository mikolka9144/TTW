# `IPlayStateScriptedClass`

Some classes allow you to override behavior defined by `IPlayStateScriptedClass`, which includes
`Module`, `Stage` and `Song`.

To cancel an event fired in them simply call `event.cancel()`.

In those classes these can be additionally overridden:

> onPause(event:PauseScriptEvent):Void

Called when the game is being paused.

`event`
- `gitaroo` setting this to true will active a special pause screen

Cancelling this will prevent pausing from happening.

> onResume(event:ScriptEvent):Void

Called when resuming the game.

Canceling this will prevent the game from resuming.

> onSongLoaded(event:SongLoadScriptEvent):Void

Called when the game completes loading a chart, but before placing the notes.

`event`
- `notes` list of all notes in a song. Feel free to check/edit them.
- `events` list of all events in a song.
- `id` current song's id.
- `difficulty` current difficulty of a song.

This is not cancellable.

> onSongStart(event:ScriptEvent):Void

Called when the song starts (after the countdown)

This is not cancellable.

> onSongEnd(event:ScriptEvent):Void

Called when the song ends (hits the end)

This is not cancellable.

> onGameOver(event:ScriptEvent):Void

Called when the player dies before the game over screen appears.

This is not cancellable.
It's too late now to fix your mistakes.

You need to prevent this instead.

> onSongRetry(event:ScriptEvent):Void

Called when the player soft resets the song.

Please reset here variables you use for the `PlayState`,
otherwise you'll encounter bugs

Not cancellable ofc.

> onNoteGhostMiss(event:GhostMissNoteScriptEvent):Void

Called when the player taps a strum note when there's no note present. It isn't called with ghost tapping enabled.

`event`
- `dir` a direction of a missed note.
- `hasPossibleNotes` true if there was any note within `160.0 ms` hit window on a strum.
- `healthChange` how much health to subtract (maximum value is 2, which is an insta-kill).
- `scoreChange` how much score to subtract.
- `playSound` whethever to play "miss" sound or not.
- `playAnim` whethever to play "miss" animation or not.

Cancelling this will prevent the note from being considered a ghost miss entirely.

> onNoteIncoming(event:NoteScriptEvent):Void

Called when there is a note approaching any of the strumlines.

`event`
- `note` The note itself.
- `comboCount` *unused here*
- `healthChange` how much health to add (maximum value is 2).
- `playSound` whether to play "miss" sound (when missed).

Not cancellable.

> onNoteHit(event:HitNoteScriptEvent):Void

Called when either player or opponent hits the note. You can check if the player hit it using `event.note.noteData.getMustHitNote()`.

`event`
- `note` The note itself.
- `comboCount` New note combo number.
- `healthChange` How much health to add (maximum value is 2).
- `playSound` *unused here*
- `hitDiff` Ms delay between the note and a key press.
- `isComboBreak` If true, breaks the combo.
- `score` Score to add for this note hit.
- `judgement` The judgement the player received for this note.

Canceling this will stop the not from being considered as "hit", which might lead to it being missed.

> onNoteMiss(event:NoteScriptEvent):Void

Called when ANYONE misses a note (which in 99.9% of cases is the player)

`event`
- `note` The note itself.
- `comboCount` new combo count (it's 0, just like the days since the last drama)
- `healthChange` how much health to add (maximum value is 2).
- `playSound` whether to play "miss" sound.

Canceling this will stop the note from being considered as missed.

> onSongEvent(event:SongEventScriptEvent):Void

Callen when an event in a song gets reached.

`event`
- `eventData` stores the song event itself.

Cancelling this will prevent said song event from running.

> onStepHit(event:SongTimeScriptEvent):Void

Called on every step of currently playing music (sometimes outside of PlayState)

`event`
- `step` current step of a music.
- `beat` current beat of a music.

Not cancellable.

> onBeatHit(event:SongTimeScriptEvent):Void

Called on every beat of currently playing music (sometimes outside of PlayState)

`event`
- `beat` current beat of a music.
- `step` current step of a music.

Not cancellable.

> onCountdownStart(event:CountdownScriptEvent):Void

Called when the countdown for a song is starting

`event`
- `step` current step of a countdown (as a `CountdownStep` enum)

Cancelling this will prevent the countdown from starting.

NOTE:
To start the song after canceling this you have to call `Countdown.performCountdown()`, which will call this method again.

Make sure to **not** cancel it again.

> onCountdownStep(event:CountdownScriptEvent):Void

Called on every tick of a countdown.

`event`
- `step` current step of a countdown (as a `CountdownStep` enum)

Cancelling this will pause the countdown. To resume it call `PlayState.resumeCountdown()`

> function onCountdownEnd(event:CountdownScriptEvent):Void

Called **after** the countdown ends.

`event`
- `step` current step of a countdown (as a `CountdownStep` enum)

Not cancellable.
