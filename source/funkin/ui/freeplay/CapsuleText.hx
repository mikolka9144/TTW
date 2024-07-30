package funkin.ui.freeplay;

import openfl.filters.BitmapFilterQuality;
import flixel.text.FlxText;
import flixel.group.FlxSpriteGroup;
import funkin.graphics.shaders.GaussianBlurShader;
import funkin.graphics.shaders.LeftMaskShader;
import flixel.math.FlxRect;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import openfl.display.BlendMode;

class CapsuleText extends FlxSpriteGroup
{
  public var blurredText:FlxText;

  public var whiteText:FlxText;

  public var text(default, set):String;

  public var maskShaderSongName:LeftMaskShader = new LeftMaskShader();

  public var clipWidth(default, set):Int = 255;

  public var tooLong:Bool = false;

  // 255, 27 normal
  // 220, 27 favourited

  public function new(x:Float, y:Float, songTitle:String, size:Float)
  {
    super(x, y);

    blurredText = initText(songTitle, size);
    blurredText.shader = new GaussianBlurShader(1);
    whiteText = initText(songTitle, size);
    // whiteText.shader = new GaussianBlurShader(0.3);
    text = songTitle;

    blurredText.color = 0xFF00ccff;
    whiteText.color = 0xFFFFFFFF;
    add(blurredText);
    add(whiteText);
  }

  public function initText(songTitle, size:Float):FlxText
  {
    var text:FlxText = new FlxText(0, 0, 0, songTitle, Std.int(size));
    text.font = "5by7";
    return text;
  }

  // ???? none
  // 255, 27 normal
  // 220, 27 favourited

  public function set_clipWidth(value:Int):Int
  {
    resetText();
    checkClipWidth(value);
    return clipWidth = value;
  }

  /**
   * Checks if the text if it's too long, and clips if it is
   * @param wid
   */
  public function checkClipWidth(?wid:Int):Void
  {
    if (wid == null) wid = clipWidth;

    if (whiteText.width > wid)
    {
      tooLong = true;

      blurredText.clipRect = new FlxRect(0, 0, wid, blurredText.height);
      whiteText.clipRect = new FlxRect(0, 0, wid, whiteText.height);
    }
    else
    {
      tooLong = false;

      blurredText.clipRect = null;
      whiteText.clipRect = null;
    }
  }

  public function set_text(value:String):String
  {
    if (value == null) return value;
    if (blurredText == null || whiteText == null)
    {
      trace('WARN: Capsule not initialized properly');
      return text = value;
    }

    blurredText.text = value;
    whiteText.text = value;
    checkClipWidth();
    whiteText.textField.filters = [
      new openfl.filters.GlowFilter(0x00ccff, 1, 5, 5, 210, BitmapFilterQuality.MEDIUM),
      // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
    ];

    return text = value;
  }

  public var moveTimer:FlxTimer = new FlxTimer();
  public var moveTween:FlxTween;

  public function initMove():Void
  {
    moveTimer.start(0.6, (timer) -> {
      moveTextRight();
    });
  }

  public function moveTextRight():Void
  {
    var distToMove:Float = whiteText.width - clipWidth;
    moveTween = FlxTween.tween(whiteText.offset, {x: distToMove}, 2,
      {
        onUpdate: function(_) {
          whiteText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, whiteText.height);
          blurredText.offset = whiteText.offset;
          blurredText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, blurredText.height);
        },
        onComplete: function(_) {
          moveTimer.start(0.3, (timer) -> {
            moveTextLeft();
          });
        },
        ease: FlxEase.sineInOut
      });
  }

  public function moveTextLeft():Void
  {
    moveTween = FlxTween.tween(whiteText.offset, {x: 0}, 2,
      {
        onUpdate: function(_) {
          whiteText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, whiteText.height);
          blurredText.offset = whiteText.offset;
          blurredText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, blurredText.height);
        },
        onComplete: function(_) {
          moveTimer.start(0.3, (timer) -> {
            moveTextRight();
          });
        },
        ease: FlxEase.sineInOut
      });
  }

  public function resetText():Void
  {
    if (moveTween != null) moveTween.cancel();
    if (moveTimer != null) moveTimer.cancel();
    whiteText.offset.x = 0;
    whiteText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, whiteText.height);
    blurredText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, whiteText.height);
  }

  public var flickerState:Bool = false;
  public var flickerTimer:FlxTimer;

  public function flickerText():Void
  {
    resetText();
    flickerTimer = new FlxTimer().start(1 / 24, flickerProgress, 19);
  }

  public function flickerProgress(timer:FlxTimer):Void
  {
    if (flickerState == true)
    {
      whiteText.blend = BlendMode.ADD;
      blurredText.blend = BlendMode.ADD;
      blurredText.color = 0xFFFFFFFF;
      whiteText.color = 0xFFFFFFFF;
      whiteText.textField.filters = [
        new openfl.filters.GlowFilter(0xFFFFFF, 1, 5, 5, 210, BitmapFilterQuality.MEDIUM),
        // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
      ];
    }
    else
    {
      blurredText.color = 0xFF00aadd;
      whiteText.color = 0xFFDDDDDD;
      whiteText.textField.filters = [
        new openfl.filters.GlowFilter(0xDDDDDD, 1, 5, 5, 210, BitmapFilterQuality.MEDIUM),
        // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
      ];
    }
    flickerState = !flickerState;
  }

  override function update(elapsed:Float):Void
  {
    super.update(elapsed);
  }
}
