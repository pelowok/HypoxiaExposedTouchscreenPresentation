package mynameiszak
{
	import flash.debugger.enterDebugger;
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.StageVideoAvailabilityEvent;
	import flash.geom.Rectangle;
	import flash.media.StageVideo;
	import flash.media.StageVideoAvailability;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import starling.core.Starling;
	
	public dynamic class StageVideoOverlay extends Sprite
	{
		public function StageVideoOverlay()
		{
		//	NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, handleDeactivate, false, 0, true)
			
						
			Starling.current.nativeOverlay.stage.align = StageAlign.TOP_LEFT;
			Starling.current.nativeOverlay.stage.scaleMode = StageScaleMode.NO_SCALE ;
			Starling.current.nativeOverlay.stage.addEventListener( StageVideoAvailabilityEvent.STAGE_VIDEO_AVAILABILITY , stageVideoState );
		}
		protected var stream:NetStream ;
		
		protected function stageVideoState( e:StageVideoAvailabilityEvent ):void
		{
			var available:Boolean = e.availability == StageVideoAvailability.AVAILABLE ;
			
			if ( available )
			{
				var nc:NetConnection = new NetConnection() ;
				nc.connect(null) ;
				stream = new NetStream(nc) ;
				stream.client = this ;
				var video:StageVideo = stage.stageVideos[0] ;
				video.viewPort = new Rectangle( 0, 0, 1280 , 720 ) ;
				video.attachNetStream( stream ) ;
				stream.play( "../video/small.mp4") ;
			} else {
				trace("Not Available." + e.target);
			}
			
		}
		
		public function onMetaData( info:Object ):void
		{
			
		}
		
		private function handleActivate(event:Event):void
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
		}
		
		private function handleDeactivate(event:Event):void
		{
			NativeApplication.nativeApplication.exit();
		}			
		
	}
}