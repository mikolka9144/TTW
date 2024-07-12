# Song

In order to define a song in a mod, create or find a [.fnfc file](./../../base_game/FNFC-SPEC.md) for it (you can create one using FNF's chart editor),
then create a folder in `mod_base/data/songs` named after the song's id.
In it extract .json files from a .fnfc file of your song



then create a folder in `mod_base/songs` named after the song's ID again, and in it put the .ogg files.

## How to write code for songs
[Song](./../../../source/funkin/play/song/Song.hx) class allows you to define custom behavior in regards to a single selected song,
which can be picked by setting "song id" in the overridden constructor.

It's one place you could define behavior, that happens during the span of a song as it is [playstate's scripted class](./../generic/playstate-script.md).

The following **custom** available methods to overrides are:

> isSongNew(currentDifficulty:String):Bool

Defines if your song is "new". If it is, it displays a little animated text above a song's capsule.
(like the one in "Satin Panties Erect")

> listAlbums():Map<String, String>

Returns a map of variation IDs to album IDs.

> getVariationsByCharId(?charId:String):Array<String>

Returns a list of variations available for this `charId`.

> listDifficulties(?variationId:String, ?variationIds:Array<String>, showLocked:Bool, showHidden:Bool):Array<String>

Returns a list of difficulties based on parameters given by arguments.

I don't recommend replacing it entirely, but you might want to add some functionality to it.
