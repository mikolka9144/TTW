package mod.misc;

import funkin.modding.module.Module;

class RemoteModule extends Module
{
  public function new()
  {
    super("remote", 0);
  }

  public function remoteCall(name:String)
  {
    trace("Helllloo!!! " + name);
  }
}
