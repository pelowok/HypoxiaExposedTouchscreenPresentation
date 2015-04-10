package mynameiszak
{
	import events.NavigationEvent;
	
	import screens.Home;
	import screens.MainMenu;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		
		private var screenHome:Home;
		private var screenMain:MainMenu;
		
		public function Game()
		{
			// 
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void{
			
			// Signal to debugger that the Starling framework is now available
			trace("starling framework initialized");
			
			LoadHomeScreen();
			
		}
		
		private function LoadHomeScreen():void {
			
			trace("Loading external assets..");
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenMain = new MainMenu();
			this.addChild(screenMain);
			
			screenHome = new Home();
			this.addChild(screenHome);
			screenHome.initialize();
			
		}
		
		private function onChangeScreen(e:NavigationEvent):void
		{
			switch(e.params.id)
			{
				case "mainscreen";
				break;
				
			}
		}
	}
}