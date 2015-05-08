package screens
{
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import feathers.controls.TabBar;
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
		
		private var ref1:Image;
		private var ref2:Image;
		private var ref3:Image;
		private var ref4:Image;
		
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
		
		private var graphic1:Screen20Graphic1;
		private var graphic2:Screen20Graphic2;
		private var graphic3:Screen20Graphic3;
		private var graphic4:Screen20Graphic4;
		
		private var hitscreen:Button;
		
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
			this.addChild(btn1b);
			
			btn2b = new Button(Assets.getTexture("Screen20Nav2b"),"",Assets.getTexture("Screen20Nav2b"));
			this.addChild(btn2b);
			
			btn3b = new Button(Assets.getTexture("Screen20Nav3b"),"",Assets.getTexture("Screen20Nav3b"));
			this.addChild(btn3b);
			
			btn4b = new Button(Assets.getTexture("Screen20Nav4b"),"",Assets.getTexture("Screen20Nav4b"));
			this.addChild(btn4b);
			
			graphic1 = new Screen20Graphic1();
			graphic1.x = 1101;
			graphic1.y = 252;
			btn1b.addChild(graphic1);
			
			graphic2 = new Screen20Graphic2();
			graphic2.x = 1088;
			graphic2.y = 288;
			btn2b.addChild(graphic2);
			
			graphic3 = new Screen20Graphic3();
			graphic3.x = 1110;
			graphic3.y = 280;
			btn3b.addChild(graphic3);
			
			graphic4 = new Screen20Graphic4();
			graphic4.x = 375;
			graphic4.y = 312;
			btn4b.addChild(graphic4);
			
			btnRef1 = new Button(Assets.getTexture("Screen20BtnRef"),"",Assets.getTexture("Screen20BtnRef"));
			btnRef1.x = 639;
			btnRef1.y = 856;
			btnRef1.visible = false;
			this.addChild(btnRef1);
			
			btnRef2 = new Button(Assets.getTexture("Screen20BtnRef"),"",Assets.getTexture("Screen20BtnRef"));
			btnRef2.x = 639;
			btnRef2.y = 828;
			btnRef2.visible = false;
			this.addChild(btnRef2);
			
			btnRef3 = new Button(Assets.getTexture("Screen20BtnRef"),"",Assets.getTexture("Screen20BtnRef"));
			btnRef3.x = 639;
			btnRef3.y = 818;
			btnRef3.visible = false;
			this.addChild(btnRef3);
			
			btnRef4 = new Button(Assets.getTexture("Screen20BtnRef"),"",Assets.getTexture("Screen20BtnRef"));
			btnRef4.x = 639;
			btnRef4.y = 872;
			btnRef4.visible = false;
			this.addChild(btnRef4);
			
			btnSend1 = new Button(Assets.getTexture("Screen20BtnSend"),"",Assets.getTexture("Screen20BtnSend"));
			btnSend1.x = 370;
			btnSend1.y = 856;
			btnSend1.visible = false;
			this.addChild(btnSend1);
			
			btnSend2 = new Button(Assets.getTexture("Screen20BtnSend"),"",Assets.getTexture("Screen20BtnSend"));
			btnSend2.x = 370;
			btnSend2.y = 828;
			btnSend2.visible = false;
			this.addChild(btnSend2);
			
			btnSend3 = new Button(Assets.getTexture("Screen20BtnSend"),"",Assets.getTexture("Screen20BtnSend"));
			btnSend3.x = 370;
			btnSend3.y = 818;
			btnSend3.visible = false;
			this.addChild(btnSend3);
			
			btnSend4 = new Button(Assets.getTexture("Screen20BtnSend"),"",Assets.getTexture("Screen20BtnSend"));
			btnSend4.x = 370;
			btnSend4.y = 872;
			btnSend4.visible = false;
			this.addChild(btnSend4);
			
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
			
			// Ref object has to be on top of everything
			ref1 = new Image(Assets.getTexture("Screen20Ref1"));
			ref1.x = 5;
			ref1.y = 1080;
		//	ref1.visible = false;
			this.addChild(ref1);
			
			ref2 = new Image(Assets.getTexture("Screen20Ref2"));
			ref2.x = 5;
			ref2.y = 1080;
		//	ref2.visible = false;
			this.addChild(ref2);
			
			ref3 = new Image(Assets.getTexture("Screen20Ref3"));
			ref3.x = 5;
			ref3.y = 1080;
		//	ref3.visible = false;
			this.addChild(ref3);
			
			ref4 = new Image(Assets.getTexture("Screen20Ref4"));
			ref4.x = 5;
			ref4.y = 1080;
		//	ref4.visible = false;
			this.addChild(ref4);
			
			hitscreen = new Button(Assets.getTexture("HitScreen"),"",Assets.getTexture("HitScreen"));
			hitscreen.y = 1080;
			this.addChild(hitscreen);
			
			hitscreen.width = 1920;
			hitscreen.height = 1080;
			
		//	AddOverlay();
			
		}
		
		private function AddOverlay():void	
		{
			var overlay:Overlay = new Overlay();
			overlay.touchable = false;
			overlay.name = "gridoverlay";
			this.addChild(overlay);
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
			
			sidenav.x = 1617;
			sidenav.y = 50;
			sidenav.gap = 2;
			
			return(sidenav);
			
		}
		
		private function SetUpBtn1b():void	
		{
			
			if(btn1b.hasEventListener(Event.ADDED_TO_STAGE) )
			{
				
				btn1b.removeEventListener(Event.ADDED_TO_STAGE, SetUpBtn1b);

			}
			
			with(btn1b)
			{
				visible = false;
				alpha = 0;
				width = 340;
				height = 352;
				x = 176;
				y = 507;
			};
			
			graphic1.StartingPositions();

		}

		private function SetUpBtn2b():void	
		{
			if(btn2b.hasEventListener(Event.ADDED_TO_STAGE) )
			{
				btn2b.removeEventListener(Event.ADDED_TO_STAGE, SetUpBtn2b);
			}
			
			with(btn2b)
			{
				visible = false;
				alpha = 0;
				width = 340;
				height = 352;
				x = 585;
				y = 507;
			};
			
			graphic2.StartingPositions();
			
		}
		
		private function SetUpBtn3b():void	
		{
			if(btn3b.hasEventListener(Event.ADDED_TO_STAGE) )
			{
				btn3b.removeEventListener(Event.ADDED_TO_STAGE, SetUpBtn3b);
			}
			
			with(btn3b)
			{
				visible = false;
				alpha = 0;
				width = 563;
				height = 328;
				x = 371;
				y = 450;
			};
			
			graphic3.StartingPositions();
			
		}
		
		private function SetUpBtn4b():void	
		{
			if(btn4b.hasEventListener(Event.ADDED_TO_STAGE) )
			{
				btn4b.removeEventListener(Event.ADDED_TO_STAGE, SetUpBtn4b);
			}
			
			with(btn4b)
			{
				visible = false;
				alpha = 0;
				width = 563;
				height = 328;
				x = 371;
				y = 450;
			};
			
			graphic4.StartingPositions();
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			
			Assets.globalReturnScreenID = "screen20";
			trace("ASSIGNING globalReturnScreenID: " + Assets.globalReturnScreenID);
			
			this.visible = true;
			
		//	togglePageButtons(-1);
			
			pagenav.visible = true;
			DeselectPageNav();
			
			sidenav.visible = true;
			DeselectSideNav();

			footer.visible = true;
			
			SetUpBtn1b();
			SetUpBtn2b();
			SetUpBtn3b();
			SetUpBtn4b();
			
			trace("btn1b.x : " + btn1b.x);
			
			// ref can move so reset it's alpha and position
			ref1.alpha = 0;
			ref1.x = 5;
			ref1.y = 1080;
		//	ref1.visible = false;
			
			ref2.alpha = 0;
			ref2.x = 5;
			ref2.y = 1080;
		//	ref2.visible = false;
			
			ref3.alpha = 0;
			ref3.x = 5;
			ref3.y = 1080;
		//	ref3.visible = false;
			
			ref4.alpha = 0;
			ref4.x = 5;
			ref4.y = 1080;
		//	ref4.visible = false;
			
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
			
	//		btn1b.addEventListener(Event.TRIGGERED, DeselectPageNav);
	//		btn2b.addEventListener(Event.TRIGGERED, DeselectPageNav);
	//		btn3b.addEventListener(Event.TRIGGERED, DeselectPageNav);
	//		btn4b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			
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
			//	ref1.visible = true;
			hitscreen.y = 0;
			TweenLite.to(ref1, 0.7, {alpha: 1, y: 548, onComplete: AddRefListener1});	
		}
		private function ToggleRef2(e:Event):void
		{
			//ref2.visible = true;
			hitscreen.y = 0;
			TweenLite.to(ref2, 0.7, {alpha: 1, y: 670, onComplete: AddRefListener2});	
		}
		private function ToggleRef3(e:Event):void
		{
			//ref3.visible = true;
			hitscreen.y = 0;
			TweenLite.to(ref3, 0.7, {alpha: 1, y: 618, onComplete: AddRefListener3});	
		}
		private function ToggleRef4(e:Event):void
		{
			//ref4.visible = true;
			hitscreen.y = 0;
			TweenLite.to(ref4, 0.7, {alpha: 1, y: 678, onComplete: AddRefListener4});	
		}
		private function AddRefListener1():void
		{
			hitscreen.addEventListener(Event.TRIGGERED, HideRef);
			
		}
		private function AddRefListener2():void
		{
			hitscreen.addEventListener(Event.TRIGGERED, HideRef);
			
		}
		private function AddRefListener3():void
		{
			
			hitscreen.addEventListener(Event.TRIGGERED, HideRef);
			
		}
		private function AddRefListener4():void
		{
			
			hitscreen.addEventListener(Event.TRIGGERED, HideRef);
			
		}
		
		private function DeselectPageNav():void
		{

			pagenav.selectedIndex = -1;
		//	togglePageButtons(-1);				

		}
		
		private function DeselectSideNav():void
		{
			sidenav.selectedIndex = -1;
		}
		

		private function togglePageButtons(i:int):void
		{
			
			btnRef1.visible = false;
			btnSend1.visible = false;
			
			btnRef2.visible = false;
			btnSend2.visible = false;
			
			btnRef3.visible = false;
			btnSend3.visible = false;
			
			btnRef4.visible = false;
			btnSend4.visible = false;
			
			if (btn1b.visible)
			{
				btn1b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
				TweenLite.to(btn1b, 0.5, { alpha:0, width:340, height:352, x:176, y:507, onComplete: function():void{ btn1b.visible = false; graphic1.juggler.purge(); graphic1.StartingPositions(); } } );	
				
			}
			
			if (btn2b.visible)
			{
				btn2b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
				TweenLite.to(btn2b, 0.5, { alpha:0, width:340, height:352, x:585, y:507, onComplete: function():void{ btn2b.visible = false; graphic2.juggler.purge(); graphic2.StartingPositions(); } } );	
			}
			
			if (btn3b.visible)
			{
				btn3b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
				TweenLite.to(btn3b, 0.5, { alpha:0, width:340, height:352, x:994, y:507, onComplete: function():void{ btn3b.visible = false; graphic3.juggler.purge(); graphic3.StartingPositions();  } } );	
			}
			
			if (btn4b.visible)
			{
				btn4b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
				TweenLite.to(btn4b, 0.5, { alpha:0, width:340, height:352, x:1403, y:507, onComplete: function():void{ btn4b.visible = false; graphic4.juggler.purge(); graphic4.StartingPositions();  } } );	
			}
			
			
			switch (i)
			{
				case -1:
				//	btn1b.visible = false;
				//	btn2b.visible = false;
				//	btn3b.visible = false;
				//	btn4b.visible = false;
					break;
				case 0:		
					btn1b.alpha = 0;
					btn1b.visible = true;
				//	TweenLite.to(btn1b, 0.5, { alpha:1, width:1920, height:1080, x:0, y:0, onComplete: function():void{ btnRef1.visible = true; btnSend1.visible = true; btn1b.addEventListener(Event.TRIGGERED, DeselectPageNav); } } ); // graphic1.Play(); } } );
					TweenLite.to(btn1b, 0.5, { alpha:1, width:1920, height:1080, x:0, y:0, onComplete: function():void{ btnRef1.visible = true; btnSend1.visible = true; btn1b.addEventListener(Event.TRIGGERED, DeselectPageNav); graphic1.Play(); } } );
					break;
				case 1:
					btn2b.alpha = 0;
					btn2b.visible = true;
				//	TweenLite.to(btn2b, 0.5, { alpha:1, scaleX:1, scaleY:1, x:0, y:0, onComplete: function():void{ btn2b.addEventListener(Event.TRIGGERED, DeselectPageNav); btnRef2.visible = true; btnSend2.visible = true; } } );
					TweenLite.to(btn2b, 0.5, { alpha:1, width:1920, height:1080, x:0, y:0, onComplete: function():void{ btnRef2.visible = true; btnSend2.visible = true; btn2b.addEventListener(Event.TRIGGERED, DeselectPageNav); graphic2.Play(); } } );
					break;
				case 2:
					btn3b.alpha = 0;
					btn3b.visible = true;
					TweenLite.to(btn3b, 0.5, { alpha:1, width:1920, height:1080, x:0, y:0, onComplete: function():void{ btnRef3.visible = true; btnSend3.visible = true; btn3b.addEventListener(Event.TRIGGERED, DeselectPageNav); graphic3.Play(); } } );
					break;
				case 3:
					btn4b.alpha = 0;
					btn4b.visible = true;
					TweenLite.to(btn4b, 0.5, { alpha:1, width:1920, height:1080, x:0, y:0, onComplete: function():void{ btnRef4.visible = true; btnSend4.visible = true; btn4b.addEventListener(Event.TRIGGERED, DeselectPageNav); graphic4.Play(); } } );
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
		//	togglePageButtons(-1);
			
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
			
			hitscreen.removeEventListener(Event.TRIGGERED, HideRef);
			hitscreen.y = 1080;
			TweenLite.to(ref1, 0.7, {alpha: 0, y: 1080, onComplete: DeselectSideNav});
			TweenLite.to(ref2, 0.7, {alpha: 0, y: 1080, onComplete: DeselectSideNav});
			TweenLite.to(ref3, 0.7, {alpha: 0, y: 1080, onComplete: DeselectSideNav});
			TweenLite.to(ref4, 0.7, {alpha: 0, y: 1080, onComplete: DeselectSideNav});

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