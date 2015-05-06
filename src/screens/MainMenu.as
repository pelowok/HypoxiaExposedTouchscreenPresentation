package screens
{
	
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import starling.core.Starling;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
		
	public class MainMenu extends Sprite
	{
		
		private var btn1:Button;	
		private var btn2:Button;
		private var logo:Button;
		
		public function MainMenu()
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
			
			btn1 = new Button(Assets.getTexture("MainButton01a"));
			btn1.x = 460;
			btn1.y = 280;
			btn1.scaleWhenDown = 0.98;
			this.addChild(btn1);
			
			btn2 = new Button(Assets.getTexture("MainButton02a"));
			btn2.x = 1010;
			btn2.y = 280;
			btn2.scaleWhenDown = 0.98;
			this.addChild(btn2);
			
			logo = new Button(Assets.getTexture("HypoxiaExposedLogo"),"",Assets.getTexture("HypoxiaExposedLogoGlow"));
			logo.x = 75;
			logo.y = 75;
			logo.scaleX = 0.4;
			logo.scaleY = 0.4;
			this.addChild(logo);

		//	AddOverlay();
			
		}
		
		private function AddOverlay():void	
		{
			var overlay:Overlay = new Overlay();
			overlay.touchable = false;
			overlay.name = "gridoverlay";
			this.addChild(overlay);
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;
			
			// Start listening to events
			logo.addEventListener(Event.TRIGGERED, onLogoTriggered);
			btn1.addEventListener(Event.TRIGGERED, onBtn1Triggered);
			btn2.addEventListener(Event.TRIGGERED, onBtn2Triggered);
			
			// Tween screen to visible
			TweenLite.to(this, 0.5, {alpha:1});
			
		}
		
		private function onLogoTriggered():void
		{
			
		//	AnimateButton1(logo);
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "homescreen"}));
			
		}
		
		private function onBtn1Triggered():void
		{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen10"}));
			
		}

		private function onBtn2Triggered():void
		{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "screen20"}));
			
		}
		
		private function AnimateButton1(btn:Button):void
		{
			var hex:uint = btn.color;
			var tween:Tween = new Tween(btn, 0.15, Transitions.EASE_IN);
			tween.animate("color", 0xFFFFFF);
			tween.animate("alpha", 0.7);
			tween.onComplete = function():void{  AnimateButton2(btn, hex); trace("AnimateButton1 FINISHED"); };
			
			Starling.juggler.add(tween);
		}
		
		private function AnimateButton2(btn:Button, hex:uint):void
		{
			var tween:Tween = new Tween(logo, 0.15, Transitions.EASE_IN);
			tween.animate("color", hex);
			tween.animate("alpha", 1);
			tween.onComplete = function():void{ trace("AnimateButton2 FINISHED"); };

			Starling.juggler.add(tween);
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
			
			if(btn1.hasEventListener(Event.TRIGGERED))
			{
				
				btn1.removeEventListener(Event.TRIGGERED, onBtn1Triggered);

			}
			
			if(btn2.hasEventListener(Event.TRIGGERED))
			{
				
				btn2.removeEventListener(Event.TRIGGERED, onBtn2Triggered);
				
			}
		}
		
	}
}