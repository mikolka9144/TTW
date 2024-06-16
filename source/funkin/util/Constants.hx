package funkin.util;

import flixel.system.FlxBasePreloader;
import flixel.util.FlxColor;
import funkin.data.song.SongData.SongTimeFormat;
import lime.app.Application;

/**
 * A store of unchanging, globally relevant values.
 */
class Constants
{
  /**
   * ENGINE AND VERSION DATA
   */
  // ==============================

  /**
   * The title of the game, for debug printing purposes.
   * Change this if you're making an engine.
   */
  public static var TITLE:String = "Friday Night Funkin'";

  /**
   * The current version number of the game.
   * Modify this in the `project.xml` file.
   */
  public static var VERSION(get, never):String;

  /**
   * The generatedBy string embedded in the chart files made by this application.
   */
  public static var GENERATED_BY(get, never):String;

  public static function get_GENERATED_BY():String
  {
    return '${Constants.TITLE} - ${Constants.VERSION}';
  }

  /**
   * A suffix to add to the game version.
   * Add a suffix to prototype builds and remove it for releases.
   */
  public static var VERSION_SUFFIX:String = #if (DEBUG || FORCE_DEBUG_VERSION) ' PROTOTYPE' #else '' #end;

  #if (debug || FORCE_DEBUG_VERSION)
  public static function get_VERSION():String
  {
    return 'v${Application.current.meta.get('version')} (${GIT_BRANCH} : ${GIT_HASH}${GIT_HAS_LOCAL_CHANGES ? ' : MODIFIED' : ''})' + VERSION_SUFFIX;
  }
  #else
  public static function get_VERSION():String
  {
    return 'v${Application.current.meta.get('version')}' + VERSION_SUFFIX;
  }
  #end

  /**
   * URL DATA
   */
  // ==============================

  /**
   * Link to buy merch for the game.
   */
  public static var URL_MERCH:String = 'https://needlejuicerecords.com/pages/friday-night-funkin';

  /**
   * Preloader sitelock.
   * Matching is done by `FlxStringUtil.getDomain`, so any URL on the domain will work.
   * The first link in this list is the one users will be redirected to if they try to access the game from a different URL.
   */
  public static var SITE_LOCK:Array<String> = [
    "https://www.newgrounds.com/portal/view/770371", // Newgrounds, baybee!
    FlxBasePreloader.LOCAL // localhost for dev stuff
  ];

  /**
   * Link to download the game on Itch.io.
   */
  public static var URL_ITCH:String = 'https://ninja-muffin24.itch.io/funkin/purchase';

  /**
   * Link to the game's page on Kickstarter.
   */
  public static var URL_KICKSTARTER:String = 'https://www.kickstarter.com/projects/funkin/friday-night-funkin-the-full-ass-game/';

  /**
   * REPOSITORY DATA
   */
  // ==============================

  /**
   * The current Git branch.
   */
  public static var GIT_BRANCH:String = funkin.util.macro.GitCommit.getGitBranch();

  /**
   * The current Git commit hash.
   */
  public static var GIT_HASH:String = funkin.util.macro.GitCommit.getGitCommitHash();

  public static var GIT_HAS_LOCAL_CHANGES:Bool = funkin.util.macro.GitCommit.getGitHasLocalChanges();

  /**
   * The current library versions, as provided by hmm.
   */
  public static var LIBRARY_VERSIONS:Array<String> = funkin.util.macro.HaxelibVersions.getLibraryVersions();

  /**
   * COLORS
   */
  // ==============================

  /**
   * The color used by the enemy health bar.
   */
  public static var COLOR_HEALTH_BAR_RED:FlxColor = 0xFFFF0000;

  /**
   * The color used by the player health bar.
   */
  public static var COLOR_HEALTH_BAR_GREEN:FlxColor = 0xFF66FF33;

  /**
   * The base colors used by notes.
   */
  public static var COLOR_NOTES:Array<FlxColor> = [
    0xFFFF22AA, // left (0)
    0xFF00EEFF, // down (1)
    0xFF00CC00, // up (2)
    0xFFCC1111 // right (3)
  ];

  /**
   * Color for the preloader background
   */
  public static var COLOR_PRELOADER_BG:FlxColor = 0xFF000000;

