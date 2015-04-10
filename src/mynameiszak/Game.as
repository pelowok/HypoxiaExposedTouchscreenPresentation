package mynameiszak
{
	import screens.Home;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		
		private var screenHome:Home;
		
		public function Game()
		{
			// 
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void{
			
			// Signal to debugger that the Starling framework is now available
			trace("starling framework initialized");
			
			LoadExternalContent();
			
			// For debugging, RIGHT_CLICK will close the app
			
			
		}
		
		private function LoadExternalContent():void {
			
			trace("Loading external assets..");
			
			screenHome = new Home();
			this.addChild(screenHome);
			screenHome.initialize();
			
		}
	}
}