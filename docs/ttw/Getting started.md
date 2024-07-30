# Getting started

There are many approaches you could take from this point on.
Instead I'll guide you through the most important parts of this template:

## `mod_base` folder

This folder contains all non-code assets of your mod. If you're working with already existing mod, then that's the place for all the files of the mod.

It's also possible to put there ".hxc" files (more on that later)

## `mod_base/data` folder

This folder houses all data related things of your mod. For most of them you can simply create a file "<id>.json" and use included json scemas to create said object (for now works with levels,stages and characters).

## `fnfc_files` folder

This folder stores all songs used by the mod in `.fnfc` format. You don't necessary have to use it, but will make editing songs in FNF's chart editor much easier.

## `source/mod` folder

This folder houses all script files, that will be later compiled with the rest of files in `mod_base`.

The structure made in this folder will be replicated in "scripts" folder of your mod merging with `mod_base/scripts` if you decide to put any scripts outside this template (like song events).

It's recommended to put there all files from "scripts" folder of your mod into this one.
While doing so remember to:
- change `.hxc` extension to `.hx`
- add `package` line to them (your IDE should help you with that or look into examples included)

## Getting your funkin mod to **funk**

To see your mod in action head over to "Run and Debug" section of your IDE,which has necessary task to let you playtest your mod:
- `Download assets` *no need to use this at this point*
- `Compile Mod` Exports your mod to a v-slice engine located in "funkinGame". It'll be put in "funkinGame/mods/workbench" unless otherwise defined in "Test.hx".
- `Launch Mod` Starts up your engine (stopping this task will also stop the game. Useful in some cases)
- `Compile&Launch mod` Runs `Compile Mod` and `Launch Mod` in one go.
- `Export Mod` Packs your mod into a .zip file and drops it in the root directory. You can choose it's name and set new version for your mod (if you keep forgetting about it like I do)
