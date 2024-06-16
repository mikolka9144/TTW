# Features
Here's the list of features as described in the flags located in [Test.tx](../../source/Test.hx)

### Casting objects `convertCasts`

If you know the exact type of a generic variable (like the type of state from ev.targetState) you may cast it using `cast (<field>,<type>)` eg. `cast (ev.targetState,OptionsState)`.
> **DO NOT USE** `cast <field>` (`cast ev.targetState`)

### Fixing imports `convertImports`

Attempts to fix Polymod issues with importing nested types:

that means
- `import funkin.modding.events.ScriptEvent.StateChangeScriptEvent;`
- turns into `import funkin.modding.events.StateChangeScriptEvent;`

### Clean up package header `stripPackage`

Removes `package` definition from files (at the beginning of the file)

### Module.scriptCall() fix `mockPolymodCalls`

Allows you to use a documented `Module.`polymodExecFunc()` function instead of the missing one.
It will be converted to the `Module.scriptCall()` once compiled.
