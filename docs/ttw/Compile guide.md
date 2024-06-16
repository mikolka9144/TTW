# How to setup this project
This step-by-step guide will help you set up this project for v-slice mod creation. Keep in mind, that there might be some bugs and you should use your head while following it.

In case you stumble upon any problem, check [common issues](./issues.md) for potential solutions.

0. Setup
    - Install Haxe from [Haxe.org](https://haxe.org)
    - Install [Visual Studio](https://code.visualstudio.com/Download) or [VSCodium](https://vscodium.com/#install)
    - Install [Git](https://git-scm.com/)
    - Install lime by typing `haxelib --global install lime` in any terminal program
1. Download the project
    - run ` git clone https://github.com/mikolka9144/TTW.git --depth 1` to download this template.

        if you decide to just download files instead, make sure you have repo created with at least one commit

2. Open project in **Vs code** or **VSCodium**
    - If prompted with `Do you trust the authors of the files in this folder?`, select "Yes, I trust the authors"
    - Under "Build and Run" start `Download Asstes`
        - if you can't see the output, see [here](./issues.md#i-ran-a-task-but-i-cant-see-any-output)
    - Search for `@recommended ` extensions to install necessary extensions and install them
3. Open terminal within VsCode (using **Ctr+Shift+`**)
    - Check if `lime` command is available to you
        - if not, check [here](./issues.md#command-lime-is-not-available)
    - Install `hmm` (run `haxelib --global install hmm` and then `haxelib --global run hmm setup`)
    - set target configuration in `Lime: Select Target Configuration` to your native platform (Windows,Linux or Mac)
    - Run `haxelib newrepo` to create a repo for dependencies
    - Install all required haxelibs by running `hmm install`
    - Restart IDE
4. Prepare the code
    - create "funkinGame" folder and put in it a copy of a V-slice compatible engine (on v.0.4.1)
    - install any extra mods you want to make use of

And you *should* be good to go.
### TIP: if you Haxe issues with IDE, a simple restart fixes *most of* the problems
