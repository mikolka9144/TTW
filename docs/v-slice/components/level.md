# Levels

Levels are just "weeks" that appear in the story mode menu.

To make one simply create a file in `mod_assets/data/levels/week-name.json` and write week data In the following format:

```jsonc
{
  "version": "1.0.1", // Level format version
  "name": "test", // Week's title
  "titleAsset": "storymenu/titles/week1", // An image to use in a week selection box
  "props": [ // List of "props" to render on a week's background (kinda like psych's backgrounds)
    {
      "assetPath": "storymenu/props/dad",
      // Either prop's image, spritesheet (with animations) or a static hex color
      "scale": 1.0, // optional scale to render the sprite in
      "alpha": 1.0, // optional opacity to render the sprite in
      "danceEvery":1, // optional interval (in beats) between sprete's bopping
      "isPixel": false,
      "offsets": [100, 60],
      "animations": [ // Animations for this prop
        {
          "name": "idle",
          "prefix": "idle0",
          "frameRate": 24
        }
      ]
    }
  ],
  "background": "#F9CF51", // hexadecimal color for a background or a path to background image
  "songs": ["bopeebo", "fresh", "dadbattle"] // List of song ids for this week/level
}

```

The following animations are used by v-slice:
- `idle` (or `danceLeft` and `danceRight`) for bopping
- `confirm` when the player selects a week/level

# How to write code

Simply extend `Level` class in your script and override the constructor supplying an `id` of a level/week you want to script to.

The following methods are available to override:

> getSongs():Array<String>

Returns a list of song IDs for this week/level.
Weekend1 overrides this to hide a secret song if you haven't completed it yet, but no reason to not use this for other purposes.

> getSongDisplayNames(difficulty:String):Array<String>

Returns a list of song names for this week/level to display in a "Tracks" list in the story menu.

> isUnlocked():Bool

Tells if this week/level is locked. Simple enough.

> isVisible():Bool

Tells if this week/level should be displayed in a story mode.

> isBackgroundSimple():Bool

Tells if your background is a simple color (true) or instead an image or something else (false)

> buildProps(?existingProps:Array<LevelProp>):Array<LevelProp>

Returns a list of props to place on a week's background.
Conveniently you have access to props defined in a .json file, so feel free to add some custom ones too.

> buildBackground():FlxSprite

If `isBackgroundSimple()` returns false, this allows you to create your custom logic to create a custom sprite for a background.

One use could be creating an animated background instead of a static one.
