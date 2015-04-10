package events
{
	import starling.events.Event;
	
	public class NavigationEvent extends Event
	{
		
		public static const CHANGE_SCREEN:String = "changeScreen";
		
		public function NavigationEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}