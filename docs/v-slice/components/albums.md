# Album

Albums are a little cover boxes, that appear on the right side of a freeplay menu.

WARNING: This section won't be completed until the devs add a *proper* system for creating custom albums.
It's truly too janky for a typical coder. You have been warned.


To create one simple create a file in `mod_assets/data/ui/freeplay/albums/album-id.json`.

Here's the format:
```jsonc
{
  "version": "1.0.0",
  "name": "Volume 1", // Readable name (unused as of now)
  "artists": ["Kawai Sprite"], // Artists of this album (or anyone else. It's not like I care)
  "albumArtAsset": "freeplay/albumRoll/volume1", // Path to the album art image
  "albumTitleAsset": "freeplay/albumRoll/fnf-ost-v1", // Path to the album's title sprite
  "albumTitleAnimations": [
    {
      "name": "active",
      "prefix": "fnf ost vol 1 active0"
    },
    {
      "name": "idle",
      "prefix": "fnf ost vol 1 idle0"
    }
  ]
}
```

And here comes the fun part: creating textures

All album texture are located in an atlas sprite in `freeplay/albumRoll/freeplayAlbum` (yes, ALL of them).

Here you need to add the following animations to it for your custom album:
- animation for idling
- animation for transition
- animation for "active" (for intro I think)

Now modify the map in `FreeplayState.albumRoll.animNames` to map the following:
- `albumId-idle`
- `albumId-trans`
- `albumId-active`

I TRULY CAN'T GUARANTEE THAT THIS WILL WORK.

# How to write code

Simply extend the `Album` class in your script and override the constructor proved the `id` for your album.

There's not that much you can do with it rn as the entire system is too reliant on hardcoding.
