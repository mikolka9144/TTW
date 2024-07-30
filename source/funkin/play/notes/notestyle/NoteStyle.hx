package funkin.play.notes.notestyle;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFramesCollection;
import funkin.data.animation.AnimationData;
import funkin.data.IRegistryEntry;
import funkin.graphics.FunkinSprite;
import funkin.data.notestyle.NoteStyleData;
import funkin.data.notestyle.NoteStyleRegistry;
import funkin.data.notestyle.NoteStyleRegistry;
import funkin.util.assets.FlxAnimationUtil;

using funkin.data.animation.AnimationData.AnimationDataUtil;

/**
 * Holds the data for what assets to use for a note style,
 * and provides convenience methods for building sprites based on them.
 */
class NoteStyle implements IRegistryEntry<NoteStyleData>
{
  /**
   * The ID of the note style.
   */
  public final id:String;

  /**
   * Note style data as parsed from the JSON file.
   */
  public final _data:NoteStyleData;

  /**
   * The note style to use if this one doesn't have a certain asset.
   * This can be recursive, ehe.
   */
  final fallback:Null<NoteStyle>;

  /**
   * @param id The ID of the JSON file to parse.
   */
  public function new(id:String)
  {
    this.id = id;
    _data = _fetchData(id);

    if (_data == null)
    {
      throw 'Could not parse note style data for id: $id';
    }

    this.fallback = NoteStyleRegistry.instance.fetchEntry(getFallbackID());
  }

  /**
   * Get the readable name of the note style.
   * @return String
   */
  public function getName():String
  {
    return _data.name;
  }

  /**
   * Get the author of the note style.
   * @return String
   */
  public function getAuthor():String
  {
    return _data.author;
  }

  /**
   * Get the note style ID of the parent note style.
   * @return The string ID, or `null` if there is no parent.
   */
  public function getFallbackID():Null<String>
  {
    return _data.fallback;
  }

  public function buildNoteSprite(target:NoteSprite):Void
  {
    // Apply the note sprite frames.
    var atlas:FlxAtlasFrames = buildNoteFrames(false);

    if (atlas == null)
    {
      throw 'Could not load spritesheet for note style: $id';
    }

    target.frames = atlas;

    target.scale.x = _data.assets.note.scale;
    target.scale.y = _data.assets.note.scale;
    target.antialiasing = !_data.assets.note.isPixel;

    // Apply the animations.
    buildNoteAnimations(target);
  }

  public var noteFrames:FlxAtlasFrames = null;

  public function buildNoteFrames(force:Bool = false):FlxAtlasFrames
  {
    if (!FunkinSprite.isTextureCached(Paths.image(getNoteAssetPath())))
    {
      FlxG.log.warn('Note texture is not cached: ${getNoteAssetPath()}');
    }

    // Purge the note frames if the cached atlas is invalid.
    if (noteFrames?.parent?.isDestroyed ?? false) noteFrames = null;

    if (noteFrames != null && !force) return noteFrames;

    noteFrames = Paths.getSparrowAtlas(getNoteAssetPath(), getNoteAssetLibrary());

    if (noteFrames == null)
    {
      throw 'Could not load note frames for note style: $id';
    }

    return noteFrames;
  }

  public function getNoteAssetPath(raw:Bool = false):String
  {
    if (raw)
    {
      var rawPath:Null<String> = _data?.assets?.note?.assetPath;
      if (rawPath == null) return fallback.getNoteAssetPath(true);
      return rawPath;
    }

    // library:path
    var parts = getNoteAssetPath(true).split(Constants.LIBRARY_SEPARATOR);
    if (parts.length == 1) return getNoteAssetPath(true);
    return parts[1];
  }

  public function getNoteAssetLibrary():Null<String>
  {
    // library:path
    var parts = getNoteAssetPath(true).split(Constants.LIBRARY_SEPARATOR);
    if (parts.length == 1) return null;
    return parts[0];
  }

  public function buildNoteAnimations(target:NoteSprite):Void
  {
    var leftData:AnimationData = fetchNoteAnimationData(LEFT);
    target.animation.addByPrefix('purpleScroll', leftData.prefix, leftData.frameRate, leftData.looped, leftData.flipX, leftData.flipY);
    var downData:AnimationData = fetchNoteAnimationData(DOWN);
    target.animation.addByPrefix('blueScroll', downData.prefix, downData.frameRate, downData.looped, downData.flipX, downData.flipY);
    var upData:AnimationData = fetchNoteAnimationData(UP);
    target.animation.addByPrefix('greenScroll', upData.prefix, upData.frameRate, upData.looped, upData.flipX, upData.flipY);
    var rightData:AnimationData = fetchNoteAnimationData(RIGHT);
    target.animation.addByPrefix('redScroll', rightData.prefix, rightData.frameRate, rightData.looped, rightData.flipX, rightData.flipY);
  }

  public function fetchNoteAnimationData(dir:NoteDirection):AnimationData
  {
    var result:Null<AnimationData> = switch (dir)
    {
      case LEFT: _data.assets.note.data.left.toNamed();
      case DOWN: _data.assets.note.data.down.toNamed();
      case UP: _data.assets.note.data.up.toNamed();
      case RIGHT: _data.assets.note.data.right.toNamed();
    };

    return (result == null) ? fallback.fetchNoteAnimationData(dir) : result;
  }

