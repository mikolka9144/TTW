package funkin.play.character;

/**
 * A script that can be tied to a BaseCharacter, which persists across states.
 * Create a scripted class that extends BaseCharacter to use this.
 * Note: Making a scripted class extending BaseCharacter is not recommended.
 * Do so ONLY if are handling all the character rendering yourself,
 * and can't use one of the built-in render modes.
 */
class ScriptedBaseCharacter extends BaseCharacter {
  //! mock calls
  //* real implementations are handled by polymod

  /**
   * Initializes a scripted class instance using the given scripted class name and constructor arguments.
   * @param className Name of the target class extending ScriptedBaseCharacter type
   * @param args List of argument of a scripted constructor. olny the first one seems to work?
   * @return ScriptedBaseCharacter
   */
  public static function init(className:String,...args:Any):ScriptedBaseCharacter {
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
    * Returns a list of all the scripted classes which extend ScriptedBaseCharacter.
    * @return Array<String> THE list
    */
   public static function listScriptClasses():Array<String> {return null; }
}

/**
 * A script that can be tied to a SparrowCharacter, which persists across states.
 * Create a scripted class that extends SparrowCharacter,
 * then call `super('charId')` in the constructor to use this.
 */
class ScriptedSparrowCharacter extends SparrowCharacter {
  //! mock calls
  //* real implementations are handled by polymod

  /**
   * Initializes a scripted class instance using the given scripted class name and constructor arguments.
   * @param className Name of the target class extending ScriptedSparrowCharacter type
   * @param args List of argument of a scripted constructor. olny the first one seems to work?
   * @return ScriptedSparrowCharacter
   */
  public static function init(className:String,...args:Any):ScriptedSparrowCharacter {
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
    * Returns a list of all the scripted classes which extend ScriptedSparrowCharacter.
    * @return Array<String> THE list
    */
   public static function listScriptClasses():Array<String> {return null; }
}

/**
 * A script that can be tied to a MultiSparrowCharacter, which persists across states.
 * Create a scripted class that extends MultiSparrowCharacter,
 * then call `super('charId')` in the constructor to use this.
 */
class ScriptedMultiSparrowCharacter extends MultiSparrowCharacter {
  //! mock calls
  //* real implementations are handled by polymod

  /**
   * Initializes a scripted class instance using the given scripted class name and constructor arguments.
   * @param className Name of the target class extending ScriptedMultiSparrowCharacter type
   * @param args List of argument of a scripted constructor. olny the first one seems to work?
   * @return ScriptedMultiSparrowCharacter
   */
  public static function init(className:String,...args:Any):ScriptedMultiSparrowCharacter {
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
    * Returns a list of all the scripted classes which extend ScriptedMultiSparrowCharacter.
    * @return Array<String> THE list
    */
   public static function listScriptClasses():Array<String> {return null; }
}

/**
 * A script that can be tied to a PackerCharacter, which persists across states.
 * Create a scripted class that extends PackerCharacter,
 * then call `super('charId')` in the constructor to use this.
 */
class ScriptedPackerCharacter extends PackerCharacter {
  //! mock calls
  //* real implementations are handled by polymod

  /**
   * Initializes a scripted class instance using the given scripted class name and constructor arguments.
   * @param className Name of the target class extending ScriptedPackerCharacter type
   * @param args List of argument of a scripted constructor. olny the first one seems to work?
   * @return ScriptedPackerCharacter
   */
  public static function init(className:String,...args:Any):ScriptedPackerCharacter {
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
    * Returns a list of all the scripted classes which extend ScriptedPackerCharacter.
    * @return Array<String> THE list
    */
   public static function listScriptClasses():Array<String> {return null; }
}

/**
 * A script that can be tied to an AnimateAtlasCharacter, which persists across states.
 * Create a scripted class that extends AnimateAtlasCharacter,
 * then call `super('charId')` in the constructor to use this.
 */
class ScriptedAnimateAtlasCharacter extends AnimateAtlasCharacter {
  //! mock calls
  //* real implementations are handled by polymod

  /**
   * Initializes a scripted class instance using the given scripted class name and constructor arguments.
   * @param className Name of the target class extending ScriptedAnimateAtlasCharacter type
   * @param args List of argument of a scripted constructor. olny the first one seems to work?
   * @return ScriptedAnimateAtlasCharacter
   */
  public static function init(className:String,...args:Any):ScriptedAnimateAtlasCharacter {
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
    * Returns a list of all the scripted classes which extend ScriptedAnimateAtlasCharacter.
    * @return Array<String> THE list
    */
   public static function listScriptClasses():Array<String> {return null; }
}
