package funkin.ui.freeplay;

import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.util.FlxTimer;

class FreeplayFlames extends FlxSpriteGroup
{
  public var flameX(default, set):Float = 917;
  public var flameY(default, set):Float = 103;
  public var flameSpreadX(default, set):Float = 29;
  public var flameSpreadY(default, set):Float = 6;

  public var flameCount(default, set):Int = 0;

  public var flameTimer:Float = 0.25;

  public function new(x:Float, y:Float)
  {
    super(x, y);

    for (i in 0...5)
    {
      var flame:FlxSprite = new FlxSprite(flameX + (flameSpreadX * i), flameY + (flameSpreadY * i));
      flame.frames = Paths.getSparrowAtlas("freeplay/freeplayFlame");
      flame.animation.addByPrefix("flame", "fire loop full instance 1", FlxG.random.int(23, 25), false);
      flame.animation.play("flame");
      flame.visible = false;
      flameCount = 0;

      // sets the loop... maybe better way to do this lol!
      flame.animation.finishCallback = function(_) {
        flame.animation.play("flame", true, false, 2);
      };
      add(flame);
    }
  }

  public var properPositions:Bool = false;

  override public function update(elapsed:Float):Void
  {
    super.update(elapsed);
    // doesn't work in create()/new() for some reason
    // so putting it here bwah!
    if (!properPositions)
    {
      setFlamePositions();
      properPositions = true;
    }
  }

  public var timers:Array<FlxTimer> = [];

  public function set_flameCount(value:Int):Int
  {
    // Stop all existing timers.
    // This fixes a bug where quickly switching difficulties would show flames.
    for (timer in timers)
    {
      timer.active = false;
      timer.destroy();
      timers.remove(timer);
    }

    this.flameCount = value;
    var visibleCount:Int = 0;
    for (i in 0...5)
    {
      if (members[i] == null) continue;
      var flame:FlxSprite = members[i];
      if (i < flameCount)
      {
        if (!flame.visible)
        {
          var nextTimer:FlxTimer = new FlxTimer().start(flameTimer * visibleCount, function(currentTimer:FlxTimer) {
            if (i >= this.flameCount)
            {
              trace('EARLY EXIT');
              return;
            }
            timers.remove(currentTimer);
            flame.animation.play("flame", true);
            flame.visible = true;
          });
          timers.push(nextTimer);

          visibleCount++;
        }
      }
      else
      {
        flame.visible = false;
      }
    }
    return this.flameCount;
  }

  public function setFlamePositions()
  {
    for (i in 0...5)
    {
      var flame:FlxSprite = members[i];
      flame.x = flameX + (flameSpreadX * i);
      flame.y = flameY + (flameSpreadY * i);
    }
  }

  public function set_flameX(value:Float):Float
  {
    this.flameX = value;
    setFlamePositions();
    return this.flameX;
  }

  public function set_flameY(value:Float):Float
  {
    this.flameY = value;
    setFlamePositions();
    return this.flameY;
  }

  public function set_flameSpreadX(value:Float):Float
  {
    this.flameSpreadX = value;
    setFlamePositions();
    return this.flameSpreadX;
  }

  public function set_flameSpreadY(value:Float):Float
  {
    this.flameSpreadY = value;
    setFlamePositions();
    return this.flameSpreadY;
  }
}
