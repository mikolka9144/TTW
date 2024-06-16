package funkin.ui.credits;

/**
 * The members of the Funkin' Crew, organized by their roles.
 */
typedef CreditsData =
{
  public var entries:Array<CreditsDataRole>;
}

/**
 * The members of a specific role on the Funkin' Crew.
 */
typedef CreditsDataRole =
{
  @:optional
  public var header:String;

  @:optional
  @:default([])
  public var body:Array<CreditsDataMember>;

  @:optional
  @:default(false)
  public var appendBackers:Bool;
}

/**
 * A member of a specific person on the Funkin' Crew.
 */
typedef CreditsDataMember =
{
  public var line:String;
}
