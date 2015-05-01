package mynameiszak
{
	
	import flash.utils.getQualifiedClassName;
	
	import events.NavigationEvent;
	
	import screens.BackGround;
	import screens.Home;
	import screens.MainMenu;
	import screens.Screen10;
	import screens.Screen11;
	import screens.Screen12;
	import screens.Screen20;
	import screens.ScreenRegister;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Game extends Sprite
	{
		
		private var screenBG:BackGround;
		private var screenHome:Home;
		private var screenMain:MainMenu;
		private var screen10:Screen10;
		private var screen11:Screen11;
		private var screen12:Screen12;
		private var screen20:Screen20;
		public var screenRegister:ScreenRegister;
	
		
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
			
			screenHome = new Home();
			screenHome.alpha = 0;
			this.addChild(screenHome);
			screenHome.initialize();
			Assets.gameScreens.push([screenHome, Home, "homescreen"]);		

			screenMain = new MainMenu();
			screenMain.alpha = 0;
			screenMain.disposeTemporarily();
			this.addChild(screenMain);
			Assets.gameScreens.push([screenMain, MainMenu, "mainmenuscreen"]);

			screen10 = new Screen10();
			screen10.alpha = 0;
			screen10.disposeTemporarily();
			this.addChild(screen10);
			Assets.gameScreens.push([screen10, Screen10, "screen10"]);
			
			screen11 = new Screen11();
			screen11.alpha = 0;
			screen11.disposeTemporarily();
			this.addChild(screen11);
			Assets.gameScreens.push([screen11, Screen11, "screen11"]);
			
			screen12 = new Screen12();
			screen12.alpha = 0;
			screen12.disposeTemporarily();
			this.addChild(screen12);
			Assets.gameScreens.push([screen12, Screen12, "screen12"]);
			
			screen20 = new Screen20();
			screen20.alpha = 0;
			screen20.disposeTemporarily();
			this.addChild(screen20);
			Assets.gameScreens.push([screen20, Screen20, "screen20"]);
			
			screenRegister = new ScreenRegister();
			screenRegister.alpha = 0;
			screenRegister.disposeTemporarily();
			this.addChild(screenRegister);
			Assets.gameScreens.push([screenRegister, ScreenRegister, "screenregister"]);
				
			this.addEventListener(TouchEvent.TOUCH, onTouch);	
				
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage) as Touch;
			
			if(touch)
			{
				if(touch.phase == TouchPhase.BEGAN)
				{
					trace("There was a touch (MouseDown)");
				}
					
				else if(touch.phase == TouchPhase.ENDED)
				{
					trace("The Touch ended (MouseUp)");
				}
					
				else if(touch.phase == TouchPhase.MOVED)
				{
					trace("dragging | x: " + touch.globalX.toFixed(0).toString() + "  :  y: " + touch.globalY.toFixed(0).toString());
				}
			}
			
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