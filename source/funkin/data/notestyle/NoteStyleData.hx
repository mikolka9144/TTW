package funkin.data.notestyle;

import haxe.DynamicAccess;
import funkin.data.animation.AnimationData;

/**
 * A type definition for the data in a note style JSON file.
 * @see https://lib.haxe.org/p/json2object/
 */
typedef NoteStyleData =
{
  /**
   * The version number of the note style data schema.
   * When making changes to the note style data format, this should be incremented,
   * and a migration function should be added to NoteStyleDataParser to handle old versions.
   */
  @:default(funkin.data.notestyle.NoteStyleRegistry.NOTE_STYLE_DATA_VERSION)
  public var version:String;

  /**
   * The readable title of the note style.
   */
  public var name:String;

  /**
   * The author of the note style.
   */
  public var author:String;

  /**
   * The note style to use as a fallback/parent.
   * @default null
   */
  @:optional
  public var fallback:Null<String>;

  /**
   * Data for each of the assets in the note style.
   */
  public var assets:NoteStyleAssetsData;
}

typedef NoteStyleAssetsData =
{
  /**
   * The sprites for the notes.
   * @default The sprites from the fallback note style.
   */
  @:optional
  public var note:NoteStyleAssetData<NoteStyleData_Note>;

  /**
   * The sprites for the hold notes.
   * @default The sprites from the fallback note style.
   */
  @:optional
  public var holdNote:NoteStyleAssetData<NoteStyleData_HoldNote>;

  /**
   * The sprites for the strumline.
   * @default The sprites from the fallback note style.
   */
  @:optional
  public var noteStrumline:NoteStyleAssetData<NoteStyleData_NoteStrumline>;

  /**
   * The sprites for the note splashes.
   */
  @:optional
  public var noteSplash:NoteStyleAssetData<NoteStyleData_NoteSplash>;

  /**
   * The sprites for the hold note covers.
   */
  @:optional
  public var holdNoteCover:NoteStyleAssetData<NoteStyleData_HoldNoteCover>;
}

/**
 * Data shared by all note style assets.
 */
typedef NoteStyleAssetData<T> =
{
  /**
   * The image to use for the asset. May be a Sparrow sprite sheet.
   */
  public var assetPath:String;

  /**
   * The scale to render the prop at.
   * @default 1.0
   */
  @:default(1.0)
  @:optional
  public var scale:Float;

  /**
   * Offset the sprite's position by this amount.
   * @default [0, 0]
   */
  @:default([0, 0])
  @:optional
  public var offsets:Null<Array<Float>>;

  /**
   * If true, the prop is a pixel sprite, and will be rendered without anti-aliasing.
   */
  @:default(false)
  @:optional
  public var isPixel:Bool;

  /**
   * The structure of this data depends on the asset.
   */
  public var data:T;
}

typedef NoteStyleData_Note =
{
  public var left:UnnamedAnimationData;
  public var down:UnnamedAnimationData;
  public var up:UnnamedAnimationData;
  public var right:UnnamedAnimationData;
}

typedef NoteStyleData_HoldNote = {}

/**
 * Data on animations for each direction of the strumline.
 */
typedef NoteStyleData_NoteStrumline =
{
  public var leftStatic:UnnamedAnimationData;
  public var leftPress:UnnamedAnimationData;
  public var leftConfirm:UnnamedAnimationData;
  public var leftConfirmHold:UnnamedAnimationData;
  public var downStatic:UnnamedAnimationData;
  public var downPress:UnnamedAnimationData;
  public var downConfirm:UnnamedAnimationData;
  public var downConfirmHold:UnnamedAnimationData;
  public var upStatic:UnnamedAnimationData;
  public var upPress:UnnamedAnimationData;
  public var upConfirm:UnnamedAnimationData;
  public var upConfirmHold:UnnamedAnimationData;
  public var rightStatic:UnnamedAnimationData;
  public var rightPress:UnnamedAnimationData;
  public var rightConfirm:UnnamedAnimationData;
  public var rightConfirmHold:UnnamedAnimationData;
}

typedef NoteStyleData_NoteSplash =
{
  /**
   * If false, note splashes are entirely hidden on this note style.
   * @default Note splashes are enabled.
   */
  @:optional
  @:default(true)
  public var enabled:Bool;
};

typedef NoteStyleData_HoldNoteCover =
{
  /**
   * If false, hold note covers are entirely hidden on this note style.
   * @default Hold note covers are enabled.
   */
  @:optional
  @:default(true)
  public var enabled:Bool;
};
