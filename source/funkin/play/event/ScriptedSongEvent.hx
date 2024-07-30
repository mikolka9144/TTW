package funkin.play.event;

import funkin.play.song.Song;
import polymod.hscript.HScriptedClass;

/**
 * A script that can be tied to a SongEvent.
 * Create a scripted class that extends SongEvent,
 * then call `super('SongEventType')` to use this.
 *
 * - Remember to override `handleEvent(data:SongEventData)` to perform your actions when the event is hit.
 * - Remember to override `getTitle()` to return an event name that will be displayed in the editor.
 * - Remember to override `getEventSchema()` to return a schema for the event data, used to build a form in the chart editor.
 */
class ScriptedSongEvent extends SongEvent {
  //! mock calls
  //* real implementations are handled by polymod

  /**
   * Initializes a scripted class instance using the given scripted class name and constructor arguments.
   * @param className Name of the target class extending ScriptedSongEvent type
   * @param args List of argument of a scripted constructor. olny the first one seems to work?
   * @return ScriptedSongEvent
   */
  public static function init(className:String,...args:Any):ScriptedSongEvent {
    return null;
  }
  /**
   * Polymod function: Calls a requested function from this scripted class using given arguments
   *
   * You must enable `mockPolymodCalls` to use this function
   * @param funcName Name of the target function
   * @param args Arguments for that function
   */
  public function polymodExecFunc(funcName:String, args:Array<Dynamic> = null):Dynamic {
    //* mock call. Once build it should be replaced with
    //* 'scriptCall'
    return null;
  }
	/**
	 * Returns the value of a custom field of the scripted class, by the given name.
	 	 *
	 	 * @param fieldName The name of the field to return.
	 	 * @return The value of the field, if any.
	 */
	 public function scriptGet(fieldName:String):Dynamic{return null;};
	/**
	 * Sets the value of a custom field of the scripted class, by the given name.
	 *
	 * @param fieldName The name of the field to set.
	 * @param value The value to set.
	 * @return The newly set value.
	 */
	 public function scriptSet(fieldName:String, value:Dynamic):Dynamic{return null; }
   /**
    * Returns a list of all the scripted classes which extend ScriptedSongEvent.
    * @return Array<String> THE list
    */
   public static function listScriptClasses():Array<String> {return null; }
}
