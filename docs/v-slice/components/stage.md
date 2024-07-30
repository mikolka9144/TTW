# Stages

Stages are places, where the true action happens. They define everything that's happening behind the character's rap to the music.

To create a stage, simply create a file in `mod_base/data/stages/stageId.json`.

Here's the format:

```jsonc
{
  "version": "1.0.0",
  "name": "Main Stage", // Name in a chart editor
  "cameraZoom": 1.1, // default camera zoom
  "props": [
    {
      "danceEvery": 0, // how often to beat (in beats)
      "zIndex": 10, // index of a sprite (props with higher zIndex appear in front of others)
      "position": [-600, -200],
      "scale": [1, 1],
      "animType": "sparrow", // type of animated sprite ('sparrow' or 'packer')
      "name": "stageBack", //prop's name
      "isPixel": false,
      "assetPath": "stageback", // path to sprite's image (or hex color)
      "scroll": [0.9, 0.9], // scroll factor (https://snippets.haxeflixel.com/camera/scrollfactor/)
      "animations": []
    }
  ],
  "characters": {
    "bf": {
      "zIndex": 300,
      "position": [989.5, 885],
      "cameraOffsets": [-100, -100]
    },
    "dad": {
      "zIndex": 200,
      "position": [335, 885],
      "cameraOffsets": [150, -100]
    },
    "gf": {
      "zIndex": 100,
      "cameraOffsets": [0, 0],
      "position": [751.5, 787]
    }
  }
}

```

# How to write the code

Extend [Stage](./../../../source/funkin/play/stage/Stage.hx) class in your scripted class and override the constructor providing the stage's ID to it.

Here you can write code that will run only when this stage is active as it's a [playstate's scripted class](./../generic/playstate-script.md).

Here's a small list of methods you can use:
- `addProp(prop:StageProp, ?name:String)` adds a prop on a stage
- `addBopper(bopper:Bopper, ?name:String)` adds a bopper on a stage
- `getNamedProp(name:String):StageProp` gets a prop from a stage

In addition, you can override the following methods:

> onDestroy(event:ScriptEvent):Void

Called when exiting from a stage. If you have anything to clean up, this should be the place to do it
