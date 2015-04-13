package screens
{
	
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.BlurFilter;
	
	public class Home extends Sprite
	{

		private var title1:Button;
		private var title2:Button;
		private var logo:Button;
		private var hitscreen:Button;
		
		public function Home()
		{
			super();
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void
		{
			
			trace(e.target + " added to stage.");
			drawScreen();
			
		}
		
		private function drawScreen():void 
		{
			
			// For each object in drawScreen,
			// position value should be the same
			// in drawScreen() and initialize()
			
			title1 = new Button(Assets.getTexture("SeeWhatsLurking"));
			title1.x = 800;
			title1.y = 400;
			this.addChild(title1);
			
			title2 = new Button(Assets.getTexture("TapToBegin"));
			title2.x = 800;
			title2.y = 600;
			this.addChild(title2);
			
			logo = new Button(Assets.getTexture("HypoxiaExposedLogo"));
			logo.x = 200;
			logo.y = 300;
			this.addChild(logo);
			
			hitscreen = new Button(Assets.getTexture("HitScreen"));
			this.addChild(hitscreen);
			
			// This class extends starling.Sprite, and is the parent to 
			//    title2 starling.Button class instance. Button TRIGGERED events
			//    can be listened for by Sprites (altthough they can not trigger
			//    them), and the event can bubble.
			this.addEventListener(Event.TRIGGERED, onHomeScreenClick);
			
		}
		
		private function onHomeScreenClick(e:Event):void
		{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "mainmenuscreen"}));
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;
			
			// Start listening to events
			this.addEventListener(Event.ENTER_FRAME, homeAnimation);
			
			// Tween screen to visible
			TweenLite.to(this, 0.5, {alpha:1});
			
		}
		
		private function homeAnimation(e:Event):void
		{
			
			// Start animations			
			var currentDate:Date = new Date();
			var speed:Number = 0.0006;
			
			var n:Number = 0.7 + (Math.cos(currentDate.getTime() * speed) * 0.3);
			title1.alpha = (n * -1) + 1.4;
			logo.alpha = (n * -1) + 1.4;			
			
			var derivedAlpha:Number = (1 - n);
			
			// var delta:Number = (bg.alpha - 0.4) * 2;
			var delta: Number = 0.7 + (Math.cos(currentDate.getTime() * (speed * 4)) * 0.3);
			var blur2:BlurFilter = new BlurFilter(delta, delta, 1);
			
			title2.filter = blur2;
	
		}
		
		public function disposeTemporarily():void
		{
			TweenLite.to(this, 0.5, {alpha:0, onComplete:cleanUp});
		}
		
		private function cleanUp():void
		{
			this.visible = false;
			
			// Remove unneeded objects and listeners
			if(this.hasEventListener(Event.ENTER_FRAME)){
				this.removeEventListener(Event.ENTER_FRAME, homeAnimation);
			}
		}
		
		
	}
}