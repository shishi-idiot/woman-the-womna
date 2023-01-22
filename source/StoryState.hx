package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class StoryState extends FlxState
{
	var slide1:FlxSprite;
	var slide2:FlxSprite;
	var slide3:FlxSprite;

	override public function create()
	{
		trace('this is the story');

		FlxG.camera.fade(FlxColor.BLACK, 1, true);

		slide3 = new FlxSprite();
		slide3.loadGraphic('assets/images/thestory/page-3.png');
		add(slide3);

		slide2 = new FlxSprite();
		slide2.loadGraphic('assets/images/thestory/page-2.png');
		add(slide2);

		slide1 = new FlxSprite();
		slide1.loadGraphic('assets/images/thestory/page-1.png');
		add(slide1);

		super.create();

		new FlxTimer().start(6, function(tmr:FlxTimer) page2());
	}

	function page2():Void
	{
		slide1.kill();

		new FlxTimer().start(6, function(tmr:FlxTimer) page3());
	}

	function page3():Void
	{
		slide2.kill();

		new FlxTimer().start(6, function(tmr:FlxTimer) weinthis());
	}

	function weinthis():Void
	{
		var letsgo:FlxSprite = new FlxSprite(0, 0);
		letsgo.loadGraphic('assets/images/herewego.png', false, 640, 480);
		add(letsgo);

		slide3.kill();

		FlxG.sound.music.stop();

		FlxG.sound.play('assets/sounds/cartoon.ogg', 0.4);

		new FlxTimer().start(3, function(tmr:FlxTimer) FlxG.switchState(new PlayState()));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
