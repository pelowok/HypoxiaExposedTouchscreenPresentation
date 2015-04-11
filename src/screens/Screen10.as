package screens
{
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Screen10 extends Sprite
	{
		
		private var bg:Image;
		private var btn1a:Button;
		private var btn2a:Button;
		private var btn3a:Button;
		private var btn1b:Button;
		private var btn2b:Button;
		private var btn3b:Button;
		private var btnNext:Button;
		private var subnav1:Button;
		private var subnav2:Button;
		private var subnav3:Button;
		private var sidenav1a:Button;
		private var sidenav2a:Button;
		private var sidenav3a:Button;
		private var sidenav1b:Button;
		private var sidenav2b:Button;
		private var sidenav3b:Button;
		private var ref:Image;
		private var footer:Image;
		private var logo:Button;
		
		public function Screen10()
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
			
			btn1a = new Button(Assets.getTexture("Screen10Nav1a"));
			btn1a.x = 371;
			btn1a.y = 575;
			this.addChild(btn1a);
			
			btn2a = new Button(Assets.getTexture("Screen10Nav2a"));
			btn2a.x = 767;
			btn2a.y = 575;
			this.addChild(btn2a);
			
			btn3a = new Button(Assets.getTexture("Screen10Nav3a"));
			btn3a.x = 1163;
			btn3a.y = 575;
			this.addChild(btn3a);
			
			btn1b = new Button(Assets.getTexture("Screen10Nav1b"));
			btn1b.x = 371;
			btn1b.y = 435;
			btn1b.visible = false;
			this.addChild(btn1b);
			
			btn2b = new Button(Assets.getTexture("Screen10Nav2b"));
			btn2b.x = 767;
			btn2b.y = 435;
			btn2b.visible = false;
			this.addChild(btn2b);
			
			btn3b = new Button(Assets.getTexture("Screen10Nav3b"));
			btn3b.x = 1163;
			btn3b.y = 435;
			btn3b.visible = false;
			this.addChild(btn3b);
			
			logo = new Button(Assets.getTexture("HypoxiaExposedLogo"));
			logo.x = 50;
			logo.y = 10;
			logo.scaleX = 0.25;
			logo.scaleY = 0.25;
			this.addChild(logo);
			
			sidenav1a = new Button(Assets.getTexture("SideNav1a"));
			sidenav1a.x = 1500;
			sidenav1a.y = 15;
			this.addChild(sidenav1a);
			
			sidenav2a = new Button(Assets.getTexture("SideNav2a"));
			sidenav2a.x = 1615;
			sidenav2a.y = 15;
			this.addChild(sidenav2a);
			
			sidenav3a = new Button(Assets.getTexture("SideNav3a"));
			sidenav3a.x = 1730;
			sidenav3a.y = 15;
			this.addChild(sidenav3a);
			
			sidenav1b = new Button(Assets.getTexture("SideNav1b"));
			sidenav1b.x = 1500;
			sidenav1b.y = 15;
			sidenav1b.visible = false;
			this.addChild(sidenav1b);
			
			sidenav2b = new Button(Assets.getTexture("SideNav2b"));
			sidenav2b.x = 1615;
			sidenav2b.y = 15;
			sidenav2b.visible = false;
			this.addChild(sidenav2b);
			
			sidenav3b = new Button(Assets.getTexture("SideNav3b"));
			sidenav3b.x = 1730;
			sidenav3b.y = 15;
			sidenav3b.visible = false;
			this.addChild(sidenav3b);
			
			footer = new Image(Assets.getTexture("Footer"));
			footer.x = 0;
			footer.y = 979;
			this.addChild(footer);
			
			ref = new Image(Assets.getTexture("Screen10Ref"));
			ref.x = 0;
			ref.y = 1819;
			ref.visible = false;
			this.addChild(ref);
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;
			
			btn1a.visible = true;
			btn1b.visible = false;
			btn2a.visible = true;
			btn2b.visible = false;
			btn3a.visible = true;
			btn3b.visible = false;
			
			sidenav1a.visible = true;
			sidenav1b.visible = false;
			sidenav2a.visible = true;
			sidenav2b.visible = false;
			sidenav3a.visible = true;
			sidenav3b.visible = false;
			
			footer.visible = true;
			ref.visible = false;

			
			// Start listening to events
			this.addEventListener(Event.ENTER_FRAME, screenAnimation);
			
			logo.addEventListener(Event.TRIGGERED, onLogoTriggered);
			
			btn1a.addEventListener(Event.TRIGGERED, toggleBtn);
			btn1b.addEventListener(Event.TRIGGERED, toggleBtn);
			btn2a.addEventListener(Event.TRIGGERED, toggleBtn);
			btn2b.addEventListener(Event.TRIGGERED, toggleBtn);
			btn3a.addEventListener(Event.TRIGGERED, toggleBtn);
			btn3b.addEventListener(Event.TRIGGERED, toggleBtn);
			
			sidenav1a.addEventListener(Event.TRIGGERED, toggleSideNav);
			sidenav1b.addEventListener(Event.TRIGGERED, toggleSideNav);
			sidenav2a.addEventListener(Event.TRIGGERED, toggleSideNav);
			sidenav2b.addEventListener(Event.TRIGGERED, toggleSideNav);
			sidenav3a.addEventListener(Event.TRIGGERED, toggleSideNav);
			sidenav3b.addEventListener(Event.TRIGGERED, toggleSideNav);
			
			ref.addEventListener(Event.TRIGGERED, toggleRef);
			
			
			// Tween screen to visible
			TweenLite.to(this, 2, {alpha:1});
			
		}
		
		private function toggleRef(e:Event):void
		{
			
			ref.visible = !ref.visible;
				
		}
		
		private function toggleBtn(e:Event):void
		{
			
			switch (e.currentTarget)
			{
				case btn1a:
					btn1b.visible = !btn1b.visible;
					btn2b.visible = false;
					btn3b.visible = false;
				break;
				case btn1b:
					btn1b.visible = !btn1b.visible;
				break;
				case btn2a:
					btn2b.visible = !btn2b.visible;
					btn1b.visible = false;
					btn3b.visible = false;
				break;
				case btn2b:
					btn2b.visible = !btn2b.visible;
				break;
				case btn3a:
					btn3b.visible = !btn3b.visible;
					btn1b.visible = false;
					btn2b.visible = false;
				break;
				case btn3b:
					btn3b.visible = !btn3b.visible;
				break;
				default:
					trace(e.target);
				break;
		
			}
			
		}
		
		private function toggleSideNav(e:Event):void
		{
			
			switch (e.currentTarget)
			{
				case sidenav1a:
					sidenav1b.visible = !sidenav1b.visible;
					sidenav2b.visible = false;
					sidenav3b.visible = false;
					break;
				case sidenav1b:
					sidenav1b.visible = !sidenav1b.visible;
					break;
				case sidenav2a:
					sidenav2b.visible = !sidenav2b.visible;
					sidenav1b.visible = false;
					sidenav3b.visible = false;
					break;
				case sidenav2b:
					sidenav2b.visible = !sidenav2b.visible;
					break;
				case sidenav3a:
					sidenav3b.visible = !sidenav3b.visible;
					sidenav1b.visible = false;
					sidenav2b.visible = false;
					break;
				case sidenav3b:
					sidenav3b.visible = !sidenav3b.visible;
					break;
				default:
					trace(e.target);
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
		
		public function disposeTemporarily():void
		{
			TweenLite.to(this, 2, {alpha:0, onComplete:cleanUp});
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