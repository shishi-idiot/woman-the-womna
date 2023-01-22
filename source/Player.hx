package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;

class Player extends FlxSprite
{
	final SPEED:Int = 400;
	final GRAVITY:Int = 300;

	public function new(xPos:Int = 0, yPos:Int = 0)
	{
		super(xPos, yPos);

		loadGraphic("assets/images/tanya.png", true, 64, 64);
		animation.add("idle", [0, 1], 6);
		animation.add("run", [2, 3], 12);
		animation.add("dodge", [4, 5, 6], 12);
		animation.play("idle");
		drag.x = SPEED * 4;

		// setGraphicSize(Std.int(width * 4));
		updateHitbox();

		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);

		acceleration.y = GRAVITY;
	}

	function movement()
	{
		final right = FlxG.keys.anyPressed([RIGHT, D]);
		final space = FlxG.keys.anyPressed([SPACE]);

		if (right)
		{
			animation.play("run");
		}
		else
		{
			animation.play("idle");
		}
		if (right)
		{
			velocity.x = SPEED;
			facing = FlxObject.LEFT;
		}
	}

	function jumping()
	{
		final jump = FlxG.keys.anyPressed([SPACE, UP, W]);
		if (jump && isTouching(FlxObject.FLOOR))
		{
			velocity.y = -GRAVITY / 1;
		}
	}

	override function update(elapsed:Float)
	{
		jumping();
		super.update(elapsed);
		movement();
	}
}
