# How to setup this project
This step-by-step guide will help you set up this project for v-slice mod creation. Keep in mind, that there might be some bugs and you should use your head while following it.

In case you stumble upon any problem, check [common issues](./issues.md) for potential solutions.

> TIP: if you have issues with your IDE, a simple restart fixes *most of* the problems

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
    - Under "Build and Run" start `Download Assets`
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
    - create "funkinGame" folder in the root directory and put into it a copy of V-slice compatible engine (on v0.4.1)

And you *should* be good to go. Head over to [Getting started](Getting%20started.md) if you're unsure what to do next.
