package
{
	import flash.display.Sprite;

	import mynameiszak.Game;
	
	import net.hires.debug.Stats;
	
	import starling.core.Starling;
	
	[SWF(framerate="60", width="1920", height="1080", backgroundColor="0x000000")]
	
	public class HypoxiaExposedTouchscreenPresentation extends Sprite
	{
		
		private var stats:Stats;
		public var myStarling:Starling;
		
		public function HypoxiaExposedTouchscreenPresentation()
		{
			
			LaunchMain();

		}
		
		private function LaunchMain():void
		{
			// Launch the Hi-Res stats class for performance tracking.
			stats = new Stats();
			this.addChild(stats);
			
			// Instantiate and start the starling framework.
			// The Game.as class will listen for starling to instantiate and ADD_TO_STAGE
			//   before it begins calling in new objects to the app.
			myStarling = new Starling(Game, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
			
			// Add no code. Any launch code should be added to the Game.as class
			
		}

	}
	
}