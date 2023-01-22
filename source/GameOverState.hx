package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class GameOverState extends FlxState
{
	override public function create()
	{
		trace('moral of the story: dont try');

		FlxG.camera.fade(FlxColor.BLACK, 1.33, true);

		var bg:FlxSprite = new FlxSprite(0, 0);
		bg.loadGraphic('assets/images/tryagain.png', false, 640, 480);
		add(bg);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE)
		{
			trace('letsaGOOOOO');
			FlxG.switchState(new TitleScreen());
		}
	}
}
