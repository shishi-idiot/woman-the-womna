package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class YouWinState extends FlxState
{
	override public function create()
	{
		FlxG.sound.music.stop();

		FlxG.sound.play('assets/sounds/ballsvictory.ogg');

		var bg:FlxSprite = new FlxSprite(0, 0);
		bg.loadGraphic('assets/images/goodjob.png', false, 640, 480);
		add(bg);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE)
		{
			trace('we can go again tho');
			FlxG.switchState(new TitleScreen());
		}
	}
}
