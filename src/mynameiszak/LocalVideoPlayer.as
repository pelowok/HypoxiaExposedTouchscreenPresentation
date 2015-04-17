package mynameiszak
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;

	import events.VideoCompleteEvent;
	
	public class LocalVideoPlayer extends Sprite
	{
		[Embed(source="../video/play.png")]
		public static const PlayButton:Class;
		
		public var target:String;
		private var ns:NetStream;
		private var nc:NetConnection;
		public var video:Video;
		private var client:Object;
		
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
			client = new Object();
			ns.client = client;
			
			client.onMetaData = OnMetaData;
			client.onPlayStatus = OnPlayStatus;
			
			ns.addEventListener(NetStatusEvent.NET_STATUS, statusHandler); 

			video = new Video();
			video.attachNetStream(ns);
			this.addChild(video);
			this.alpha = 0;

			try
			{
				
				ns.play(target);
				ns.pause();
				
				video.width = 1280;
				video.height = 720;
				
				video.x = 320;
				video.y = 120;

			} catch(err:Error) 
			{
				trace(err);
			}

			TweenLite.to(this, 2, {alpha:1, onComplete:PlayVideo});
			
		}
		
		private function OnMetaData(obj:Object):void 
		{ 
			trace("metaData : " + obj);
		}
		
		private function OnPlayStatus(obj:Object):void{
			trace("play status : " + obj);
		}
		
		private function statusHandler(event:NetStatusEvent):void 
		{ 
			trace("NET_STATUS : " + event.info.code);
			
			switch (event.info.code) 
			{ 
				case "NetStream.Play.Start": 
					trace("Start [" + ns.time.toFixed(3) + " seconds]"); 
					break; 
				case "NetStream.Play.Stop": 
					trace("Stop [" + ns.time.toFixed(3) + " seconds]"); 
					TweenLite.to(this, 2, {alpha:0, onComplete:CallRemoveVideo});
					break; 
			} 
			
		}
		
		private function AddVideoUI():void
		{
			var mc:MovieClip = new MovieClip();
			var bmp:Bitmap = new PlayButton();
			mc.addChild(bmp);
			
			mc.x = 275;
			mc.y = 600;
			
			this.addChild(mc);
		}
		
		public function PlayVideo(time:Number=0):void
		{
			ns.resume();
		}
		
		public function PauseVideo():void
		{
			ns.togglePause();
		}
		
		public function StopVideo():void
		{
			
		}
		
		public function ScrubVideo(time:Number=0):void
		{
			
		}
		
		private function CallRemoveVideo():void
		{
			// This separate method exists to avoid calling RemoveVideo()
			// twice. Simply bubble an Event that calls RemoveVideo from
			// the parent container.
			
			dispatchEvent(new VideoCompleteEvent(VideoCompleteEvent.COMPLETED, true));
			
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