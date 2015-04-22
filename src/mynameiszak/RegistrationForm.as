package mynameiszak
{
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.TextFormat;
	
	import cc.cote.feathers.softkeyboard.KeyEvent;
	import cc.cote.feathers.softkeyboard.SoftKeyboard;
	import cc.cote.feathers.softkeyboard.layouts.Layout;
	import cc.cote.feathers.softkeyboard.layouts.NumbersSymbolsSwitch;
	import cc.cote.feathers.softkeyboard.layouts.QwertySwitch;
	
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.List;
	import feathers.controls.PickerList;
	import feathers.controls.TextInput;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextEditor;
	import feathers.core.ITextRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayoutData;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import feathers.themes.HypoxiaTheme;
	
	public class RegistrationForm extends Sprite
	{
		
		private var bg1:Image;
		
		private var hitscreen:UnstyledButton;
		private var arrSlidingForm:Array;
		private var keyboard:SoftKeyboard;
		private var activeInput:TextInput;
		
		private var titlePicker:PickerList;
		private var firstName:TextInput;
		private var surName:TextInput;
		private var institution:TextInput;
		private var rolePicker:PickerList;
		private var specialtyPicker:PickerList;
		private var email1:TextInput;
		private var email2:TextInput;
		private var insight1:Check;
		private var insight2:Check;
		private var insight3:Check;
		private var insight4:Check;
		private var submit:Button;
		
		public function RegistrationForm()
		{
			super();
			
			new HypoxiaTheme(this);
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, BuildForm);
			
		}
		
		private function BuildForm(e:starling.events.Event = null):void
		{
			// add form background
			bg1 = new Image(Assets.getTexture("ScreenFormBG1"));
			bg1.x = 0;
			bg1.y = 0;
			this.addChild(bg1);
			
			// build components
			hitscreen = BuildHitscreen(hitscreen);
			keyboard = BuildKeyboard(keyboard);
			
			titlePicker = BuildPickerList(titlePicker, "Select from List", 447, 301);
			rolePicker = BuildPickerList(rolePicker, "Select from List", 865, 301);
			
			firstName = BuildTextInput(firstName, "Enter your first name", 450, 402);
			surName = BuildTextInput(surName, "Enter your surname", 450, 504);
			
			// add components to display list in order bottom to top
			this.addChild(hitscreen);
			this.addChild(titlePicker);
			this.addChild(firstName);
			this.addChild(surName);
			this.addChild(rolePicker);
			
			// keyboard needs to be on top
			this.addChild(keyboard);
			
			// push all the sliding components into arrSlidingForm
			arrSlidingForm = new Array();
			arrSlidingForm.push(bg1);
			arrSlidingForm.push(titlePicker);
			arrSlidingForm.push(firstName);
			arrSlidingForm.push(surName);
			arrSlidingForm.push(rolePicker);
			
			// TESTING PURPOSES
			// Send HTML Email
		//	SendHtmlEmail();
			
		}
		
		// HIT SCREEN
		private function BuildHitscreen(ub:UnstyledButton):UnstyledButton
		{
			ub = new UnstyledButton(Assets.getTexture("HitScreen"),"",Assets.getTexture("HitScreen")); 
			ub.x = 0;
			ub.y = -200;
			ub.alpha = 0;
			ub.visible = false;
			
			return ub;
			
		}
		
		// SoftKeyboard functions
		private function BuildKeyboard(sk:SoftKeyboard):SoftKeyboard
		{
			
			var layout:Vector.<Layout> = new <Layout>[
				new QwertySwitch(NumbersSymbolsSwitch),
				new NumbersSymbolsSwitch(QwertySwitch)
			];
			sk = new SoftKeyboard(layout);
			sk.addEventListener(KeyEvent.KEY_UP, onKeyUp);

			sk.x = 465;
			sk.y = 880;
			
			sk.width = 900;
			sk.height = 300;
			
			return(sk);
			
		}
		
		private function onKeyUp(e:KeyEvent):void
		{
			var c:uint = (e.charCode);
			var ch:String = e.char;
			
			trace(c + " : " + ch);
			
			switch(c)
			{
				case null:
					trace("WTFM8");
					break;
				case 13:
					// ENTER key
					trace("Go to next field");
					break;
				case 8:
					// backspace
					activeInput.text = activeInput.text.substr( 0, activeInput.text.length - 1);
					break;
				case 9:
					// tab
					trace("Go to next field");
					break;
				case 4294967295:
					// switch layout key was pressed
					break;
				default:
					if(ch != null)
					{
						activeInput.text += ch;
					}
					break;
			}
			
		}
		
		private function BuildPickerListItemArray(pl:PickerList):Array
		{

			var items:Array = [];

			switch(pl)
			{
				case titlePicker:
					trace("titlePicker");
					items.push({ text: "<no preferred title>" });
					items.push({ text: "Dr." });
					items.push({ text: "Mr." });
					items.push({ text: "Mrs." });
					items.push({ text: "Ms." });
					items.fixed = true;
					break;
				case rolePicker:
					trace("rolePicker");
					items.push({ text: "PHYSICIAN" });
					items.push({ text: "RESEARCHER" });
					items.push({ text: "NURSE PRACTITIONER" });
					items.push({ text: "REGISTERED NURSE" });
					items.push({ text: "PHYSICIAN'S ASSISTANT" });
					items.push({ text: "OTHER" });
					items.fixed = false;
					break;
				default:
					trace("didn't work");
					break;		
			}

			
			
			return items;
			
		}
		private function BuildPickerList(pl:PickerList, promptString:String, _x:int, _y:int):PickerList
		{
			
			var itemArray:Array = BuildPickerListItemArray(pl);
			
			pl = new PickerList();
			pl.prompt = "Select an Item";
			pl.dataProvider = new ListCollection(itemArray);
			
			//normally, the first item is selected, but let's show the prompt
			pl.selectedIndex = -1;
			
			var listLayoutData:AnchorLayoutData = new AnchorLayoutData();
			listLayoutData.horizontalCenter = 0;
			listLayoutData.verticalCenter = 0;
			pl.layoutData = listLayoutData;
			
			//the typical item helps us set an ideal width for the button
			//if we don't use a typical item, the button will resize to fit
			//the currently selected item.
		//	pl.typicalItem = { text: "Select an Item" };
			pl.labelField = "text";
			
			pl.customButtonStyleName = "picker-list-button";
			
			pl.listFactory = function():List
			{
				var list:List = new List();
				//notice that we're setting typicalItem on the list separately. we
				//may want to have the list measure at a different width, so it
				//might need a different typical item than the picker list's button.
			//	list.typicalItem = { text: "< No preferred title >" };
				list.width = 335;

				list.itemRendererFactory = function():IListItemRenderer
				{
					var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
					//notice that we're setting labelField on the item renderers
					//separately. the default item renderer has a labelField property,
					//but a custom item renderer may not even have a label, so
					//PickerList cannot simply pass its labelField down to item
					//renderers automatically
					renderer.labelField = "text";
					
					var tf:TextFormat = new TextFormat("Helvetica", 22, 0xFFFFFF);
					renderer.defaultLabelProperties.textFormat = tf;
					
					renderer.horizontalAlign = "left";
					
					renderer.defaultSkin = new Image( Assets.getTexture( "GreenBox" ) );
					renderer.selectedUpSkin = new Image( Assets.getTexture( "PinkBox" ) );
					renderer.padding = 10;

					return renderer;
				};
				
				return list;
			};
			
			
			
			// Event handlers
			pl.addEventListener(starling.events.Event.CHANGE, title_changeHandler);
			
			// screen position and appearence
			pl.width = 335;
			
			pl.x = _x;
			pl.y = _y;
			
			return pl;
		
		}
		
		private function title_changeHandler(e:starling.events.Event):void
		{
			var pl:PickerList;
			
			if(e.target is PickerList)
			{
			
				pl = e.target as PickerList;
				trace( pl.selectedItem.text);
	
			}
		}
		
		private function BuildTextInput(ti:TextInput, promptString:String, _x:int, _y:int):TextInput
		{
			
			// EMAIL INPUT
			ti = new TextInput();
			
			ti.textEditorFactory = function():ITextEditor
			{
				var tfte:TextFieldTextEditor = new TextFieldTextEditor();
				
				tfte.embedFonts = true;
				
				var tf:TextFormat = new TextFormat("Helvetica", 22, 0x000000);
				tfte.textFormat = tf;
				
				return tfte;
			};
			
			
			ti.prompt = promptString;
			
			// focus manager goes here
			ti.addEventListener(TouchEvent.TOUCH , HandleTextInputTouch);
			
			// position and appearence
			ti.x = _x;
			ti.y = _y;
			ti.backgroundSkin = new starling.display.Quad(330, 40, 0xffffff);
			
			return ti;
			
		}
		
		private function HandleTextInputTouch(e:TouchEvent):void
		{
			
			var ti:TextInput = e.currentTarget as TextInput;
			
			var touch:Touch = e.getTouch(ti, starling.events.TouchPhase.BEGAN);
			if (touch)
			{

				activeInput = ti;
				
				ShowKeyboard();
				
			}
			
		}
		
		public function ShowKeyboard():void
		{
			
			hitscreen.visible = true;

			for each(var obj in arrSlidingForm)
			{
				TweenLite.to(obj, 1, {y:(obj.y - 75)});
			}
			
			TweenLite.to(keyboard, 1, {y:580, onComplete:(function():void{hitscreen.addEventListener(TouchEvent.TOUCH, HideKeyboard);})});
			
		}
		
		public function HideKeyboard(e:TouchEvent):void
		{
			
			var ub:UnstyledButton = e.currentTarget as UnstyledButton;
			
			var touch:Touch = e.getTouch(ub, starling.events.TouchPhase.BEGAN);
			if (touch)
			{

				hitscreen.visible = false;
				hitscreen.removeEventListener(TouchEvent.TOUCH, HideKeyboard);
				
				for each(var obj in arrSlidingForm)
				{
					TweenLite.to(obj, 1, {y:(obj.y + 75)});
				}
				
				TweenLite.to(keyboard, 1, {y:1080});
			
			}
			
		}
		
		// HTML Email on validated SUBMIT
		private function SendHtmlEmail():void
		{
			
			var request:URLRequest = new URLRequest('http://www.mynameiszak.com/sandbox/php/HtmlEmailScript.php');
			
			var variables:URLVariables = new URLVariables();
			variables.sender_email = 'HypoxiaExposed@clientname.com';
			variables.email_address = 'kristen_mutascio@millet.com'; //'mynameiszak@gmail.com';
			variables.first_name = 'Kristen'; //'Zak';
			variables.last_name = 'Mutascio'; //'PeloJoaquin';
			variables.job_title = 'Professional Project Juggler'; //'Designer';
			
			request.data = variables;
			request.method = URLRequestMethod.POST;
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.addEventListener(flash.events.Event.COMPLETE, handleSubmitComplete);
			loader.load(request);
		}
		
		private function handleSubmitComplete(e:flash.events.Event):void {
			
			var loader:URLLoader = URLLoader(e.target);
			var vars:URLVariables = new URLVariables(loader.data);
			
			trace('vars.email: '+vars.email);
			trace('vars.id: '+vars.id);
			trace('vars.db: '+vars.db);

		}

		protected function HTTPReport(e:HTTPStatusEvent):void
		{
			
			trace(e);
		}
		
		protected function ioErrorHandler(e:IOErrorEvent):void
		{
			
			trace(e);
			
		}
	}
}