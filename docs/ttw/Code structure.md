# Code structure

### mod_base

>contains native assets for the v-slice mod. Anything that would normally be under mod assets lies here

### source/funkin

>Base game code (duh!)

### source/ttw

>Contains script files used by compilation tasks

### source/mod

>Contains scripts using a new format. Once compiled they'll be added to `scripts` folder in the mod based on their package location

### assets, art

>Required for macros to run. **DO NOT TOUCH THEM.**

### funkinGame

>That's where you drop your V-slice engine to be used for testing the mod
