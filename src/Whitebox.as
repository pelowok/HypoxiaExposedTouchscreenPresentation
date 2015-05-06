package
{
	import com.greensock.TweenLite;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;
	
	
	public class Whitebox extends Image
	{
		
		private var thisX:int;
		private var thisY:int;
		private var thisW:int;
		private var thisH:int;
		private var thisDelay:Number;
		
		public function Whitebox( _x:int = 0, _y:int = 0, _w:int = 100, _h:int = 100, _delay:Number = 0 )
		{
			
			var texture:Texture = Assets.getTexture("WhiteBox");
			
			super(texture);
			
			thisX = _x;
			thisY = _y;
			thisW = _w;
			thisH = _h;
			thisDelay = _delay;
			
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
			
		}
		
		private function initialize():void	
		{
			
			with (this)
			{
				x = thisX;
				y = thisY;
				width = thisW;
				height = thisH;
			};
			
			TweenLite.to(this, 0.5, { alpha:0, delay: thisDelay } );
			
		}
	}
}