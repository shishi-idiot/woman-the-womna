package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxTimer;

class StartState extends FlxState
{
	override public function create()
	{
		trace('WE IN THIS');

		FlxG.sound.play('assets/sounds/shitag.ogg', 0.4);

		var splash:FlxSprite = new FlxSprite(-62, -36);
		splash.loadGraphic('assets/images/titlescreen/startCredit.png', false, 758, 577);
		add(splash);

		new FlxTimer().start(2, function(tmr:FlxTimer) FlxG.switchState(new TitleScreen()));

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
