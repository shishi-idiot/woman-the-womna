package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.util.helpers.FlxBounds;

class PlayState extends FlxState
{
	private var _player:Player;
	var map:FlxOgmo3Loader;
	var walls:FlxTilemap;
	var _bug:FlxSprite;
	var _end:FlxSprite;

	override public function create()
	{
		// ogmo is my last minute resort
		// also the assets were originally supposed to be made in flash did you know

		FlxG.sound.playMusic("assets/music/ohio.ogg", 0.5);

		FlxG.camera.fade(FlxColor.BLACK, 1, true);

		var white:FlxSprite = new FlxSprite(0, 0);
		white.loadGraphic('assets/images/white.png', false, 1142, 577);
		white.updateHitbox();
		add(white);

		var bg:FlxSprite = new FlxSprite(0, 0);
		bg.loadGraphic('assets/images/flashBG.png', false, 1142, 577);
		// bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		add(bg);

		map = new FlxOgmo3Loader('assets/data/adobeflash.ogmo', 'assets/data/adobeflash.json');
		walls = map.loadTilemap('assets/images/tiles.png', 'walls');
		walls.follow();
		walls.setTileProperties(1, FlxObject.ANY);
		walls.setTileProperties(2, FlxObject.NONE);
		add(walls);

		_player = new Player(100, 200);
		add(_player);

		_bug = new FlxSprite(200, 200);
		_bug.loadGraphic('assets/images/bug.png', false, 32, 32);
		add(_bug);

		_end = new FlxSprite(200, 200);
		_end.loadGraphic('assets/images/end.png', false, 64, 64);
		add(_end);

		map.loadEntities(placeEntities, 'entities');

		FlxG.camera.follow(_player, TOPDOWN, 1);

		super.create();
	}

	function placeEntities(entity:EntityData):Void
	{
		if (entity.name == "player")
		{
			_player.setPosition(entity.x, entity.y);
		}
		else if (entity.name == "bug")
		{
			_bug.setPosition(entity.x + 4, entity.y + 4);
		}
		else if (entity.name == "end")
		{
			_end.setPosition(entity.x + 4, entity.y + 4);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.collide(_player, walls);
		FlxG.overlap(_player, _bug, bugKillsPlayer);
		FlxG.overlap(_player, _end, youwinbroh);
	}

	function bugKillsPlayer(_player:FlxSprite, _bug:FlxSprite)
	{
		_player.kill();

		new FlxTimer().start(0.5, function(tmr:FlxTimer) FlxG.switchState(new GameOverState()));

		FlxG.camera.fade(FlxColor.BLACK, 1.33, false);
	}

	function youwinbroh(_player:FlxSprite, _end:FlxSprite)
	{
		FlxG.switchState(new YouWinState());
	}
}
