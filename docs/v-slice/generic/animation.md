# Animations

Animations are objects in .json files declaring available animations for said object.

Here's the format:
```jsonc
{
      "name":"Idle", // Not always present. Required for characters, level props etc.
      "assetPath":"", // allows to specify different spritesheet for a animation. WORKS ONLY WITH MULTISPARROW
      "prefix":"idle", //
      "offsets": [0,0],
      "looped": false, // Should it loop?
      "flipX": false,
      "flipY": false,
      "frameRate": 24,
      "frameIndices": [], // Allows to hand-pick frames to play (or empty to play all)
}
```