  /**
   * Color for the preloader progress bar
   */
  public static var COLOR_PRELOADER_BAR:FlxColor = 0xFFA4FF11;

  /**
   * Color for the preloader site lock background
   */
  public static var COLOR_PRELOADER_LOCK_BG:FlxColor = 0xFF1B1717;

  /**
   * Color for the preloader site lock foreground
   */
  public static var COLOR_PRELOADER_LOCK_FG:FlxColor = 0xB96F10;

  /**
   * Color for the preloader site lock text
   */
  public static var COLOR_PRELOADER_LOCK_FONT:FlxColor = 0xCCCCCC;

  /**
   * Color for the preloader site lock link
   */
  public static var COLOR_PRELOADER_LOCK_LINK:FlxColor = 0xEEB211;

  /**
   * LANGUAGE
   */
  // ==============================
  public static var SITE_LOCK_TITLE:String = "You Loser!";

  public static var SITE_LOCK_DESC:String = "This isn't Newgrounds!\nGo play Friday Night Funkin' on Newgrounds:";

  /**
   * GAME DEFAULTS
   */
  // ==============================

  /**
   * Default difficulty for charts.
   */
  public static var DEFAULT_DIFFICULTY:String = 'normal';

  /**
   * Default list of difficulties for charts.
   * Assumes no Erect mode, etc.
   */
  public static var DEFAULT_DIFFICULTY_LIST:Array<String> = ['easy', 'normal', 'hard'];

  /**
   * List of all difficulties used by the base game.
   * Includes Erect and Nightmare.
   */
  public static var DEFAULT_DIFFICULTY_LIST_FULL:Array<String> = ['easy', 'normal', 'hard', 'erect', 'nightmare'];

  /**
   * Default player character for charts.
   */
  public static var DEFAULT_CHARACTER:String = 'bf';

  /**
   * Default player character for health icons.
   */
  public static var DEFAULT_HEALTH_ICON:String = 'face';

  /**
   * Default stage for charts.
   */
  public static var DEFAULT_STAGE:String = 'mainStage';

  /**
   * Default song for if the PlayState messes up.
   */
  public static var DEFAULT_SONG:String = 'tutorial';

  /**
   * Default variation for charts.
   */
  public static var DEFAULT_VARIATION:String = 'default';

  /**
   * Standardized variations for charts
   */
  public static var DEFAULT_VARIATION_LIST:Array<String> = ['default', 'erect', 'pico'];

  /**
   * The default intensity multiplier for camera bops.
   * Prolly needs to be tuned bc it's a multiplier now.
   */
  public static var DEFAULT_BOP_INTENSITY:Float = 1.015;

  /**
   * The default rate for camera zooms (in beats per zoom).
   */
  public static var DEFAULT_ZOOM_RATE:Int = 4;

  /**
   * The default BPM for charts, so things don't break if none is specified.
   */
  public static var DEFAULT_BPM:Float = 100.0;

  /**
   * The default name for songs.
   */
  public static var DEFAULT_SONGNAME:String = 'Unknown';

  /**
   * The default artist for songs.
   */
  public static var DEFAULT_ARTIST:String = 'Unknown';

  /**
   * The default charter for songs.
   */
  public static var DEFAULT_CHARTER:String = 'Unknown';

  /**
   * The default note style for songs.
   */
  public static var DEFAULT_NOTE_STYLE:String = 'funkin';

  /**
   * The default album for songs in Freeplay.
   */
  public static var DEFAULT_ALBUM_ID:String = 'volume1';

  /**
   * The default timing format for songs.
   */
  public static var DEFAULT_TIMEFORMAT:SongTimeFormat = SongTimeFormat.MILLISECONDS;

  /**
   * The default scroll speed for songs.
   */
  public static var DEFAULT_SCROLLSPEED:Float = 1.0;

  /**
   * Default numerator for the time signature.
   */
  public static var DEFAULT_TIME_SIGNATURE_NUM:Int = 4;

  /**
   * Default denominator for the time signature.
   */
  public static var DEFAULT_TIME_SIGNATURE_DEN:Int = 4;

  /**
   * TIMING
   */
  // ==============================

  /**
   * A magic number used when calculating scroll speed and note distances.
   */
  public static var PIXELS_PER_MS:Float = 0.45;

