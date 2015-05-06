package screens
{
	
	import starling.animation.Juggler;
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.events.Event;
	
	public class Screen20Graphic4 extends DisplayObjectContainer
	{
		
		public var juggler:Juggler;
		private var img1:Image;
		private var img2:Image;
		private var img3:Image;
		private var img4:Image;
	//	private var img5:Image;
	//	private var img6:Image;
	//	private var img7:Image;
	//	private var img8:Image;
		
		private var list:Vector.<Image>;
		
		
		public function Screen20Graphic4()
		{
			
			super();
			
			juggler = Starling.juggler;
			
			list = new Vector.<Image>();
			
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			
		}
		
		private function OnAddedToStage(e:Event):void	
		{
			
			this.removeEventListener(Event.ADDED_TO_STAGE, DrawScreen);
			
			trace("Screen20Graphic4 added to stage");
			
			DrawScreen();
			
		}
		
		private function DrawScreen():void
		{
			
			list.push(img1 = PlaceImage( img1, "Graphic40" ) );
	// ##################################
			// NOTE OUT OF ORDER TO GET LAYERS CORRECT
			list.push(img4 = PlaceImage( img4, "Graphic43" ) );
			
			list.push(img2 = PlaceImage( img2, "Graphic41" ) );
			
			list.push(img3 = PlaceImage( img3, "Graphic42" ) );
			
			
			
		//	list.push(img5 = PlaceImage( img5, "Graphic44" ) );
			
		//	list.push(img5 = PlaceImage( img5, "Graphic45" ) );
			
		//	list.push(img5 = PlaceImage( img5, "Graphic46" ) );
			
		//	list.push(img5 = PlaceImage( img5, "Graphic47" ) );
			
		}
		
		private function PlaceImage( img:Image, texture:String, _x:int=0, _y:int=0 ):Image
		{
			
			img = new Image( Assets.getTexture( texture ) );
			img.x = _x;
			img.y = _y;
			img.alpha = 0;
			img.visible = false;
			this.addChild(img);
			
			return img;
			
		}
		
		public function StartingPositions():void
		{
			// bg
			with (img1)
			{
				//	x = 0;
				//	y = 0;
				//	height = 100;
				//	width = 100;
				alpha = 0;
				visible = false;
			}
			
			with (img2)
			{
				//	x = 100;
				//	y = 100;
				//	height = 100;
				//	width = 100;
				alpha = 0;
				visible = false;
			}
			
			with (img3)
			{
				//	x = 100;
				//	y = 100;
				//	height = 100;
				//	width = 100;
				alpha = 0;
				visible = false;
			}
			
			with (img4)
			{
				//	x = 100;
				//	y = 100;
				//	height = 100;
				//	width = 100;
				alpha = 0;
				visible = false;
			}
	/*		
			with (img5)
			{
				//	x = 100;
				//	y = 100;
				//	height = 100;
				//	width = 100;
				alpha = 0;
				visible = false;
			}
			
			with (img6)
			{
				//	x = 100;
				//	y = 100;
				//	height = 100;
				//	width = 100;
				alpha = 0;
				visible = false;
			}
			
			with (img7)
			{
				//	x = 100;
				//	y = 100;
				//	height = 100;
				//	width = 100;
				alpha = 0;
				visible = false;
			}
			
			with (img8)
			{
				//	x = 100;
				//	y = 100;
				//	height = 100;
				//	width = 100;
				alpha = 0;
				visible = false;
			}
		*/
			
		}
		
		public function Play():void
		{
			
			img1.visible = true;
			//	TweenLite.to( img1, 1, { delay: 1, x: 500, y: 500, alpha: 1, onComplete: Play2() } );
			juggler.tween( img1, 1, { delay: 1, alpha: 1, onComplete: function():void{Play2();} } );
			
		}
		
		private function Play2():void
		{
			
			img2.visible = true;
			juggler.tween( img2, 1, { alpha: 1, onComplete: function():void{Play3();}  } );
			
		}
		
		private function Play3():void
		{
			
			img3.visible = true;
			juggler.tween( img3, 1, { alpha: 1,  onComplete:  function():void{Play4();} } );
			
		}
		
		private function Play4():void
		{
			
			img4.visible = true;
			juggler.tween( img4, 1, { alpha: 1,  onComplete:  function():void{Complete();} } );
			
		}
	/*	
		private function Play5():void
		{
			
			img5.visible = true;
			juggler.tween( img5, 1, { alpha: 1,  onComplete:  function():void{Play6();} } );
			
		}
		
		private function Play6():void
		{
			
			img6.visible = true;
			juggler.tween( img6, 1, { alpha: 1,  onComplete:  function():void{Play7();} } );
			
		}
		
		private function Play7():void
		{
			
			img7.visible = true;
			juggler.tween( img7, 1, { alpha: 1,  onComplete:  function():void{Play8();} } );
			
		}
		
		private function Play8():void
		{
			
			img8.visible = true;
			juggler.tween( img8, 1, { alpha: 1,  onComplete:  function():void{Complete();} } );
			
		}
	*/	
		private function Complete():void
		{
			
			trace("Completed");
			
		}
		
		
	}
}