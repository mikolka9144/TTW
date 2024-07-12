package funkin.play.cutscene.dialogue;

/**
 * A script that can be tied to a Speaker.
 * Create a scripted class that extends Speaker to use this.
 * This allows you to customize how a specific conversation speaker appears.
 */
class ScriptedSpeaker extends funkin.play.cutscene.dialogue.Speaker {
  //! mock calls
  //* real implementations are handled by polymod

  /**
   * Initializes a scripted class instance using the given scripted class name and constructor arguments.
   * @param className Name of the target class extending ScriptedSpeaker type
   * @param args List of argument of a scripted constructor. olny the first one seems to work?
   * @return ScriptedSpeaker
   */
  public static function init(className:String,...args:Any):ScriptedSpeaker {
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
    * Returns a list of all the scripted classes which extend ScriptedSpeaker.
    * @return Array<String> THE list
    */
   public static function listScriptClasses():Array<String> {return null; }
}
