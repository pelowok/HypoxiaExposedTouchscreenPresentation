package screens
{
	
	import com.greensock.TweenLite;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.BlurFilter;
		
	public class MainMenu extends Sprite
	{
		
		private var bg:Image;
		private var footer:Image;
		private var btn1:Button;
		private var btn2:Button;
		private var logo:Image;
		
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
			bg = new Image(Assets.getTexture("MainBG"));
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			footer = new Image(Assets.getTexture("Footer"));
			footer.x = 0;
			footer.y = 979;
			this.addChild(footer);
			
			btn1 = new Button(Assets.getTexture("MainButton01a"),"",Assets.getTexture("MainButton01b"));
			btn1.x = 400;
			btn1.y = 400;
			this.addChild(btn1);
			
			btn2 = new Button(Assets.getTexture("MainButton02a"),"",Assets.getTexture("MainButton02b"));
			btn2.x = 800;
			btn2.y = 400;
			this.addChild(btn2);
			
			logo = new Image(Assets.getTexture("HypoxiaExposedLogo"));
			logo.x = 50;
			logo.y = 50;
			logo.scaleX = 0.5;
			logo.scaleY = 0.5;
			this.addChild(logo);
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;
			// Tween in the screen
			TweenLite.to(this, 4, {alpha:1});
			
			// Reset objects to initial positions
			bg.x = 0;
			bg.y = 0;
			footer.x = 0;
			footer.y = 979;
			btn1.x = 400;
			btn1.y = 400;
			btn2.x = 800;
			btn2.y = 400;
			logo.x = 200;
			logo.y = 300;
			
			// Start listening to events
			this.addEventListener(Event.ENTER_FRAME, mainAnimation);
			
		}
		
		private function mainAnimation(e:Event):void
		{
			
			// Start animations			
			var currentDate:Date = new Date();
			var speed:Number = 0.0006;
			
			bg.alpha = 0.7 + (Math.cos(currentDate.getTime() * speed) * 0.3);
			logo.alpha = (bg.alpha * -1) + 1.4;			
			
			var derivedAlpha:Number = (1 - bg.alpha);
			
			var blur1:BlurFilter = new BlurFilter(derivedAlpha * 8, derivedAlpha * 8, 1);
			bg.filter = blur1;
			
			// var delta:Number = (bg.alpha - 0.4) * 2;
			var delta: Number = 0.7 + (Math.cos(currentDate.getTime() * (speed * 4)) * 0.3);
			var blur2:BlurFilter = new BlurFilter(delta, delta, 1);
			
			btn1.filter = blur2;
			btn2.filter = blur2;
			
			
		}
		
		public function disposeTemporarily():void
		{
			
			this.visible = false;
			
			// Delete the unneeded objects and listeners
			
		}
		
	}
}