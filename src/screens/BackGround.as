package screens
{
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.KeyboardEvent;
	
	import flash.desktop.NativeApplication;
	
	public class BackGround extends Sprite
	{
		
		private var bg:Image;
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
		
			bg = new Image(Assets.getTexture("MainBG"));
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			footer = new Button(Assets.getTexture("Footer"),"",Assets.getTexture("Footer"));
			footer.x = 0;
			footer.y = 979;
			this.addChild(footer);
		
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;
			
			// Start listening to events
			this.addEventListener(Event.ENTER_FRAME, bgAnimation);
			
			this.addEventListener(KeyboardEvent.KEY_DOWN, ShutDown);
			
			// Tween screen to visible
			TweenLite.to(this, 0.5, {alpha:1});
			
		}
		
		private function ShutDown(e:KeyboardEvent):void
		{
			
			if(e.charCode == 113)
			{
				NativeApplication.nativeApplication.exit();
			}
			
		}
		
		private function bgAnimation(e:Event):void
		{
			
			// Start animations			
			var currentDate:Date = new Date();
			var speed:Number = 0.0006;
			
			bg.alpha = 0.7 + (Math.cos(currentDate.getTime() * speed) * 0.3);
	
		}	
		
	}
}