# Notestyles

NoteStyles Change How The Notes Look

to create a NoteStyle simply create a file in `mod_base/data/notestyles/notestyleId.json`.

Heres the format:

```jsonc
{
  "version": "1.0.0",
  "name": "Funkin'", // Name in a chart editor
  "author": "PhantomArcade", // Creator of the NoteStyle
  "fallback": null,
  "assets": {
    "note": {
      "assetPath": "shared:notes", // path for notes
      "scale": 1.0, // how big or small you want the notes
      "data": {
        "left": { "prefix": "noteLeft" },
        "down": { "prefix": "noteDown" },
        "up": { "prefix": "noteUp" },
        "right": { "prefix": "noteRight" }
      }
    },
    "noteStrumline": {
      "assetPath": "shared:noteStrumline", // path for strumline
      "scale": 1.55, // how big or small you want the strumline
      "offsets": [0, 0],
      "data": {
        "leftStatic": { "prefix": "staticLeft0" },
        "leftPress": { "prefix": "pressLeft0" },
        "leftConfirm": { "prefix": "confirmLeft0" },
        "leftConfirmHold": { "prefix": "confirmLeft0" },
        "downStatic": { "prefix": "staticDown0" },
        "downPress": { "prefix": "pressDown0" },
        "downConfirm": { "prefix": "confirmDown0" },
        "downConfirmHold": { "prefix": "confirmDown0" },
        "upStatic": { "prefix": "staticUp0" },
        "upPress": { "prefix": "pressUp0" },
        "upConfirm": { "prefix": "confirmUp0" },
        "upConfirmHold": { "prefix": "confirmUp0" },
        "rightStatic": { "prefix": "staticRight0" },
        "rightPress": { "prefix": "pressRight0" },
        "rightConfirm": { "prefix": "confirmRight0" },
        "rightConfirmHold": { "prefix": "confirmRight0" }
      }
    },
    "holdNote": {
      "assetPath": "NOTE_hold_assets", // path for Holds
      "data": {}
    },
    "noteSplash": {
      "assetPath": "", // path for splashes
      "data": {
        "enabled": true
      }
    },
    "holdNoteCover": {
      "assetPath": "", // path for Sustain Splashes
      "data": {
        "enabled": true
      }
    }
  }
}

```

No Classes to extend you can do anythng in the json
