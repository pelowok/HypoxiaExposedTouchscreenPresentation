package mynameiszak
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	public class VideoOverlay extends Sprite
	{

		private var video:Video;
		private var streamClient:Object;
		private var connection:NetConnection;
		private var stream:NetStream;
		
		public function VideoOverlay()
		{
			
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			streamClient = new Object();
			
			streamClient.onTextData = onTextData;
			streamClient.onMetaData = onMetaData;
			streamClient.onCuePoint = onCuePoint;
			
			video = new Video();
			video.smoothing = true;
			addChild(video);
			
			initiatePlayback();
			
		}
		
		protected function initiatePlayback():void
		{
			trace("Initiated Playback.");
			
			connection = new NetConnection();
			connection.client = streamClient;
			connection.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			connection.connect(null);
			trace("Finished initiatePlayback");
		}
		
		protected function onNetStatus(e:NetStatusEvent):void{
			switch(e.info.code){
				case "NetConnection.Connect.Success":
					connectStream();
					break;
				case "NetStream.Buffer.Full":
					
					break;
				default:
					trace(e.info.code);
					break;
			}
		}
		
		protected function connectStream():void {
			stream = new NetStream(connection);
			stream.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			stream.client = streamClient;
			
			trace("Attempting stream attachment");
			video.attachNetStream(stream);

			video.width = 1280;
			video.height = 720;
			
			
			trace("Attempting to play stream");
		//	stream.play("../video/small.mp4");
		//	stream.play("http://www.overdigital.com/video/Hillman_720p23.976_2400kbps.mp4");
			stream.play("http://www.mynameiszak.com/sandbox/video/testvideo.mp4");
		//	stream.play("../video/testvideo.mp4");
		//	stream.pause();
			
		}
		
		private function netStatusHandler(event:NetStatusEvent):void 
		{ 
			// handle netStatus events, described later 
			
		} 
		
		public function onTextData(info:Object):void{}
		public function onMetaData(info:Object):void{}
		public function onCuePoint(info:Object):void{}
	}
}