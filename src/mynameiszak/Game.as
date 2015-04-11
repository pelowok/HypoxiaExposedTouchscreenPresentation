package mynameiszak
{
	
	import flash.utils.getQualifiedClassName;
	
	import events.NavigationEvent;
	
	import screens.BackGround;
	import screens.Home;
	import screens.MainMenu;
	import screens.Screen10;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		
		private var screenBG:BackGround;
		private var screenHome:Home;
		private var screenMain:MainMenu;
		private var screen10:Screen10;
		
		public function Game()
		{
			 
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		private function onAddedToStage(e:Event):void{
			
			// Signal to debugger that the Starling framework is now available
			trace("starling framework initialized");
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenBG = new BackGround();
			screenBG.alpha = 0;
			this.addChild(screenBG);
			screenBG.initialize();
			
			screen10 = new Screen10();
			screen10.alpha = 0;
			screen10.disposeTemporarily();
			this.addChild(screen10);
			
			screenMain = new MainMenu();
			screenMain.alpha = 0;
			screenMain.disposeTemporarily();
			this.addChild(screenMain);
			
			screenHome = new Home();
			screenHome.alpha = 0;
			this.addChild(screenHome);
			screenHome.initialize();

			
		}
		
		private function onChangeScreen(e:NavigationEvent):void
		{
			
			var obj:Object = e.target;
			var c:Class = Class(obj.constructor);
			
			trace(e.data.id + " was called from function onChangeScreen by class: " + c + ".");
			
			
			switch(e.data.id)
			{
				case "homescreen":
					
					if(c is MainMenu){
						screenMain.disposeTemporarily();
					}
					if(c is Screen10){
						screen10.disposeTemporarily();
					}
					screenHome.initialize();
					
				break;
				
				case "mainmenuscreen":
					
					// Tween out the old screen
					screenHome.disposeTemporarily();
					
					// Add the new screen
					screenMain.initialize();	

				break;
				
				case "screen10":
					
					// Tween out the old screen
					screenMain.disposeTemporarily();
					
					// Add the new screen
					screen10.initialize();	
					
				break;
				
				default:
					trace("changeScreen function hit default value. Release the hounds.");
					break;
			}
				
		}
		
	}
}