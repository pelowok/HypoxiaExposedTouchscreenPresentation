package mynameiszak
{
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import events.NavigationEvent;
	
	import screens.BackGround;
	import screens.Home;
	import screens.MainMenu;
	import screens.Screen10;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
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
			Assets.gameScreens.push([screenBG, BackGround, "background"]);
			
			screen10 = new Screen10();
			screen10.alpha = 0;
			screen10.disposeTemporarily();
			this.addChild(screen10);
			Assets.gameScreens.push([screen10, Screen10, "screen10"]);
			
			screenMain = new MainMenu();
			screenMain.alpha = 0;
			screenMain.disposeTemporarily();
			this.addChild(screenMain);
			Assets.gameScreens.push([screenMain, MainMenu, "mainmenuscreen"]);
			
			screenHome = new Home();
			screenHome.alpha = 0;
			this.addChild(screenHome);
			screenHome.initialize();
			Assets.gameScreens.push([screenHome, Home, "homescreen"]);
			
		}
		
		private function onChangeScreen(e:NavigationEvent):void
		{
			
			var arr:Array = Assets.gameScreens;
			var obj:Object = e.target;
			var c:Class = Class(obj.constructor);
			
			trace(e.data.id + " was called from function onChangeScreen by class: " + c + ".");
			
			// Array checking begins at 1 to skip over BackGround, which is always active
			for(var i:int=1; i<arr.length; i++)
			{
				// Find active screen
				if (arr[i][0] == obj)
				{
					// This screen is being called to visible = false
					// trace("active screen is " + obj);
					if(obj["disposeTemporarily"] is Function)
					{
						obj.disposeTemporarily();
					}
				}
				
				if(arr[i][2] == e.data.id)
				{
					// This screen is being called into visibility
					var objInit:Object = arr[i][0];
					
					// trace("Call in this screen : " + arr[i]);
					if(objInit["initialize"] is Function)
					{
						objInit.initialize();
						
					}
				}
	
			}
					
		}
		
	}
}