package mynameiszak
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	public class LocalVideoPlayer extends Sprite
	{
		
		public var target:String;
		private var ns:NetStream;
		private var nc:NetConnection;
		public var video:Video;
		
		public function LocalVideoPlayer(_target:String=null)
		{
			super();
			
			target = _target;
			
			this.addEventListener(Event.ADDED_TO_STAGE, AddVideo);
		}
		
		private function AddVideo(e:Event):void {
			nc = new NetConnection();
			nc.connect(null);
			
			ns = new NetStream(nc);
			
			// onMetaData listener is required otherwise you get a ReferenceError
			var client:Object = new Object();
			client.onMetaData = function(metadata:Object):void {
				trace("Video duration : " + metadata.duration);
			}
			ns.client = client;
			
			video = new Video();
			video.attachNetStream(ns);
			this.addChild(video);

			try
			{
				
				ns.play(target);
				
				video.width = 1280;
				video.height = 720;
				
				video.x = 320;
				video.y = 120;

			} catch(e:Error) 
			{
				trace(e);
			}
			
		}
		
		public function PlayVideo(time:Number=0):void
		{
			
		}
		
		public function PauseVideo():void
		{
			
		}
		
		public function StopVideo():void
		{
			
		}
		
		public function ScrubVideo(time:Number=0):void
		{
			
		}
		
		public function RemoveVideo():void
		{
			
			ns.close();
			video.clear();
			video.attachNetStream(null);
			this.removeChild(video);
			
		}
	}
}