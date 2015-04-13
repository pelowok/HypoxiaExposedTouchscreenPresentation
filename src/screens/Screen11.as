package screens
{
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;
	
	import mynameiszak.VideoOverlay;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	
	public class Screen11 extends Sprite
	{
		
		private var bg:Image;
		
		private var btn1b:Button;
		private var btn2b:Button;
		private var btnPlay:Button;
		private var btnVideo:Button;
		
		private var btnNext:Button;
		private var btnPrev:Button;
		
		private var ref:Button;
		private var footer:Image;
		private var logo:Button;
		
		private var basenav:TabBar;
		private var pagenav:TabBar;
		private var sidenav:TabBar;
		
		public function Screen11()
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
			
			bg = new Image(Assets.getTexture("Screen11BG"));
			bg.x = 0;
			bg.y = 100;
			this.addChild(bg);
			
			this.addChild(AddBaseNav());
			
			this.addChild(AddPageNav());
			
			btn1b = new Button(Assets.getTexture("Screen11NavPop1"),"",Assets.getTexture("Screen11NavPop1"));
			btn1b.x = 304;
			btn1b.y = 140;
			btn1b.visible = false;
			this.addChild(btn1b);
			
			btn2b = new Button(Assets.getTexture("Screen11NavPop2"),"",Assets.getTexture("Screen11NavPop2"));
			btn2b.x = 304;
			btn2b.y = 140;
			btn2b.visible = false;
			this.addChild(btn2b);
			
			btnPlay = new Button(Assets.getTexture("Screen11PlayVideo"),"",Assets.getTexture("Screen11PlayVideo"));
			btnPlay.x = 880;
			btnPlay.y = 207;
			btnPlay.visible = false;
			this.addChild(btnPlay);
			
			btnVideo = new Button(Assets.getTexture("Screen11VideoImg"),"",Assets.getTexture("Screen11VideoImg"));
			btnVideo.x = 304;
			btnVideo.y = 105;
			btnVideo.visible = false;
			this.addChild(btnVideo);
			
			btnNext = new Button(Assets.getTexture("NavNext"),"",Assets.getTexture("NavNext"));
			btnNext.x = 1740;
			btnNext.y = 610;
			btnNext.visible = false;
			this.addChild(btnNext);
			
			btnPrev = new Button(Assets.getTexture("NavPrev"),"",Assets.getTexture("NavPrev"));
			btnPrev.x = 10;
			btnPrev.y = 610;
			btnPrev.visible = false;
			this.addChild(btnPrev);
			
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
			ref = new Button(Assets.getTexture("Screen11Ref"),"",Assets.getTexture("Screen11Ref"));
			ref.x = 5;
			ref.y = 1080;
			ref.visible = false;
			this.addChild(ref);
			
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
			
			basenav.x = 900;
			basenav.y = 855;
			basenav.gap = 35;
			
			return(basenav);
			
		}
		
		private function AddPageNav():TabBar{
			
			pagenav = new TabBar();
			
			pagenav.dataProvider = new ListCollection(
				[
					{ 	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen11InnerNav1") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen11InnerNav2") )
					},
				]);
			
			pagenav.x = 371;
			pagenav.y = 450;
			pagenav.gap = 20;
			
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
			
			sidenav.x = 1500;
			sidenav.y = 10;
			sidenav.gap = 2;
			
			return(sidenav);
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			
			Assets.globalReturnScreenID = "screen11";
			trace("ASSIGNING globalReturnScreenID: " + Assets.globalReturnScreenID);
			
			this.visible = true;
			
			togglePageButtons(-1);
			
			pagenav.visible = true;
			DeselectPageNav();
			
			sidenav.visible = true;
			DeselectSideNav();
			
			basenav.visible = true;
			basenav.selectedIndex = 1;
			
			btn1b.visible = false;
			btn2b.visible = false;
			
			btnPlay.visible = false;
			btnVideo.visible = false;
			
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
			
			btn1b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			btn2b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			
			basenav.addEventListener(Event.CHANGE, toggleBaseNav);
			pagenav.addEventListener(Event.CHANGE, togglePageNav);
			sidenav.addEventListener(Event.CHANGE, toggleSideNav);	
			
			btnPrev.addEventListener(Event.TRIGGERED, CallScreen10);
			btnNext.addEventListener(Event.TRIGGERED, CallScreen12);
			
			// Tween screen to visible
			TweenLite.to(this, 0.5, {alpha:1});
			
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
			
			if(btnPlay.hasEventListener(Event.TRIGGERED))
				{
					
					btnPlay.removeEventListener(Event.TRIGGERED, AddVideo1);
					btnPlay.removeEventListener(Event.TRIGGERED, AddVideo2);
					
				}
				
			switch (i)
			{
				case -1:
					btn1b.visible = false;
					btn2b.visible = false;
					btnPlay.visible = false;
					break;
				case 0:
					btn1b.visible = true;
					btnPlay.visible = true;
					btnPlay.addEventListener(Event.TRIGGERED, AddVideo1);
					break;
				case 1:
					btn2b.visible = true;
					btnPlay.visible = true;
					btnPlay.addEventListener(Event.TRIGGERED, AddVideo2);
					break;
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
					// do nothing, we're already here
					break;
				case 2:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen12"}));
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
			var currentDate:Date = new Date();
			var speed:Number = 0.0006;
			var n:Number = 0.7 + (Math.cos(currentDate.getTime() * speed) * 0.3);
			
			logo.alpha = (n * -1) + 1.4;			
			
		}
		
		private function CallScreen10(e:Event):void{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen10"}));
			
		}
		
		private function CallScreen12(e:Event):void{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen12"}));
			
		}
		
		private function AddVideo1(e:Event):void
		{
			
			DeselectPageNav();
			
			btn1b.visible = false;
			btnPlay.visible = false;
			btnPlay.removeEventListener(Event.TRIGGERED, AddVideo1);
			
			btnVideo.visible = true;
			btnVideo.addEventListener(Event.TRIGGERED, RemoveVideo1);
			
			var video:VideoOverlay = new VideoOverlay();
			video.x = 150;
			video.y = 150;
			video.alpha = 0.75;
			
			Starling.current.nativeOverlay.addChild(video);
			
		//	HypoxiaExposedTouchscreenPresentation.DisplayVideo(video);
			
		}
		
		private function AddVideo2(e:Event):void
		{
			
			DeselectPageNav();
			
			btn2b.visible = false;
			btnPlay.visible = false;
			btnPlay.removeEventListener(Event.TRIGGERED, AddVideo2);
			
			btnVideo.visible = true;
			btnVideo.addEventListener(Event.TRIGGERED, RemoveVideo2);
			
		}
		
		private function RemoveVideo1(e:Event):void
		{
			
			DeselectPageNav();
			
			btnVideo.visible = false;
			btnVideo.removeEventListener(Event.TRIGGERED, RemoveVideo1);
			
		}
		
		private function RemoveVideo2(e:Event):void
		{
			
			DeselectPageNav();
			
			btnVideo.visible = false;
			btnVideo.removeEventListener(Event.TRIGGERED, RemoveVideo2);
			
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
			
			if(btnVideo.hasEventListener(Event.TRIGGERED))
			{
				
				btnVideo.removeEventListener(Event.TRIGGERED, RemoveVideo1);
				btnVideo.removeEventListener(Event.TRIGGERED, RemoveVideo2);
				
			}
			
			if(btnPlay.hasEventListener(Event.TRIGGERED))
			{
				
				btnPlay.removeEventListener(Event.TRIGGERED, AddVideo1);
				btnPlay.removeEventListener(Event.TRIGGERED, AddVideo2);
				
			}
		}
	}
}