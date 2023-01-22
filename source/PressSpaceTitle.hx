package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.animation.FlxBaseAnimation;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class PressSpaceTitle extends FlxSprite
{
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		var tex = FlxAtlasFrames.fromSparrow('assets/images/titlescreen/pressButton.png', 'assets/images/titlescreen/pressButton.xml');
		frames = tex;

		animation.addByPrefix('idle', 'press space', 24, false);
		animation.addByPrefix('press', 'pressed space', 24, false);
		animation.play('idle');
		setGraphicSize(0, 100);
		updateHitbox();
		antialiasing = true;

		pressedSpaceLMAO();
	}

	function pressedSpaceLMAO():Void
	{
		if (FlxG.keys.justPressed.SPACE)
			animation.play('pressed');
	}
}
