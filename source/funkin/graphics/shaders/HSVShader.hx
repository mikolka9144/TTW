package funkin.graphics.shaders;

import flixel.addons.display.FlxRuntimeShader;
import funkin.Paths;
import openfl.utils.Assets;

class HSVShader extends FlxRuntimeShader
{
  public var hue(default, set):Float;
  public var saturation(default, set):Float;
  public var value(default, set):Float;

  public function new()
  {
    super(Assets.getText(Paths.frag('hsv')));
    FlxG.debugger.addTrackerProfile(new TrackerProfile(HSVShader, ['hue', 'saturation', 'value']));
    hue = 1;
    saturation = 1;
    value = 1;
  }

  public function set_hue(value:Float):Float
  {
    this.setFloat('_hue', value);
    this.hue = value;

    return this.hue;
  }

  public function set_saturation(value:Float):Float
  {
    this.setFloat('_sat', value);
    this.saturation = value;

    return this.saturation;
  }

  public function set_value(value:Float):Float
  {
    this.setFloat('_val', value);
    this.value = value;

    return this.value;
  }
}
