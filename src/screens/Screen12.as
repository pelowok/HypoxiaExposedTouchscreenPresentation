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
	
	
	public class Screen12 extends Sprite
	{
		
		private var bg:Image;
//		private var mc:MovieClip;
//		private var iMC:int;
		
		private var chart:Image;
		private var whitebox:Image;
		
		private var btn1b:Button;
		private var btn2b:Button;
		
		private var btnNext:Button;
		private var btnPrev:Button;
		
		private var ref:Button;
		private var footer:Image;
		private var logo:Button;
		
		private var basenav:TabBar;
		private var pagenav:TabBar;
		private var sidenav:TabBar;
		
		public function Screen12()
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
			
			bg = new Image(Assets.getTexture("Screen12BG"));
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
		//	iMC = -1;
		//	temp();
			chart = new Image(Assets.getTexture("Screen12Chart"));
			chart.x = 345;
			chart.y = 350;
			this.addChild(chart);
			
			whitebox = new Image(Assets.getTexture("WhiteBox"));
			whitebox.x = 450;
			whitebox.y = 458;
			this.addChild(whitebox);
			
			this.addChild(AddBaseNav());
			
			this.addChild(AddPageNav());
			
			btnNext = new Button(Assets.getTexture("ReturnHome"),"",Assets.getTexture("ReturnHome"));
			btnNext.x = 1790;
			btnNext.y = 565;
			btnNext.visible = false;
			this.addChild(btnNext);
			
			btnPrev = new Button(Assets.getTexture("NavPrev"),"",Assets.getTexture("NavPrev"));
			btnPrev.x = 10;
			btnPrev.y = 565;
			btnPrev.visible = false;
			this.addChild(btnPrev);
			
			btn1b = new Button(Assets.getTexture("Screen12NavPop1"),"",Assets.getTexture("Screen12NavPop1"));
			btn1b.x = 1327;
			btn1b.y = 210;
			btn1b.visible = false;
			this.addChild(btn1b);
			
			btn2b = new Button(Assets.getTexture("Screen12NavPop2"),"",Assets.getTexture("Screen12NavPop2"));
			btn2b.x = 1327;
			btn2b.y = 480;
			btn2b.visible = false;
			this.addChild(btn2b);
			
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
			ref = new Button(Assets.getTexture("Screen12Ref"),"",Assets.getTexture("Screen12Ref"));
			ref.x = 0;
			ref.y = 1040;
			ref.visible = false;
			this.addChild(ref);
			
		//	AddOverlay();
			
		}
		
		private function AddOverlay():void	
		{
			var overlay:Overlay = new Overlay();
			overlay.touchable = false;
			overlay.name = "gridoverlay";
			this.addChild(overlay);
		}
		
		private function AddBaseNav():TabBar{
			
			basenav = new TabBar();
			
			basenav.dataProvider = new ListCollection(
				[
					{ 	label:"",
						defaultIcon: new Image( Assets.getTexture("SubNava") ),
						hoverIcon: new Image( Assets.getTexture("SubNavb") ),
						downIcon: new Image( Assets.getTexture("SubNavb") ),
						defaultSelectedIcon: new Image( Assets.getTexture("SubNavb") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("SubNava") ),
						hoverIcon: new Image( Assets.getTexture("SubNavb") ),
						downIcon: new Image( Assets.getTexture("SubNavb") ),
						defaultSelectedIcon: new Image( Assets.getTexture("SubNavb") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("SubNava") ),
						hoverIcon: new Image( Assets.getTexture("SubNavb") ),
						downIcon: new Image( Assets.getTexture("SubNavb") ),
						defaultSelectedIcon: new Image( Assets.getTexture("SubNavb") )
					},
				]);
			
			basenav.x = 880;
			basenav.y = 895;
			basenav.gap = 35;
			
			return(basenav);
			
		}
		
		private function AddPageNav():TabBar{
			
			pagenav = new TabBar();
			pagenav.direction = TabBar.DIRECTION_VERTICAL;
			
			pagenav.dataProvider = new ListCollection(
				[
					{ 	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen12InnerNav1") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen12InnerNav2") )
					},
				]);
			
			pagenav.x = 1440;
			pagenav.y = 340;
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
						defaultIcon: new Image( Assets.getTexture("SideNav2a") ),
						hoverIcon: new Image( Assets.getTexture("SideNav2b") ),
						downIcon: new Image( Assets.getTexture("SideNav2b") ),
						defaultSelectedIcon: new Image( Assets.getTexture("SideNav2b") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("SideNav3a") ),
						hoverIcon: new Image( Assets.getTexture("SideNav3b") ),
						downIcon: new Image( Assets.getTexture("SideNav3b") ),
						defaultSelectedIcon: new Image( Assets.getTexture("SideNav3b") )
					},
				]);
			
			sidenav.x = 1505;
			sidenav.y = 50;
			sidenav.gap = 2;
			
			return(sidenav);
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			Assets.globalReturnScreenID = "screen12";
			trace("ASSIGNING globalReturnScreenID: " + Assets.globalReturnScreenID);
			
			this.visible = true;
			
			chart.visible = true;
			whitebox.height = 270;
			whitebox.alpha = 1;
			whitebox.visible = true;
			
			togglePageButtons(-1);
			
			pagenav.visible = true;
			DeselectPageNav();
			
			with (btn1b)
			{
				visible = false;
				alpha = 0;
				width = 341;
				height = 328;
			//	x = 1440;
			//	y = 340;
				x = 1400;
				y = 310;
			};
			
			with (btn2b)
			{
				visible = false;
				alpha = 0;
				width = 341;
				height = 328;
			//	x = 1440;
			//	y = 524;
				x = 1400;
				y = 584;
			};
			
			sidenav.visible = true;
			DeselectSideNav();
			
			basenav.visible = true;
			basenav.selectedIndex = 2;
			
			btn1b.visible = false;
			btn2b.visible = false;
			
			btnNext.visible = true;
			btnPrev.visible = true;
			
			footer.visible = true;
			
			// ref can move so reset it's alpha and position
			ref.alpha = 0;
			ref.x = 5;
			ref.y = 1080;
			ref.visible = false;
			
			// Start listening to events
			this.addEventListener(Event.ENTER_FRAME, screenAnimation);
			
			logo.addEventListener(Event.TRIGGERED, onLogoTriggered);
			
		//	btn1b.addEventListener(Event.TRIGGERED, DeselectPageNav);
		//	btn2b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			
			basenav.addEventListener(Event.CHANGE, toggleBaseNav);
			pagenav.addEventListener(Event.CHANGE, togglePageNav);
			sidenav.addEventListener(Event.CHANGE, toggleSideNav);	
			
			btnPrev.addEventListener(Event.TRIGGERED, CallScreen11);
			btnNext.addEventListener(Event.TRIGGERED, CallMainScreen);
			
			// Tween screen to visible
			TweenLite.to(this, 0.5, {alpha:1});
			
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
			
			if (btn1b.visible)
			{
				
				btn1b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
				TweenLite.to(btn1b, 0.5, { alpha:0, width:341, height:328, x:1400, y:310, onComplete: function():void{ btn1b.visible = false; } } );
				
			}
			
			if (btn2b.visible)
			{
				
				btn2b.removeEventListener(Event.TRIGGERED, DeselectPageNav);
				TweenLite.to(btn2b, 0.5, { alpha:0, width:341, height:328, x:1400, y:584, onComplete: function():void{ btn2b.visible = false; } } );
				
			}
			
			switch (i)
			{
				case -1:
				//	btn1b.visible = false;
				//	btn2b.visible = false;
					break;
				case 0:
					btn1b.alpha = 0;
					btn1b.visible = !btn1b.visible;
					TweenLite.to(btn1b, 0.5, { alpha:1, scaleX:1, scaleY:1, x:1327, y:210, onComplete: function():void{ btn1b.addEventListener(Event.TRIGGERED, DeselectPageNav); } } );
					break;
				case 1:
					btn2b.alpha = 0;
					btn2b.visible = !btn2b.visible;
					TweenLite.to(btn2b, 0.5, { alpha:1, scaleX:1, scaleY:1, x:1327, y:480, onComplete: function():void{ btn2b.addEventListener(Event.TRIGGERED, DeselectPageNav); } } );
					break;;
				default:
					trace("ERROR THROWN: tabs.selectedIndex passed to togglePageButtons was :" + i);
					break;
				
			}
			
		}
		
		private function toggleBaseNav(e:Event):void
		{
			
			var tabs:TabBar = TabBar( e.currentTarget );
			trace( "  -->selectedIndex:", tabs.selectedIndex );
			switch (tabs.selectedIndex)
			{
				case 0:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen10"}));
					break;
				case 1:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen11"}));
					break;
				case 2:
					// do nothing, we're already here
					break;
				default:
					trace("ERROR THROWN: tabs.selectedIndex in toggleSideNav was :" + tabs.selectedIndex);
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
					
					ref.visible = true;
					TweenLite.to(ref, 0.7, {alpha: 1, y: 0, onComplete: AddRefListener});
					
					break;
				case 2:
					
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screenregister"}));
					
					break;
				default:
					trace("ERROR THROWN: tabs.selectedIndex in toggleSideNav was :" + tabs.selectedIndex);
					break;
			}
			
		}
		
		private function AddRefListener():void{
			ref.addEventListener(Event.TRIGGERED, HideRef);
		}
		
		private function HideRef(e:Event):void
		{
			
			ref.removeEventListener(Event.TRIGGERED, HideRef);
			TweenLite.to(ref, 0.7, {alpha: 0, y: 1080, onComplete: DeselectSideNav});
			
		}
		
		private function onLogoTriggered():void
		{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "homescreen"}));
			
		}
		
		private function screenAnimation(e:Event):void
		{
			
			// Start animations
			
			if(whitebox.height > 0)
			{
				whitebox.height -=3;
			} else {
				whitebox.height = 0;
				whitebox.visible = false;
				this.removeEventListener(Event.ENTER_FRAME, screenAnimation);
			}
			
			
		//	var currentDate:Date = new Date();
		//	var speed:Number = 0.0006;
		//	var n:Number = 0.7 + (Math.cos(currentDate.getTime() * speed) * 0.3);
			
		//	logo.alpha = (n * -1) + 1.4;			
			
		}
		
		private function CallScreen11(e:Event):void{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen11"}));
			
		}
		
		private function CallMainScreen(e:Event):void{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "mainmenuscreen"}));
			
		}
		
		public function disposeTemporarily():void
		{
			TweenLite.to(this, 0.5, {alpha:0, onComplete:cleanUp});
		}
		
		private function cleanUp():void
		{
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
			
		}
	/*	
		private function temp():void
		{
			
			iMC += 1;
			
			// create atlas
			var texture:Texture = Texture.fromEmbeddedAsset(Assets["BGPersist" + iMC + "_png"]);
			var xml:XML = XML( new Assets["BGPersist" + iMC + "_xml"]() );
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			// create movie clip if it isn't already instantiated
			if(mc){
				
				
				
			} else {
				
				mc = new MovieClip(atlas.getTextures("bgPresist"), 6);
				mc.loop = false; // default: true
				
			}
			
			mc.addEventListener(Event.COMPLETE, movieCompletedHandler);
			
			this.addChild(mc);
			mc.x = 300;
			mc.y = 300;
			
			// control playback
			mc.stop();
			
			// important: add movie to juggler
			Starling.juggler.add(mc);
			
		}
		
		private function movieCompletedHandler(e:Event):void
		{
			
			mc.removeEventListener(Event.COMPLETE, movieCompletedHandler);
			
			if(iMC <= 3)
			{
				mc.texture.dispose();
				
				temp();
				
			} else {
				
				mc.stop();
				Starling.juggler.remove(mc);
				
			}

		}
	*/
	}
}