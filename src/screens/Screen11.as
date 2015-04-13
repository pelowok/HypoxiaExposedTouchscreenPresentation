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
	
	
	public class Screen11 extends Sprite
	{
		
		private var bg:Image;
		
		private var btn1b:Button;
		private var btn2b:Button;
		private var btn3b:Button;
		
		private var btnNext:Button;
		
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
			
			bg = new Image(Assets.getTexture("Screen10BG"));
			bg.x = 0;
			bg.y = 100;
			this.addChild(bg);
			
			this.addChild(AddBaseNav());
			
			this.addChild(AddPageNav());
			
			btn1b = new Button(Assets.getTexture("Screen10Nav1b"),"",Assets.getTexture("Screen10Nav1b"));
			btn1b.x = 371;
			btn1b.y = 435;
			btn1b.visible = false;
			this.addChild(btn1b);
			
			btn2b = new Button(Assets.getTexture("Screen10Nav2b"),"",Assets.getTexture("Screen10Nav2b"));
			btn2b.x = 767;
			btn2b.y = 435;
			btn2b.visible = false;
			this.addChild(btn2b);
			
			btn3b = new Button(Assets.getTexture("Screen10Nav3b"),"",Assets.getTexture("Screen10Nav3b"));
			btn3b.x = 1163;
			btn3b.y = 435;
			btn3b.visible = false;
			this.addChild(btn3b);
			
			btnNext = new Button(Assets.getTexture("NavNext"),"",Assets.getTexture("NavNext"));
			btnNext.x = 1800;
			btnNext.y = 610;
			btnNext.visible = false;
			this.addChild(btnNext);
			
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
			ref = new Button(Assets.getTexture("Screen10Ref"),"",Assets.getTexture("Screen10Ref"));
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
						defaultIcon: new Image( Assets.getTexture("Screen10Nav1a") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen10Nav2a") )
					},
					{	label:"",
						defaultIcon: new Image( Assets.getTexture("Screen10Nav3a") )
					},
				]);
			
			pagenav.x = 371;
			pagenav.y = 575;
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
			
			sidenav.x = 1500;
			sidenav.y = 10;
			sidenav.gap = 2;
			
			return(sidenav);
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;
			
			togglePageButtons(-1);
			
			pagenav.visible = true;
			DeselectPageNav();
			
			sidenav.visible = true;
			DeselectSideNav();
			
			basenav.visible = true;
			basenav.selectedIndex = 0;
			
			btnNext.visible = true;
			
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
			btn3b.addEventListener(Event.TRIGGERED, DeselectPageNav);
			
			basenav.addEventListener(Event.CHANGE, toggleBaseNav);
			pagenav.addEventListener(Event.CHANGE, togglePageNav);
			sidenav.addEventListener(Event.CHANGE, toggleSideNav);	
			
			btnNext.addEventListener(Event.TRIGGERED, CallScreen21);
			
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
			
			switch (i)
			{
				case -1:
					btn1b.visible = false;
					btn2b.visible = false;
					btn3b.visible = false;
					break;
				case 0:
					btn1b.visible = !btn1b.visible;
					break;
				case 1:
					btn2b.visible = !btn2b.visible;
					break;
				case 2:
					btn3b.visible = !btn3b.visible;
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
					// do nothing, we're already here
					break;
				case 1:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen11"}));
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
		
		private function CallScreen21(e:Event):void{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen20"}));
			
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
	}
}