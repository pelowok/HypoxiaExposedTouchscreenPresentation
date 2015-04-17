package mynameiszak
{

	import feathers.controls.Button;
	import feathers.controls.GroupedList;
	import feathers.controls.TextInput;
	import feathers.controls.renderers.DefaultGroupedListItemRenderer;
	import feathers.controls.renderers.IGroupedListItemRenderer;
	import feathers.data.HierarchicalCollection;
	import feathers.themes.MinimalDesktopTheme;
	
	import starling.display.Sprite;

	import flash.net.URLLoader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.events.IOErrorEvent;
	import flash.events.HTTPStatusEvent;
	
	
	public class FormTest1 extends starling.display.Sprite {
		
		private var screenWidth:Number = 1000;
		
		private var screenHeight:Number = 600;
		
		private var gWidth:Number = screenWidth*.5;
		
		private var groupedList:GroupedList;
		private var nameTextInput:TextInput;
		private var doctorTextInput:TextInput;
		private var pharmacyTextInput:TextInput;
		private var emergencyTextInput:TextInput;
		
		private var btnDelete:Button;
		private var btnSave:Button;
		
		public function FormTest1():void
			
		{
			
			super();
			
			new MinimalDesktopTheme();
			
		// works
			ConnectToDB();
			
		//	ConnectToSpreadsheet();

		}
		
		private function ConnectToSpreadsheet():void
		{
			
			var request:URLRequest = new URLRequest('"https://docs.google.com/forms/d/13N319XCWYbaGAXqY-KuDV30gUoRHxqccTcyJ9zOIaZ0/formResponse&ifq&entry_878368733=testing@zipl.org" id="ss-form" target="_self" onsubmit');

			var variables:URLVariables = new URLVariables();
			
			variables.sender_email = 'HypoxiaExposed@clientname.com';
			variables.email_address = 'mynameiszak@gmail.com';
			variables.first_name = 'Zak';
			
			request.data = variables;
			
			request.method = URLRequestMethod.POST;
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.addEventListener(Event.COMPLETE, handleComplete);
			loader.load(request);
			
		}
		
		private function ConnectToDB():void
		{

			var request:URLRequest = new URLRequest('http://www.mynameiszak.com/sandbox/php/tester6.php');
			
			var variables:URLVariables = new URLVariables();
			variables.sender_email = 'HypoxiaExposed@clientname.com';
			variables.email_address = 'mynameiszak@gmail.com';
			variables.first_name = 'Zak';
			variables.last_name = 'PeloJoaquin';
			variables.job_title = 'Designer';
			
			request.data = variables;
			request.method = URLRequestMethod.POST;
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.addEventListener(Event.COMPLETE, handleComplete);
			loader.load(request);
		}
		
		private function handleComplete(event:Event):void {
			
			var loader:URLLoader = URLLoader(event.target);
			var vars:URLVariables = new URLVariables(loader.data);
			
			trace('vars.email: '+vars.senderEmail);
			trace('vars.id: '+vars.email_address);
			trace('vars.db: '+vars.first_name);
		
			BuildForm();
		}
		
		protected function HTTPReport(e:HTTPStatusEvent):void
		{
	
			trace(e);
		}
		
		protected function ioErrorHandler(e:IOErrorEvent):void
		{
			
			trace(e);
			
		}
		
		private function BuildForm():void
		{
			
			buildTextInputs();
			groupedList = new GroupedList();
			
			var group:Array = [
				
				{
					
					header: "Enter Your Information Here.",
					footer: "This Is The Footer.",
					
					children: [
						{label: "My Name:", accessory:nameTextInput},
						{label: "My Doctor's Information:", accessory:doctorTextInput},
						{label: "My Pharmacy's Information:", accessory:pharmacyTextInput},
						{label: "My Emergency Contact Information:", accessory:emergencyTextInput}
					]
					
				}
				
			];
			
			groupedList.dataProvider = new HierarchicalCollection(group);
			groupedList.itemRendererFactory = function():IGroupedListItemRenderer
				
			{
				
				var renderer:DefaultGroupedListItemRenderer = new DefaultGroupedListItemRenderer();
				
				renderer.accessoryField = "accessory";
				renderer.accessoryGap = Number.POSITIVE_INFINITY;
				renderer.accessoryPosition = 'right';
				
				return renderer;
				
			};
			
			groupedList.isSelectable = false;	
			groupedList.nameList.add(GroupedList.ALTERNATE_NAME_INSET_GROUPED_LIST);		
			this.addChild(groupedList);
			
			groupedList.validate();
			groupedList.width = screenWidth;
			groupedList.height = screenHeight;
			
		}
		
		private function buildTextInputs():void
			
		{
			
			nameTextInput = new TextInput();
			nameTextInput.width = gWidth;

			doctorTextInput = new TextInput();
			doctorTextInput.width = gWidth;

			pharmacyTextInput = new TextInput();
			pharmacyTextInput.width = gWidth;

			emergencyTextInput = new TextInput();
			emergencyTextInput.width = gWidth;
			
		}
		
		public function checkEmailAddress(emailAddress:String):Boolean
		{
			var address:String      = "([a-z0-9._-]+)";
			var domainName:String   = "([a-z0-9.-]+)";
			var domainExt:String    = "([a-z]{2,6})";
			
			var email:RegExp = new RegExp("^" + address + "@" + domainName + "\\." + domainExt + "$", "i");
			
			return email.test(emailAddress);
		}
	}
}