package events
{
	import flash.events.Event;
	
	public class VideoCompleteEvent extends Event
	{
		
		public static const COMPLETED:String = "completed";
		
		public function VideoCompleteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}