# Song event

[`SongEvent`](./../../../source/funkin/play/event/SongEvent.hx) is the type of event that is placed in a chart editor on the right side of the arrows.

To implement one start by extending `SongEvent` in your class.

Then override a constructor and put an unique `id` for it.

Song events gives you 5 methods to override:

> HandleEvent(data:SongEnevtData):Void

This method **must be overritten** and allows you to handle events of your type that gets triggered.

TLDR: Just put your event's action here.

> getEventSchema():SongEventSchema

Returns a scema for this event.

A schema is actually an array of "schema fields". There're multiple types of them and depending on a `type` you choose it'll behave differently.

Here's a few examples:

```cs
[
  { // Simple text field allowing to enter any text to it
    name: "stringVal", // The name of the property (for use in event data)
    title: "String 1", // The title to display in the charter
    type: "string",
    defaultValue: "", // A default value for it
  },
  { // A checkbox (true/false value)
    name: "IsFunky", // The name of the property (for use in event data)
    title: "Do you get freaky?", // The title to display in the charter
    type: "bool", // type of a field.
    defaultValue: true, // A default value for it
  },
  { // Number picker for "float" values
    name: "lt", // The name of the property (for use in event data)
    title: "How many BFs you want?", // The title to display in the charter
    type: "float", // type of a field.
    defaultValue: 0.5, // A default value for it
    max: 2, // Maximum number for this field
    min: 0, // Minimum number for this field
    step: 1 // How much should the value advance from min to max
  },
  { // Number picker for "integer" values
    name: "lt", // The name of the property (for use in event data)
    title: "How many BFs you want?", // The title to display in the charter
    type: "integer", // type of a field.
    defaultValue: 0, // A default value for it
    max: 2, // Maximum number for this field
    min: 0, // Minimum number for this field
    step: 1 // How much should the value advance from min to max
  },
  { // Selection box, that allows charter to pick an option from "keys", which have a name and corresponding value to it
    name: "NUm", // The name of the property (for use in event data)
    title: "Pick a number..", // The title to display in the charter
    type: "enum", // type of a field.
    keys: [ // options to populate selection box
      "one" => 1,
      "two" => 2,
      "three" => 3
    ],
    defaultValue: 2, // A default value for it
  }
]
```

> getIconPath():String

Returns a path (from `mod_assets/images/`) to a icon for this event to appear in a chart editor.

> getTitle():String

Returns a name of your event to display in a chart editor. Simple enough.
