package screens
{
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.BlurFilter;
	import starling.filters.ColorMatrixFilter;
	
	public class Home extends Sprite
	{
		
		private var bg:Image;
		private var footer:Image;
		private var title1:Image;
		private var title2:Button;
		private var logo:Image;
		
		public function Home()
		{
			super();
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onHomeAddedToStage);
			
		}
		
		private function onHomeAddedToStage(e:Event):void
		{
			
			trace(e.target + " added to stage.");
			drawScreen();
			
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
			
			footer = new Image(Assets.getTexture("Footer"));
			footer.x = 0;
			footer.y = 979;
			this.addChild(footer);
			
			title1 = new Image(Assets.getTexture("SeeWhatsLurking"));
			title1.x = 800;
			title1.y = 400;
			this.addChild(title1);
			
			title2 = new Button(Assets.getTexture("TapToBegin"));
			title2.x = 800;
			title2.y = 600;
			this.addChild(title2);
			
			logo = new Image(Assets.getTexture("HypoxiaExposedLogo"));
			logo.x = 200;
			logo.y = 300;
			this.addChild(logo);
			
		}
		
		public function initialize():void{
			
			// Call this function each time a Screen is made active.
			
			this.visible = true;
			
			// Reset objects to initial positions
			bg.x = 0;
			bg.y = 0;
			footer.x = 0;
			footer.y = 979;
			title1.x = 800;
			title1.y = 400;
			title2.x = 800;
			title2.y = 600;
			logo.x = 200;
			logo.y = 300;
			
			// Start listening to events
			this.addEventListener(Event.ENTER_FRAME, homeAnimation);
			
		}
		
		private function homeAnimation(e:Event):void
		{
			
			// Start animations			
			var currentDate:Date = new Date();
			var speed:Number = 0.0006;
			
			bg.alpha = 0.7 + (Math.cos(currentDate.getTime() * speed) * 0.3);
			title1.alpha = (bg.alpha * -1) + 1.4;
			logo.alpha = (bg.alpha * -1) + 1.4;			
			
			var derivedAlpha:Number = (1 - bg.alpha);
			
			var blur1:BlurFilter = new BlurFilter(derivedAlpha * 8, derivedAlpha * 8, 1);
			bg.filter = blur1;
			
			// var delta:Number = (bg.alpha - 0.4) * 2;
			var delta: Number = 0.7 + (Math.cos(currentDate.getTime() * (speed * 4)) * 0.3);
			var blur2:BlurFilter = new BlurFilter(delta, delta, 1);
			
			title2.filter = blur2;
			
			
		}
		
		
	}
}