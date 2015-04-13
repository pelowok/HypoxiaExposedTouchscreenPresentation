package screens
{
	
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
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
			
			btn1 = new Button(Assets.getTexture("MainButton01a"),"",Assets.getTexture("MainButton01a"));
			btn1.x = 400;
			btn1.y = 400;
			this.addChild(btn1);
			
			btn2 = new Button(Assets.getTexture("MainButton02a"),"",Assets.getTexture("MainButton02a"));
			btn2.x = 800;
			btn2.y = 400;
			this.addChild(btn2);
			
			logo = new Button(Assets.getTexture("HypoxiaExposedLogo"));
			logo.x = 50;
			logo.y = 10;
			logo.scaleX = 0.5;
			logo.scaleY = 0.5;
			this.addChild(logo);
			
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
		}
		
	}
}