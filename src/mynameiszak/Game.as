package mynameiszak
{
	import events.NavigationEvent;
	
	import screens.Home;
	import screens.MainMenu;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import com.greensock.TweenLite;
	
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
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenMain = new MainMenu();
			screenMain.disposeTemporarily();
			this.addChild(screenMain);
			
			screenHome = new Home();
			this.addChild(screenHome);
			screenHome.initialize();
			
		}
		
		private function onChangeScreen(e:NavigationEvent):void
		{
			
			trace(e.data.id + " was called from function onChangeScreen.");
			
			switch(e.data.id)
			{
				case "mainmenuscreen":
					
					trace("function onChangeScreen called the main menu");
					
					
					// Tween out the old screen
					screenHome.disposeTemporarily();
					
					// Add the new screen
					screenMain.initialize();	
					
					// On complete tween out, destroy the old screen and its listeners
					trace("Change Screen was called from " + e.target + ". Is this a valid destruction target?");
					

				break;
				
				default:
					trace("changeScreen function hit default value. Release the hounds.");
					break;
			}
				
		}
	}
}