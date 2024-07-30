# Animation types

Throughout the documentation and Internet, you may stumble upon different types of sprite types possible to use with FNF. Here's a short explanation of all of these:

## Sparrow

Sparrow sprites are the most classic sprites used by FNF modding in general. It's also the default type in many cases.

They're composed of:
- `.png` file containing all animation frames for this sprite.
- `.xml` file defining all animations contained in a `.png` counterpart.

## MultiSparrow

MultiSparrow sprites are sprites composed of multiple sparrow sprites.

For instance, you might have BF's singing animations in one sparrow sprite and animation for his game over in a different one.

## Atlas

Atlas sprites are by far the most complex sprites you can use. They're derived from Adobe Animate texture atlas.

They're composed of these files contained in a `folder` named after the atlas's name:
- `Animation.json` contains the definitions for animations.
- `spritemap1.png` contains graphics for frames used in animations
- `spritemap1.json` defines frames in `spritemap1.png`

## Packer

Older format for packing many sprites into one. [More here](https://web.archive.org/web/20210629134517/https://archive.codeplex.com/?p=spritesheetpacker)

It's not recommended to use them, instead use the rest of the formats.

They're composed of:
- `.png` file containing all animation frames for this sprite.
- `.txt` file defining all animations contained in a `.png` counterpart.

## Custom

Guess what? You have to define your custom logic for rendering sprites.