  /**
   * The maximum interval within which a note can be hit, in milliseconds.
   */
  public static var HIT_WINDOW_MS:Float = 160.0;

  /**
   * Constant for the number of seconds in a minute.
   *
   * sex per min
   */
  public static var SECS_PER_MIN:Int = 60;

  /**
   * Constant for the number of milliseconds in a second.
   */
  public static var MS_PER_SEC:Int = 1000;

  /**
   * The number of microseconds in a millisecond.
   */
  public static var US_PER_MS:Int = 1000;

  /**
   * The number of microseconds in a second.
   */
  public static var US_PER_SEC:Int = US_PER_MS * MS_PER_SEC;

  /**
   * The number of nanoseconds in a microsecond.
   */
  public static var NS_PER_US:Int = 1000;

  /**
   * The number of nanoseconds in a millisecond.
   */
  public static var NS_PER_MS:Int = NS_PER_US * US_PER_MS;

  /**
   * The number of nanoseconds in a second.
   */
  public static var NS_PER_SEC:Int = NS_PER_US * US_PER_MS * MS_PER_SEC;

  /**
   * Duration, in milliseconds, until toast notifications are automatically hidden.
   */
  public static var NOTIFICATION_DISMISS_TIME:Int = 5 * MS_PER_SEC;

  /**
   * Duration to wait before autosaving the chart.
   */
  public static var AUTOSAVE_TIMER_DELAY_SEC:Float = 5.0 * SECS_PER_MIN;

  /**
   * Number of steps in a beat.
   * One step is one 16th note and one beat is one quarter note.
   */
  public static var STEPS_PER_BEAT:Int = 4;

  /**
   * All MP3 decoders introduce a playback delay of `528` samples,
   * which at 44,100 Hz (samples per second) is ~12 ms.
   */
  public static var MP3_DELAY_MS:Float = 528 / 44100 * Constants.MS_PER_SEC;

  /**
   * Each step of the preloader has to be on screen at least this long.
   *
   * 0 = The preloader immediately moves to the next step when it's ready.
   * 1 = The preloader waits for 1 second before moving to the next step.
   *     The progress bare is automatically rescaled to match.
   */
  #if debug
  public static var PRELOADER_MIN_STAGE_TIME:Float = 0.0;
  #else
  public static var PRELOADER_MIN_STAGE_TIME:Float = 0.1;
  #end

  /**
   * HEALTH VALUES
   */
  // ==============================

  /**
   * The player's maximum health.
   * If the player is at this value, they can't gain any more health.
   */
  public static var HEALTH_MAX:Float = 2.0;

  /**
   * The player's starting health.
   */
  public static final HEALTH_STARTING = HEALTH_MAX / 2.0;

  /**
   * The player's minimum health.
   * If the player is at or below this value, they lose.
   */
  public static var HEALTH_MIN:Float = 0.0;

  /**
   * The amount of health the player gains when hitting a note with the KILLER rating.
   */
  public static var HEALTH_KILLER_BONUS:Float = 2.0 / 100.0 * HEALTH_MAX; // +2.0%

  /**
   * The amount of health the player gains when hitting a note with the SICK rating.
   */
  public static var HEALTH_SICK_BONUS:Float = 1.5 / 100.0 * HEALTH_MAX; // +1.0%

  /**
   * The amount of health the player gains when hitting a note with the GOOD rating.
   */
  public static var HEALTH_GOOD_BONUS:Float = 0.75 / 100.0 * HEALTH_MAX; // +0.75%

  /**
   * The amount of health the player gains when hitting a note with the BAD rating.
   */
  public static var HEALTH_BAD_BONUS:Float = 0.0 / 100.0 * HEALTH_MAX; // +0.0%

  /**
   * The amount of health the player gains when hitting a note with the SHIT rating.
   * If negative, the player will actually lose health.
   */
  public static var HEALTH_SHIT_BONUS:Float = -1.0 / 100.0 * HEALTH_MAX; // -1.0%

  /**
   * The amount of health the player gains, while holding a hold note, per second.
   */
  public static var HEALTH_HOLD_BONUS_PER_SECOND:Float = 7.5 / 100.0 * HEALTH_MAX; // +7.5% / second