  public function getHoldNoteAssetPath(raw:Bool = false):String
  {
    if (raw)
    {
      // TODO: figure out why ?. didn't work here
      var rawPath:Null<String> = (_data?.assets?.holdNote == null) ? null : _data?.assets?.holdNote?.assetPath;
      return (rawPath == null) ? fallback.getHoldNoteAssetPath(true) : rawPath;
    }

    // library:path
    var parts = getHoldNoteAssetPath(true).split(Constants.LIBRARY_SEPARATOR);
    if (parts.length == 1) return Paths.image(parts[0]);
    return Paths.image(parts[1], parts[0]);
  }

  public function isHoldNotePixel():Bool
  {
    var data = _data?.assets?.holdNote;
    if (data == null) return fallback.isHoldNotePixel();
    return data.isPixel;
  }

  public function fetchHoldNoteScale():Float
  {
    var data = _data?.assets?.holdNote;
    if (data == null) return fallback.fetchHoldNoteScale();
    return data.scale;
  }

  public function applyStrumlineFrames(target:StrumlineNote):Void
  {
    // TODO: Add support for multi-Sparrow.
    // Will be less annoying after this is merged: https://github.com/HaxeFlixel/flixel/pull/2772

    var atlas:FlxAtlasFrames = Paths.getSparrowAtlas(getStrumlineAssetPath(), getStrumlineAssetLibrary());

    if (atlas == null)
    {
      throw 'Could not load spritesheet for note style: $id';
    }

    target.frames = atlas;

    target.scale.x = _data.assets.noteStrumline.scale;
    target.scale.y = _data.assets.noteStrumline.scale;
    target.antialiasing = !_data.assets.noteStrumline.isPixel;
  }

  public function getStrumlineAssetPath(raw:Bool = false):String
  {
    if (raw)
    {
      var rawPath:Null<String> = _data?.assets?.noteStrumline?.assetPath;
      if (rawPath == null) return fallback.getStrumlineAssetPath(true);
      return rawPath;
    }

    // library:path
    var parts = getStrumlineAssetPath(true).split(Constants.LIBRARY_SEPARATOR);
    if (parts.length == 1) return getStrumlineAssetPath(true);
    return parts[1];
  }

  public function getStrumlineAssetLibrary():Null<String>
  {
    // library:path
    var parts = getStrumlineAssetPath(true).split(Constants.LIBRARY_SEPARATOR);
    if (parts.length == 1) return null;
    return parts[0];
  }

  public function applyStrumlineAnimations(target:StrumlineNote, dir:NoteDirection):Void
  {
    FlxAnimationUtil.addAtlasAnimations(target, getStrumlineAnimationData(dir));
  }

  public function getStrumlineAnimationData(dir:NoteDirection):Array<AnimationData>
  {
    var result:Array<AnimationData> = switch (dir)
    {
      case NoteDirection.LEFT: [
          _data.assets.noteStrumline.data.leftStatic.toNamed('static'),
          _data.assets.noteStrumline.data.leftPress.toNamed('press'),
          _data.assets.noteStrumline.data.leftConfirm.toNamed('confirm'),
          _data.assets.noteStrumline.data.leftConfirmHold.toNamed('confirm-hold'),
        ];
      case NoteDirection.DOWN: [
          _data.assets.noteStrumline.data.downStatic.toNamed('static'),
          _data.assets.noteStrumline.data.downPress.toNamed('press'),
          _data.assets.noteStrumline.data.downConfirm.toNamed('confirm'),
          _data.assets.noteStrumline.data.downConfirmHold.toNamed('confirm-hold'),
        ];
      case NoteDirection.UP: [
          _data.assets.noteStrumline.data.upStatic.toNamed('static'),
          _data.assets.noteStrumline.data.upPress.toNamed('press'),
          _data.assets.noteStrumline.data.upConfirm.toNamed('confirm'),
          _data.assets.noteStrumline.data.upConfirmHold.toNamed('confirm-hold'),
        ];
      case NoteDirection.RIGHT: [
          _data.assets.noteStrumline.data.rightStatic.toNamed('static'),
          _data.assets.noteStrumline.data.rightPress.toNamed('press'),
          _data.assets.noteStrumline.data.rightConfirm.toNamed('confirm'),
          _data.assets.noteStrumline.data.rightConfirmHold.toNamed('confirm-hold'),
        ];
    };

    return result;
  }

  public function applyStrumlineOffsets(target:StrumlineNote)
  {
    target.x += _data.assets.noteStrumline.offsets[0];
    target.y += _data.assets.noteStrumline.offsets[1];
  }

  public function getStrumlineScale():Float
  {
    return _data.assets.noteStrumline.scale;
  }

  public function isNoteSplashEnabled():Bool
  {
    var data = _data?.assets?.noteSplash?.data;
    if (data == null) return fallback.isNoteSplashEnabled();
    return data.enabled;
  }

  public function isHoldNoteCoverEnabled():Bool
  {
    var data = _data?.assets?.holdNoteCover?.data;
    if (data == null) return fallback.isHoldNoteCoverEnabled();
    return data.enabled;
  }

  public function destroy():Void {}

  public function toString():String
  {
    return 'NoteStyle($id)';
  }

  public static function _fetchData(id:String):Null<NoteStyleData>
  {
    return NoteStyleRegistry.instance.parseEntryDataWithMigration(id, NoteStyleRegistry.instance.fetchEntryVersion(id));
  }
}
