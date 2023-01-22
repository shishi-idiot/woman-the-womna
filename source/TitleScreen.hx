package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxVector;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class TitleScreen extends FlxState
{
	private var spacesprite:PressSpaceTitle;

	override public function create()
	{
		FlxG.camera.fade(FlxColor.WHITE, 1, true);

		FlxG.sound.playMusic("assets/music/homecoming", 0.5);

		var bg:FlxSprite = new FlxSprite(-164, -116);
		bg.loadGraphic('assets/images/titlescreen/checkerBGPurp.png', false, 640, 480);
		add(bg);
		var waveEffect = new FlxWaveEffect(FlxWaveMode.ALL, 6, 1, 4);
		var waveSprite = new FlxEffectSprite(bg, [waveEffect]);
		add(waveSprite);

		var logo:FlxSprite = new FlxSprite(70, 26);
		logo.loadGraphic('assets/images/titlescreen/logo.png', false, 513, 179);
		add(logo);

		spacesprite = new PressSpaceTitle(142, 314);
		add(spacesprite);

		FlxG.sound.playMusic('assets/music/homecoming.ogg');
		FlxG.sound.music.fadeIn(5, 0, 0.7);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			trace('ok uhh next screen');

			FlxG.camera.flash(FlxColor.WHITE, 0.4);
			spacesprite.kill();

			FlxG.camera.fade(FlxColor.BLACK, 0.9, false);

			FlxG.sound.play('assets/sounds/confirm.ogg', 0.4);

			new FlxTimer().start(2, function(tmr:FlxTimer) FlxG.switchState(new StoryState()));
		}

		super.update(elapsed);
	}
}
