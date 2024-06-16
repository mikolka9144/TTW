# Known issues

### Private variable

If you happen to encounter an error about assessing private variable **that works in the game**: Ctl-click it, and make it public (be mindful about what exactly you're changing)

### Any weird cache compile error relating to missing classes

try cleaning all project haxelibs (except lime) and try to re-install them.

### `Error: Failed with error: X509 - Certificate verification failed, e.g. CRL, CA or signature check failed`

That's the tough one. Make sure your system is up to date.

Otherwise [this](https://community.openfl.org/t/getting-certification-error-using-haxelib-on-mac/13489/5) might help.

### Command `lime` is not available

It's likely, that you need to run `haxelib --global run lime setup` first. If it's still unavailable try either starting new terminal or restart your IDE

### Cache compilation fails with `Type not found : thx.Arrays`

That's likely because you have compilation target set to `HTML5`. To fix this just change lime target (by either clicking on a little lime target indicator, or searching in command palette for `Lime: Select Target Configuration`) to your system type.

### I ran a task, but I can't see any output

That's because the task's output is located in `Terminal` and not in `Debug console`

### Macro error with `[WARN] Could not determine current git commit; is this a proper Git repository?`

You need to initialize a git repository and create at least one commit.

simplest way to do this (from terminal):
- `git init`
- `git add .`
- `git commit -m "initial commit"`
