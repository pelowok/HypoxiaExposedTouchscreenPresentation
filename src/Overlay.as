package
{
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	
	public class Overlay extends Sprite
	{
		private var grid:Image;
		
		public function Overlay()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, drawScreen);
		}
		
		private function drawScreen(e:Event):void
		{
			grid = new Image( Assets.getTexture("GridOverlay") );
			this.addChild(grid);
		}
	}
}