  /**
   * The amount of health the player loses upon missing a note.
   */
  public static var HEALTH_MISS_PENALTY:Float = 4.0 / 100.0 * HEALTH_MAX; // 4.0%

  /**
   * The amount of health the player loses upon pressing a key when no note is there.
   */
  public static var HEALTH_GHOST_MISS_PENALTY:Float = 2.0 / 100.0 * HEALTH_MAX; // 2.0%

  /**
   * The amount of health the player loses upon letting go of a hold note while it is still going.
   */
  public static var HEALTH_HOLD_DROP_PENALTY:Float = 0.0; // 0.0%

  /**
   * The amount of health the player loses upon hitting a mine.
   */
  public static var HEALTH_MINE_PENALTY:Float = 15.0 / 100.0 * HEALTH_MAX; // 15.0%

  /**
   * SCORE VALUES
   */
  // ==============================

  /**
   * The amount of score the player gains for every send they hold a hold note.
   * A fraction of this value is granted every frame.
   */
  public static var SCORE_HOLD_BONUS_PER_SECOND:Float = 250.0;

  public static var JUDGEMENT_KILLER_COMBO_BREAK:Bool = false;
  public static var JUDGEMENT_SICK_COMBO_BREAK:Bool = false;
  public static var JUDGEMENT_GOOD_COMBO_BREAK:Bool = false;
  public static var JUDGEMENT_BAD_COMBO_BREAK:Bool = true;
  public static var JUDGEMENT_SHIT_COMBO_BREAK:Bool = true;

  // % Sick
  public static var RANK_PERFECT_PLAT_THRESHOLD:Float = 1.0; // % Sick
  public static var RANK_PERFECT_GOLD_THRESHOLD:Float = 0.85; // % Sick

  // % Hit
  public static var RANK_PERFECT_THRESHOLD:Float = 1.00;
  public static var RANK_EXCELLENT_THRESHOLD:Float = 0.90;
  public static var RANK_GREAT_THRESHOLD:Float = 0.80;
  public static var RANK_GOOD_THRESHOLD:Float = 0.60;

  // public static final RANK_SHIT_THRESHOLD:Float = 0.00;
  /**
   * FILE EXTENSIONS
   */
  // ==============================

  /**
   * The file extension used when exporting chart files.
   *
   * - "I made a new file format"
   * - "Actually new or just a renamed ZIP?"
   */
  public static final EXT_CHART = "fnfc";

  /**
   * The file extension used when loading audio files.
   */
  public static final EXT_SOUND = #if web "mp3" #else "ogg" #end;

  /**
   * The file extension used when loading video files.
   */
  public static final EXT_VIDEO = "mp4";

  /**
   * The file extension used when loading image files.
   */
  public static final EXT_IMAGE = "png";

  /**
   * The file extension used when loading data files.
   */
  public static final EXT_DATA = "json";

  /**
   * OTHER
   */
  // ==============================

  /**
   * If true, the player will not receive the ghost miss penalty if there are no notes within the hit window.
   * This is the thing people have been begging for forever lolol.
   */
  public static var GHOST_TAPPING:Bool = false;

  /**
   * The maximum number of previous file paths for the Chart Editor to remember.
   */
  public static var MAX_PREVIOUS_WORKING_FILES:Int = 10;

  /**
   * The separator between an asset library and the asset path.
   */
  public static var LIBRARY_SEPARATOR:String = ':';

  /**
   * The scale factor to use when increasing the size of pixel art graphics.
   */
  public static var PIXEL_ART_SCALE:Float = 6;

  /**
   * The volume at which to play the countdown before the song starts.
   */
  public static var COUNTDOWN_VOLUME:Float = 0.6;

  /**
   * The horizontal offset of the strumline from the left edge of the screen.
   */
  public static var STRUMLINE_X_OFFSET:Float = 48;

  /**
   * The vertical offset of the strumline from the top edge of the screen.
   */
  public static var STRUMLINE_Y_OFFSET:Float = 24;

  /**
   * The rate at which the camera lerps to its target.
   * 0.04 = 4% of distance per frame.
   */
  public static var DEFAULT_CAMERA_FOLLOW_RATE:Float = 0.04;
}
