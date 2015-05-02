package mynameiszak
{
	
	import com.greensock.TweenLite;
	
	import flash.display.Stage;
	import flash.utils.getQualifiedClassName;
	
	import events.NavigationEvent;
	import events.VideoCompleteEvent;
	
	import screens.BackGround;
	import screens.Home;
	import screens.MainMenu;
	import screens.Screen10;
	import screens.Screen11;
	import screens.Screen12;
	import screens.Screen20;
	import screens.ScreenRegister;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.extensions.plasticsurgeon.StarlingTimer;
	import starling.extensions.plasticsurgeon.StarlingTimerEvent;
	
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
		
		public var countdown:StarlingTimer;
		public var overlay:Stage;
		private var video:LocalVideoPlayer;
		private var hitscreen:UnstyledButton;
		private var screensavervideo:Boolean;
	
		
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
			
			// SCREENSAVER
			
			hitscreen = new UnstyledButton(Assets.getTexture("HitScreen"),"",Assets.getTexture("HitScreen")); 
			hitscreen.x = 0;
			hitscreen.y = 0;
			hitscreen.visible = false;
			this.addChild(hitscreen);
			
			overlay = Starling.current.nativeOverlay.stage;
			
			StartNewCountdown(15);
				
			screensavervideo = new Boolean(true);
			
		}
		
		public function StartNewCountdown(i:int):void
		{
			
			if(countdown){
				
				if( countdown.hasEventListener(StarlingTimerEvent.TIMER) )
				{
					countdown.removeEventListener(StarlingTimerEvent.TIMER, onTimerUpdate);
				}
				
				if( countdown.hasEventListener(StarlingTimerEvent.TIMER_COMPLETE) )
				{
					countdown.removeEventListener(StarlingTimerEvent.TIMER_COMPLETE, onTimerComplete);
				}
				
			}
			
			countdown = new StarlingTimer(Starling.juggler, 1000, i);
			countdown.addEventListener(StarlingTimerEvent.TIMER, onTimerUpdate);
			countdown.addEventListener(StarlingTimerEvent.TIMER_COMPLETE, onTimerComplete);
			countdown.start();
			
		}
		
		private function onTimerComplete(e:StarlingTimerEvent):void
		{
			
			countdown.removeEventListener(StarlingTimerEvent.TIMER, onTimerUpdate);
			countdown.removeEventListener(StarlingTimerEvent.TIMER_COMPLETE, onTimerComplete);
			
			var str:String = new String();
			if(screensavervideo === true)
			{
				
				str = "../video/LM_RS_Master_Edit_SUBS_23.mov";
				
			} else {
				
				str = "../video/LM_TG_Master_Edit_SUBS_24.mov";
				
			}
			
			screensavervideo = !screensavervideo;
			
			trace("Launching screensaver : " + str );
			
			video = new LocalVideoPlayer( str );
			
			hitscreen.visible = true;
			hitscreen.addEventListener(Event.TRIGGERED, RemoveVideo);
			
			video.addEventListener(VideoCompleteEvent.COMPLETED, VideoEnded);
			
			overlay.addChild(video);
			
		}
		
		private function VideoEnded(e:VideoCompleteEvent):void
		{
			trace("VideoEnded called by : " + e.target);
			
			video.removeEventListener(VideoCompleteEvent.COMPLETED, VideoEnded);
			
			RemoveVideo(null);
			
			StartNewCountdown(15);
			
		}
		
		private function RemoveVideo(e:Event=null):void
		{
			
			hitscreen.removeEventListener(Event.TRIGGERED, RemoveVideo);
			
			//	btnVideo.visible = false;
			hitscreen.visible = false;
			
			// remove the video
			for(var i:int=0; i < overlay.numChildren; i++)
			{
				
				trace("(" + i + " of  " + overlay.numChildren + ") : " + overlay.getChildAt(i));
				
				if(overlay.getChildAt(i) is LocalVideoPlayer)
				{
					try
					{
						var lvp:LocalVideoPlayer = overlay.getChildAt(i) as LocalVideoPlayer;
						
						lvp.RemoveVideo();
						
						trace("Removing LocalVideoPlayer from overlay..");
						overlay.removeChild(lvp);
						
					} catch(err:Error) {
						trace(err);
					}
					
				}
				
			}
			
		}
		
		
		private function onTimerUpdate(e:StarlingTimerEvent):void
		{
			
			var timer:StarlingTimer = e.target as StarlingTimer;
			
			trace(timer.currentCount);
			
		}
		
		
		
		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage) as Touch;
			
			if(touch)
			{
				if(touch.phase == TouchPhase.BEGAN)
				{
					trace("There was a touch (MouseDown)");
					
					// reset the time-out countdown
					StartNewCountdown(120);
					
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