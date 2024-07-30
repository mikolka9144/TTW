# Characters

A character is a bopper, that can sing (quite literally). To create one start by creating json file in
`mod_assets/data/characters/<char-id>.json`

Here's the format for it:
```jsonc
{
  "version": "1.0.1",
  "name": "Untitled Character", // Name to appear when displayed in chart editor
  "renderType": "multisparrow", // "sparrow", "packer", "multisparrow", "animateatlas" or "custom" depending on the type of a sprite
  "assetPath": "characters/untitled",
  "scale": 1, //scale of this character. Might mess up animations
  "healthIcon": {
    "id": "untitled", // default value for `this is a character's id
    "scale": 1,
    "flipX": false,
    "isPixel": false,
    "offsets": [0, 25]
  },
  "death":{
    "cameraOffsets": [0, 0], //introduced in 1.0.1 version of the format
    "cameraZoom": 1.0,
    "preTransitionDelay": 0.0 // delay before playing game over animation
  },
  "singTime": 8.0, // How long at minimum shuldthe character hold it's singing animation
  "flipX": false,
  "startingAnimation": "idle",
  "animations":[
    {
      "name":"Idle",
      "prefix":"idle",
      "assetPath":"characters/untitled2", // "sparrow" spritesheet to use for this animation. WORLS OLNY WITH "multisparrow" SPRITES
      "offsets": [0,0],
      "looped": false,
      "flipX": false,
      "flipY": false,
      "frameRate": 24,
      "frameIndices": [],
    }
  ],
  "offsets": [0, 0],
  "cameraOffsets": [0, 0],
  "danceEvery": 1,
  "isPixel": false,
}
```
Look [here](./../../../source/funkin/play/character/CharacterData.hx) for explanations.
The only **required** fields from here are `version`, `name`, `assetPath` and defined animations.
The animations used by default in v-slice include:
- `idle` (or `danceLeft` and `danceRight`)
- `singLEFT`
- `singDOWN`
- `singUP`
- `singRIGHT`

And additional for playable characters:
- `singLEFTmiss`
- `singDOWNmiss`
- `singUPmiss`
- `singRIGHTmiss`
- `fakeoutDeath` (there's 0.024% chance of playing this instead of `firstDeath`)
- `firstDeath` (played when entering GAME OVER)
- `deathLoop` (idle, but when dead)
- `deathConfirm` (played when the player is respawning)

Now place an icon texture to be used by it in `mod_assets/images/icons/icon-<icon-id>.png` (you might also use animated icon here).

Finally, put your character's sprite files in `mod_assets/images/<asstetPath>.*`. The files you need to copy will differ between different formats.
The most common is "sparrow", which requires .png spritesheet and .xml files to define animations.

## How to write code for them

There are 4 classes you can use to create custom code for a character:

- [`MultiSparrowCharacter`](./../../../source/funkin/play/character/MultiSparrowCharacter.hx),
- [`SparrowCharacter`](./../../../source/funkin/play/character/SparrowCharacter.hx)
- [`PackerCharacter`](./../../../source/funkin/play/character/PackerCharacter.hx)
- [`AnimateAtlasCharacter`](./../../../source/funkin/play/character/AnimateAtlasCharacter.hx)

The only difference between them is the way they're rendering your character, so make sure to pick the right one
according to the character type defined in the mod.

Alternatively, you can override [`BaseCharacter`](./../../../source/funkin/play/character/BaseCharacter.hx) to define
your own drawing logic, but that's not recommended unless you know what you're doing.

In it, you can write code that will be active only when this character is present as they're [playstate's scripted classes](./../generic/playstate-script.md).



