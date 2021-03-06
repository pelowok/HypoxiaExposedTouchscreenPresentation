package screens
{
	import com.greensock.TweenLite;
	
	import flash.desktop.NativeApplication;
	
	import events.NavigationEvent;
	
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;
	
	import mynameiszak.Game;
	import mynameiszak.RegistrationForm;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.extensions.plasticsurgeon.StarlingTimer;
	import starling.extensions.plasticsurgeon.StarlingTimerEvent;
	
	public class ScreenRegister extends Sprite
	{
	
	//	trace("DEBUG: bg1 appears in the ScreenRegister class as well as the RegistrationForm class");
		
	//	private var bg1:Image;
		private var bg2:Image;
		
		private var newForm:RegistrationForm;
		
		private var btnReturn:Button;
		private var btnX:Button;
		
		private var footer:Image;
		private var logo:Button;
		
		private var sidenav:TabBar;
		
		private var quitTimer:StarlingTimer;
		
		public function ScreenRegister()
		{
			super();
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void
		{
			
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			trace(e.target + " added to stage.");
			drawScreen();
			
		}
		
		private function drawScreen():void 
		{
			
			// For each object in drawScreen,
			// position value should be the same
			// in drawScreen() and initialize()
			
		// Deprecated	
		//	bg1 = new Image(Assets.getTexture("ScreenFormBG1"));
		
		// In-progress form
		
			//  bg1 was moved to RegistrationForm class
			//	bg1 = new Image(Assets.getTexture("ScreenFormBG1"));
			//	bg1.x = 0;
			//	bg1.y = 200;
			//	this.addChild(bg1);
			
			bg2 = new Image(Assets.getTexture("ScreenFormBG2"));
			bg2.x = 0;
			bg2.y = 200;
			this.addChild(bg2);
			
			btnReturn = new Button(Assets.getTexture("ScreenFormBtnReturn"),"",Assets.getTexture("ScreenFormBtnReturn"));
			btnReturn.x = 480;
			btnReturn.y = 900;
			btnReturn.visible = false;
			this.addChild(btnReturn);
			
			logo = new Button(Assets.getTexture("HypoxiaExposedLogo"),"",Assets.getTexture("HypoxiaExposedLogoGlow"));
			logo.x = 50;
			logo.y = 15;
			logo.scaleX = 0.33;
			logo.scaleY = 0.33;
			this.addChild(logo);
			
			footer = new Image(Assets.getTexture("Footer"));
			footer.x = 0;
			footer.y = 979;
			this.addChild(footer);
			
			this.addChild(AddSideNav());
			
			newForm = new RegistrationForm();
			newForm.x = 0;
			newForm.y = 168;
			this.addChild(newForm);
			
			btnX = new Button(Assets.getTexture("RegBtnX"),"",Assets.getTexture("RegBtnX"));
			btnX.x = 1530;
			btnX.y = 200;
			btnX.visible = true;
			this.addChild(btnX);
			
		//	AddOverlay();
			
		}
		
		private function AddOverlay():void	
		{
			var overlay:Overlay = new Overlay();
			overlay.touchable = false;
			overlay.name = "gridoverlay";
			this.addChild(overlay);
		}

		private function AddSideNav():TabBar{
			
			sidenav = new TabBar();
			
			sidenav.dataProvider = new ListCollection(
				[
					{ 	label:"",
						defaultIcon: new Image( Assets.getTexture("SideNav1a") ),
						hoverIcon: new Image( Assets.getTexture("SideNav1b") ),
						downIcon: new Image( Assets.getTexture("SideNav1b") ),
						defaultSelectedIcon: new Image( Assets.getTexture("SideNav1b") )
					},
				]);
			
			sidenav.x = 1733;
			sidenav.y = 50;
			sidenav.gap = 2;
			
			return(sidenav);
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;

			sidenav.visible = true;
			DeselectSideNav();
			
		//	bg1.visible = true;
			newForm.visible = true;

			bg2.visible = false;
			
			
			btnReturn.visible = false;

			footer.visible = true;
			
			// Start listening to events
		//	this.addEventListener(Event.ENTER_FRAME, screenAnimation);
			
			logo.addEventListener(Event.TRIGGERED, onLogoTriggered);

			sidenav.addEventListener(Event.CHANGE, toggleSideNav);	
			
			btnX.visible = false;

			this.setChildIndex(btnX, this.numChildren -1);
			
			// Tween screen to visible
			TweenLite.to(this, 0.5, {alpha:1});
			
		}
		
		private function DeselectSideNav():void
		{
			sidenav.selectedIndex = -1;
		}

		private function toggleSideNav(e:Event):void
		{
			
			var tabs:TabBar = TabBar( e.currentTarget );
			trace( "  -->selectedIndex:", tabs.selectedIndex );
			switch (tabs.selectedIndex)
			{
				case 0:
					
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "mainmenuscreen"}));
					
					break;

				default:
					trace("ERROR THROWN: tabs.selectedIndex in toggleSideNav was :" + tabs.selectedIndex);
					break;
			}
			
		}
		
		private function onLogoTriggered():void
		{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "homescreen"}));
			
		}
		
		private function screenAnimation(e:Event):void
		{
			
			// Start animations			
			var currentDate:Date = new Date();
			var speed:Number = 0.0006;
			var n:Number = 0.7 + (Math.cos(currentDate.getTime() * speed) * 0.3);
			
			logo.alpha = (n * -1) + 1.4;			
			
		}
		
		public function ChangeFormBG():void{
			
			newForm.visible = false;
			
			bg2.visible = true;
			btnReturn.visible = true;
			btnX.visible = true;
			
			if(btnX.hasEventListener(Event.TRIGGERED))
			{
				
				btnX.removeEventListener(Event.TRIGGERED, CallHomeScreen);
				
			}
			
			btnReturn.addEventListener(Event.TRIGGERED, CallLastScreen);
			btnX.addEventListener(Event.TRIGGERED, CallHomeScreen);
			
			StartQuitTimer();
			
		}
		
		private function CallLastScreen(e:Event):void{
			
			if(quitTimer){
				
				if( quitTimer.hasEventListener(StarlingTimerEvent.TIMER_COMPLETE) )
				{
					quitTimer.removeEventListener(StarlingTimerEvent.TIMER_COMPLETE, onQuitTimerComplete);
				}
				
			}
			
			this.cleanUp();
			
			// this call resets the data in the form by calling in a new instance of the form
			this.initialize();
			
			trace("CALLING : " + Assets.globalReturnScreenID);
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: Assets.globalReturnScreenID }));
			
		}
		
		private function CallHomeScreen(e:Event):void
		{
			
			if(quitTimer){
				
				if( quitTimer.hasEventListener(StarlingTimerEvent.TIMER_COMPLETE) )
				{
					quitTimer.removeEventListener(StarlingTimerEvent.TIMER_COMPLETE, onQuitTimerComplete);
				}
				
			}
			
			this.cleanUp();
			
			// this call resets the data in the form by calling in a new instance of the form
			this.initialize();
			
			trace("CALLING : HomeScreen");
			// reset the Assets.globalReturnScreenID to Home, so the next user doesn't back out to the wrong screen
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "homescreen"}));
			
		}
		
		private function StartQuitTimer():void
		{
			
			if(quitTimer){
				
				if( quitTimer.hasEventListener(StarlingTimerEvent.TIMER_COMPLETE) )
				{
					quitTimer.removeEventListener(StarlingTimerEvent.TIMER_COMPLETE, onQuitTimerComplete);
				}
				
			}
			
			quitTimer = new StarlingTimer(Starling.juggler, 1000, 5);
			quitTimer.addEventListener(StarlingTimerEvent.TIMER_COMPLETE, onQuitTimerComplete);
			quitTimer.start();
			
		}
		
		private function onQuitTimerComplete(e:StarlingTimerEvent):void
		{
			
			quitTimer.removeEventListener(StarlingTimerEvent.TIMER_COMPLETE, onQuitTimerComplete);
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "homescreen"}));
			
		}
		
		public function disposeTemporarily():void
		{
			TweenLite.to(this, 0.5, {alpha:0, onComplete:cleanUp});
		}
		
		private function cleanUp():void
		{
			trace("ScreenRegister function cleanUp was called");
			this.visible = false;
			
			// Remove unneeded objects and listeners
			if(this.hasEventListener(Event.ENTER_FRAME))
			{
				
				this.removeEventListener(Event.ENTER_FRAME, screenAnimation);
				
			}
			
			if(logo.hasEventListener(Event.TRIGGERED))
			{
				
				logo.removeEventListener(Event.TRIGGERED, onLogoTriggered);
				
			}
			
			if(btnReturn.hasEventListener(Event.TRIGGERED))
			{
				btnReturn.removeEventListener(Event.TRIGGERED, CallLastScreen);
			}
			
			if(btnX.hasEventListener(Event.TRIGGERED))
			{
				btnX.removeEventListener(Event.TRIGGERED, CallHomeScreen);
			}
			
			newForm.ResetFormData();
			
			// This commented method was causing a memory leak. It doesn't dispose of the textures
			// in the newForm that it removes, so the app runs out of texture memory quickly. If you
			// must use this method, you need to dispose of the newForm textures or you will be a sad
			// little code monkey for many days.
			
		//	this.removeChild(newForm);
			
		//	newForm = new RegistrationForm();
		//	newForm.x = 0;
		//	newForm.y = 168;
		//	this.addChild(newForm);
			
			btnX.visible = false;
			this.setChildIndex(btnX, this.numChildren -1);
			
		}
	}
}