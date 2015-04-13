package screens
{
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	
	public class Screen20 extends Sprite
	{
		
		private var bg:Image;
		
		private var btn1b:Button;
		private var btn2b:Button;
		private var btn3b:Button;
		private var btn4b:Button;
		
		private var ref1:Button;
		private var ref2:Button;
		private var ref3:Button;
		private var ref4:Button;
		
		private var btnSend1:Button;
		private var btnSend2:Button;
		private var btnSend3:Button;
		private var btnSend4:Button;
		
		private var btnRef1:Button;
		private var btnRef2:Button;
		private var btnRef3:Button;
		private var btnRef4:Button;
		
		private var footer:Image;
		private var logo:Button;
		
		private var pagenav:TabBar;
		private var sidenav:TabBar;
		
		public function Screen20()
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
			
			bg = new Image(Assets.getTexture("Screen20BG"));
			bg.x = 0;
			bg.y = 170;
			this.addChild(bg);
			
			this.addChild(AddPageNav());
			
			btn1b = new Button(Assets.getTexture("Screen20Nav1b"),"",Assets.getTexture("Screen20Nav1b"));
			btn1b.x = 0;
			btn1b.y = 0;
			btn1b.visible = false;
			this.addChild(btn1b);
			
			btn2b = new Button(Assets.getTexture("Screen20Nav2b"),"",Assets.getTexture("Screen20Nav2b"));
			btn2b.x = 0;
			btn2b.y = 0;
			btn2b.visible = false;
			this.addChild(btn2b);
			
			btn3b = new Button(Assets.getTexture("Screen20Nav3b"),"",Assets.getTexture("Screen20Nav3b"));
			btn3b.x = 0;
			btn3b.y = 0;
			btn3b.visible = false;
			this.addChild(btn3b);
			
			btn4b = new Button(Assets.getTexture("Screen20Nav3b"),"",Assets.getTexture("Screen20Nav3b"));
			btn4b.x = 0;
			btn4b.y = 0;
			btn4b.visible = false;
			this.addChild(btn4b);
			
			btnRef1 = new Button(Assets.getTexture("Screen20BtnRef"),"",Assets.getTexture("Screen20BtnRef"));
			btnRef1.x = 400;
			btnRef1.y = 850;
			btnRef1.visible = false;
			this.addChild(btnRef1);
			
			btnRef2 = new Button(Assets.getTexture("Screen20BtnRef"),"",Assets.getTexture("Screen20BtnRef"));
			btnRef2.x = 400;
			btnRef2.y = 850;
			btnRef2.visible = false;
			this.addChild(btnRef2);
			
			btnRef3 = new Button(Assets.getTexture("Screen20BtnRef"),"",Assets.getTexture("Screen20BtnRef"));
			btnRef3.x = 400;
			btnRef3.y = 850;
			btnRef3.visible = false;
			this.addChild(btnRef3);
			
			btnRef4 = new Button(Assets.getTexture("Screen20BtnRef"),"",Assets.getTexture("Screen20BtnRef"));
			btnRef4.x = 400;
			btnRef4.y = 850;
			btnRef4.visible = false;
			this.addChild(btnRef4);
			
			btnSend1 = new Button(Assets.getTexture("Screen20BtnSend"),"",Assets.getTexture("Screen20BtnSend"));
			btnSend1.x = 700;
			btnSend1.y = 850;
			btnSend1.visible = false;
			this.addChild(btnSend1);
			
			btnSend2 = new Button(Assets.getTexture("Screen20BtnSend"),"",Assets.getTexture("Screen20BtnSend"));
			btnSend2.x = 700;
			btnSend2.y = 850;
			btnSend2.visible = false;
			this.addChild(btnSend2);
			
			btnSend3 = new Button(Assets.getTexture("Screen20BtnSend"),"",Assets.getTexture("Screen20BtnSend"));
			btnSend3.x = 700;
			btnSend3.y = 850;
			btnSend3.visible = false;
			this.addChild(btnSend3);
			
			btnSend4 = new Button(Assets.getTexture("Screen20BtnSend"),"",Assets.getTexture("Screen20BtnSend"));
			btnSend4.x = 700;
			btnSend4.y = 850;
			btnSend4.visible = false;
			this.addChild(btnSend4);
			
			logo = new Button(Assets.getTexture("HypoxiaExposedLogo"));
			logo.x = 50;
			logo.y = 10;
			logo.scaleX = 0.25;
			logo.scaleY = 0.25;
			this.addChild(logo);
			
			footer = new Image(Assets.getTexture("Footer"));
			footer.x = 0;
			footer.y = 979;
			this.addChild(footer);
			
			this.addChild(AddSideNav());
			
			// Ref object has to be on top of everything
			ref1 = new Button(Assets.getTexture("Screen20Ref1"),"",Assets.getTexture("Screen20Ref1"));
			ref1.x = 5;
			ref1.y = 1080;
			ref1.visible = false;
			this.addChild(ref1);
			
			ref2 = new Button(Assets.getTexture("Screen20Ref2"),"",Assets.getTexture("Screen20Ref2"));
			ref2.x = 5;
			ref2.y = 1080;
			ref2.visible = false;
			this.addChild(ref2);
			
			ref3 = new Button(Assets.getTexture("Screen20Ref3"),"",Assets.getTexture("Screen20Ref3"));
			ref3.x = 5;
			ref3.y = 1080;
			ref3.visible = false;
			this.addChild(ref3);
			
			ref4 = new Button(Assets.getTexture("Screen20Ref4"),"",Assets.getTexture("Screen20Ref4"));
			ref4.x = 5;
			ref4.y = 1080;
			ref4.visible = false;
			this.addChild(ref4);
			
		}
		
		private function AddPageNav():TabBar{
			
			pagenav = new TabBar();
			
			pagenav.dataProvider = new ListCollection(
				[
					{ 	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen20Nav1a") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen20Nav2a") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen20Nav3a") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen20Nav4a") )
					},
				]);
			
			pagenav.x = 275;
			pagenav.y = 470;
			pagenav.gap = 10;
			
			return(pagenav);
			
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
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("SideNav3a") ),
						hoverIcon: new Image( Assets.getTexture("SideNav3b") ),
						downIcon: new Image( Assets.getTexture("SideNav3b") ),
						defaultSelectedIcon: new Image( Assets.getTexture("SideNav3b") )
					},
				]);
			
			sidenav.x = 1160;
			sidenav.y = 10;
			sidenav.gap = 2;
			
			return(sidenav);
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			
			Assets.globalReturnScreenID = "screen20";
			trace("ASSIGNING globalReturnScreenID: " + Assets.globalReturnScreenID);
			
			this.visible = true;
			
			togglePageButtons(-1);
			
			pagenav.visible = true;
			DeselectPageNav();
			
			sidenav.visible = true;
			DeselectSideNav();

			footer.visible = true;
			
			// ref can move so reset it's alpha and position
			ref1.alpha = 0;
			ref1.x = 0;
			ref1.y = 1080;
			ref1.visible = false;
			
			ref2.alpha = 0;
			ref2.x = 0;
			ref2.y = 1080;
			ref2.visible = false;
			
			ref3.alpha = 0;
			ref3.x = 0;
			ref3.y = 1080;
			ref3.visible = false;
			
			ref4.alpha = 0;
			ref4.x = 0;
			ref4.y = 1080;
			ref4.visible = false;
			
			btnRef1.visible = false;
			btnRef2.visible = false;
			btnRef3.visible = false;
			btnRef4.visible = false;
			
			btnSend1.visible = false;
			btnSend2.visible = false;
			btnSend3.visible = false;
			btnSend4.visible = false;
			
			
			// Start listening to events
			
			logo.addEventListener(Event.TRIGGERED, onLogoTriggered);
			
			btn1b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			btn2b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			btn3b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			btn4b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			
			btnRef1.addEventListener(Event.TRIGGERED, ToggleRef1);
			btnRef2.addEventListener(Event.TRIGGERED, ToggleRef2);
			btnRef3.addEventListener(Event.TRIGGERED, ToggleRef3);
			btnRef4.addEventListener(Event.TRIGGERED, ToggleRef4);
			
			btnSend1.addEventListener(Event.TRIGGERED, CallRegistrationScreen);
			btnSend2.addEventListener(Event.TRIGGERED, CallRegistrationScreen);
			btnSend3.addEventListener(Event.TRIGGERED, CallRegistrationScreen);
			btnSend4.addEventListener(Event.TRIGGERED, CallRegistrationScreen);

			pagenav.addEventListener(Event.CHANGE, togglePageNav);
			sidenav.addEventListener(Event.CHANGE, toggleSideNav);	
			
			// Tween screen to visible
			TweenLite.to(this, 0.5, {alpha:1});
			
		}
		
		private function ToggleRef1(e:Event):void
		{
				ref1.visible = true;
				TweenLite.to(ref1, 0.7, {alpha: 1, y: 0, onComplete: AddRefListener1});	
		}
		private function ToggleRef2(e:Event):void
		{
			ref2.visible = true;
			TweenLite.to(ref2, 0.7, {alpha: 1, y: 0, onComplete: AddRefListener2});	
		}
		private function ToggleRef3(e:Event):void
		{
			ref3.visible = true;
			TweenLite.to(ref3, 0.7, {alpha: 1, y: 0, onComplete: AddRefListener3});	
		}
		private function ToggleRef4(e:Event):void
		{
			ref4.visible = true;
			TweenLite.to(ref4, 0.7, {alpha: 1, y: 0, onComplete: AddRefListener4});	
		}
		private function AddRefListener1():void
		{
			ref1.addEventListener(Event.TRIGGERED, HideRef);
			
		}
		private function AddRefListener2():void
		{
			ref2.addEventListener(Event.TRIGGERED, HideRef);
			
		}
		private function AddRefListener3():void
		{
			
			ref3.addEventListener(Event.TRIGGERED, HideRef);
			
		}
		private function AddRefListener4():void
		{
			
			ref4.addEventListener(Event.TRIGGERED, HideRef);
			
		}
		
		private function DeselectPageNav():void
		{

			pagenav.selectedIndex = -1;
			togglePageButtons(-1);				

		}
		
		private function DeselectSideNav():void
		{
			sidenav.selectedIndex = -1;
		}
		

		private function togglePageButtons(i:int):void
		{
			
			switch (i)
			{
				case -1:
					btn1b.visible = false;
					btn2b.visible = false;
					btn3b.visible = false;
					btn4b.visible = false;
					
					btnRef1.visible = false;
					btnSend1.visible = false;
					
					btnRef2.visible = false;
					btnSend2.visible = false;
					
					btnRef3.visible = false;
					btnSend3.visible = false;
					
					btnRef4.visible = false;
					btnSend4.visible = false;
					
					break;
				case 0:
					btn1b.visible = true;
					btnRef1.visible = true;
					btnSend1.visible = true;
					break;
				case 1:
					btn2b.visible = true;
					btnRef2.visible = true;
					btnSend2.visible = true;
					break;
				case 2:
					btn3b.visible = true;
					btnRef3.visible = true;
					btnSend3.visible = true;
					break;
				case 3:
					btn4b.visible = true;
					btnRef4.visible = true;
					btnSend4.visible = true;
					break;
				default:
					trace("ERROR THROWN: tabs.selectedIndex passed to togglePageButtons was :" + i);
					break;
				
			}
			
		}
		
		private function togglePageNav(e:Event):void
		{
			
			var tabs:TabBar = TabBar( e.currentTarget );
			trace( "  -->selectedIndex:", tabs.selectedIndex );
			
			// Close any open Page Navs
			togglePageButtons(-1);
			
			// Open new Page Nav
			togglePageButtons(tabs.selectedIndex);
			
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
				case 1:
					
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screenregister"}));
					
					break;
				default:
					trace("ERROR THROWN: tabs.selectedIndex in toggleSideNav was :" + tabs.selectedIndex);
					break;
			}
			
		}
	
		private function HideRef(e:Event):void
		{
			
			trace(e.target + " should be a button instance, is it?");
			
			var btn:Button = e.target as Button;
			
			btn.removeEventListener(Event.TRIGGERED, HideRef);
			TweenLite.to(btn, 0.7, {alpha: 0, y: 1080, onComplete: DeselectSideNav});

		}
		
		private function onLogoTriggered():void
		{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "homescreen"}));
			
		}
		
		private function CallRegistrationScreen(e:Event):void
		{
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screenregister"}));
		}
		
		public function disposeTemporarily():void
		{
			TweenLite.to(this, 0.5, {alpha:0, onComplete:cleanUp});
		}
		
		private function cleanUp():void
		{
			this.visible = false;
			
			// Remove unneeded objects and listeners
			
			if(logo.hasEventListener(Event.TRIGGERED))
			{
				logo.removeEventListener(Event.TRIGGERED, onLogoTriggered);
			}
			
			if(btn1b.hasEventListener(Event.TRIGGERED))
			{
				btn1b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
			}
			if(btn2b.hasEventListener(Event.TRIGGERED))
			{
				btn2b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
			}
			if(btn3b.hasEventListener(Event.TRIGGERED))
			{
				btn3b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
			}
			if(btn4b.hasEventListener(Event.TRIGGERED))
			{
				btn4b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
			}
			
			trace("MANY EVENT LISTENERS REMAIN ACTIVE. DEBUG!");
		/*	
			btnRef1.addEventListener(Event.TRIGGERED, ToggleRef1);
			btnRef2.addEventListener(Event.TRIGGERED, ToggleRef2);
			btnRef3.addEventListener(Event.TRIGGERED, ToggleRef3);
			btnRef4.addEventListener(Event.TRIGGERED, ToggleRef4);
			
			btnSend1.addEventListener(Event.TRIGGERED, CallRegistrationScreen);
			btnSend2.addEventListener(Event.TRIGGERED, CallRegistrationScreen);
			btnSend3.addEventListener(Event.TRIGGERED, CallRegistrationScreen);
			btnSend4.addEventListener(Event.TRIGGERED, CallRegistrationScreen);
			
			pagenav.addEventListener(Event.CHANGE, togglePageNav);
			sidenav.addEventListener(Event.CHANGE, toggleSideNav);
		*/
		}
	}
}