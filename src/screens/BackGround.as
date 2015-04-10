package screens
{
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class BackGround extends Sprite
	{
		
		private var bg:Button;
		private var footer:Button;
		
		public function BackGround()
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
			bg = new Button(Assets.getTexture("MainBG"),"",Assets.getTexture("MainBG"));
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			footer = new Button(Assets.getTexture("Footer"),"",Assets.getTexture("Footer"));
			footer.x = 0;
			footer.y = 979;
			this.addChild(footer);
			
			// This class extends starling.Sprite, and is the parent to 
			//    title2 starling.Button class instance. Button TRIGGERED events
			//    can be listened for by Sprites (altthough they can not trigger
			//    them), and the event can bubble.
			this.addEventListener(Event.TRIGGERED, onScreenClick);
			
		}
		
		private function onScreenClick(e:Event):void
		{
			
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,true,{id: "mainmenuscreen"}));
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;
			
			// Start listening to events
			this.addEventListener(Event.ENTER_FRAME, bgAnimation);
			
			// Tween screen to visible
			TweenLite.to(this, 2, {alpha:1});
			
		}
		
		private function bgAnimation(e:Event):void
		{
			
			// Start animations			
			var currentDate:Date = new Date();
			var speed:Number = 0.0006;
			
			bg.alpha = 0.7 + (Math.cos(currentDate.getTime() * speed) * 0.3);
	
		}
		
		public function disposeTemporarily():void
		{
			TweenLite.to(this, 4, {alpha:0, onComplete:cleanUp});
		}
		
		private function cleanUp():void
		{
			this.visible = false;
			
			// Remove unneeded objects and listeners
			if(this.hasEventListener(Event.ENTER_FRAME)){
				this.removeEventListener(Event.ENTER_FRAME, bgAnimation);
			}
		}
		
		
	}
}