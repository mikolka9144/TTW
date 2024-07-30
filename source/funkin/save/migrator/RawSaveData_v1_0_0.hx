package funkin.save.migrator;

import thx.semver.Version;

typedef RawSaveData_v1_0_0 =
{
  public var seenVideo:Bool;
  public var mute:Bool;
  public var volume:Float;

  public var sessionId:String;

  public var songCompletion:Map<String, Float>;

  public var songScores:Map<String, Int>;

  public var ?controls:
    {
      ?p1:SavePlayerControlsData_v1_0_0,
      ?p2:SavePlayerControlsData_v1_0_0
    };
  public var enabledMods:Array<String>;
  public var weeksUnlocked:Array<Bool>;
  public var windowSettings:Array<Bool>;
}

typedef SavePlayerControlsData_v1_0_0 =
{
  public var keys:SaveControlsData_v1_0_0;
  public var pad:SaveControlsData_v1_0_0;
};

typedef SaveControlsData_v1_0_0 =
{
  public var ?ACCEPT:Array<Int>;
  public var ?BACK:Array<Int>;
  public var ?CUTSCENE_ADVANCE:Array<Int>;
  public var ?NOTE_DOWN:Array<Int>;
  public var ?NOTE_LEFT:Array<Int>;
  public var ?NOTE_RIGHT:Array<Int>;
  public var ?NOTE_UP:Array<Int>;
  public var ?PAUSE:Array<Int>;
  public var ?RESET:Array<Int>;
  public var ?UI_DOWN:Array<Int>;
  public var ?UI_LEFT:Array<Int>;
  public var ?UI_RIGHT:Array<Int>;
  public var ?UI_UP:Array<Int>;
  public var ?VOLUME_DOWN:Array<Int>;
  public var ?VOLUME_MUTE:Array<Int>;
  public var ?VOLUME_UP:Array<Int>;
};
