package funkin.play.notes;

import flixel.util.FlxColor;

/**
 * The direction of a note.
 * This has implicit casting set up, so you can use this as an integer.
 */
enum abstract NoteDirection(Int) from Int to Int
{
  public var LEFT = 0;
  public var DOWN = 1;
  public var UP = 2;
  public var RIGHT = 3;
  public var name(get, never):String;
  public var nameUpper(get, never):String;
  public var color(get, never):FlxColor;
  public var colorName(get, never):String;

  @:from
  public static function fromInt(value:Int):NoteDirection
  {
    return switch (value % 4)
    {
      case 0: LEFT;
      case 1: DOWN;
      case 2: UP;
      case 3: RIGHT;
      default: LEFT;
    }
  }

  public function get_name():String
  {
    return switch (abstract)
    {
      case LEFT:
        'left';
      case DOWN:
        'down';
      case UP:
        'up';
      case RIGHT:
        'right';
      default:
        'unknown';
    }
  }

  public function get_nameUpper():String
  {
    return abstract.name.toUpperCase();
  }

  public function get_color():FlxColor
  {
    return Constants.COLOR_NOTES[this];
  }

  public function get_colorName():String
  {
    return switch (abstract)
    {
      case LEFT:
        'purple';
      case DOWN:
        'blue';
      case UP:
        'green';
      case RIGHT:
        'red';
      default:
        'unknown';
    }
  }

  public function toString():String
  {
    return abstract.name;
  }
}
