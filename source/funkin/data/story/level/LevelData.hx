package funkin.data.story.level;

import funkin.data.animation.AnimationData;

/**
 * A type definition for the data in a story mode level JSON file.
 * @see https://lib.haxe.org/p/json2object/
 */
typedef LevelData =
{
  /**
   * The version number of the level data schema.
   * When making changes to the level data format, this should be incremented,
   * and a migration function should be added to LevelDataParser to handle old versions.
   */
  @:default(funkin.data.story.level.LevelRegistry.LEVEL_DATA_VERSION)
  public var version:String;

  /**
   * The title of the level, as seen in the top corner.
   */
  public var name:String;

  /**
   * The graphic for the level, as seen in the scrolling list.
   */
  @:jcustomparse(funkin.data.DataParse.stringNotEmpty)
  public var titleAsset:String;

  /**
   * The props to display over the colored background.
   * In the base game this is usually Boyfriend and the opponent.
   */
  @:default([])
  public var props:Array<LevelPropData>;

  /**
   * Whether this week is visible in the story menu.
   * @default `true`
   */
  @:default(true)
  @:optional
  public var visible:Bool;

  /**
   * The list of song IDs included in this level.
   */
  @:default(['bopeebo'])
  public var songs:Array<String>;

  /**
   * The background for the level behind the props.
   */
  @:default('#F9CF51')
  @:optional
  public var background:String;
}

/**
 * Data for a single prop for a story mode level.
 */
typedef LevelPropData =
{
  /**
   * The image to use for the prop. May optionally be a sprite sheet.
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
   * The opacity to render the prop at.
   * @default 1.0
   */
  @:default(1.0)
  @:optional
  public var alpha:Float;

  /**
   * If true, the prop is a pixel sprite, and will be rendered without smoothing.
   */
  @:default(false)
  @:optional
  public var isPixel:Bool;

  /**
   * The frequency to bop at, in beats.
   * 1 = every beat, 2 = every other beat, etc.
   * Supports up to 0.25 precision.
   * @default 1.0
   */
  @:default(1.0)
  @:optional
  public var danceEvery:Float;

  /**
   * The offset on the position to render the prop at.
   * @default [0.0, 0.0]
   */
  @:default([0, 0])
  @:optional
  public var offsets:Array<Float>;

  /**
   * A set of animations to play on the prop.
   * If default/empty, the prop will be static.
   */
  @:default([])
  @:optional
  public var animations:Array<AnimationData>;
}
