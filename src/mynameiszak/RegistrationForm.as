package mynameiszak
{
	import cc.cote.feathers.softkeyboard.KeyEvent;
	import cc.cote.feathers.softkeyboard.SoftKeyboard;
	import cc.cote.feathers.softkeyboard.layouts.Layout;
	import cc.cote.feathers.softkeyboard.layouts.NumbersSymbolsSwitch;
	import cc.cote.feathers.softkeyboard.layouts.QwertySwitch;
	
	import feathers.controls.Button;
	import feathers.controls.PickerList;
	import feathers.controls.TextInput;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.text.BitmapFontTextRenderer;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.core.FocusManager;
	import feathers.core.IFocusManager;
	import feathers.core.ITextEditor;
	import feathers.core.ITextRenderer;
	import feathers.data.ListCollection;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class RegistrationForm extends Sprite
	{
		
		private var keyboard:SoftKeyboard;
		private var activeInput:TextInput;
		private var title:PickerList;
		
		public function RegistrationForm()
		{
			super();
			
			new HypoxiaTheme(this);
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, BuildForm);
			
		}
		
		private function BuildForm(e:starling.events.Event = null):void
		{
			// build components
			keyboard = BuildKeyboard();
			title = BuildTitlePicker();
			
			
			// add components to display list in order bottom to top
			this.addChild(title);
			
			// keyboard needs to be on top
			this.addChild(keyboard);
			
		}
		
		// SoftKeyboard functions
		private function BuildKeyboard():SoftKeyboard
		{
			
			var layout:Vector.<Layout> = new <Layout>[
				new QwertySwitch(NumbersSymbolsSwitch),
				new NumbersSymbolsSwitch(QwertySwitch)
			];
			keyboard = new SoftKeyboard(layout);
			keyboard.addEventListener(KeyEvent.KEY_UP, onKeyUp);

			keyboard.x = 440;
			keyboard.y = 880;
			
			keyboard.width = 900;
			keyboard.height = 300;
			
			return(keyboard);
			
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
		
		private function BuildTitlePicker():PickerList
		{
			
			title = new PickerList();
			
			// assign data 
			title.dataProvider = new ListCollection(
				[
					
					{ text: "<no preffered title>", thumbnail: Assets.getTexture( "GreenBox" ) },
					{ text: "Dr.", thumbnail: Assets.getTexture( "GreenBox" ) },
					{ text: "Mr.", thumbnail: Assets.getTexture( "GreenBox" ) },
					{ text: "Mrs.", thumbnail: Assets.getTexture( "GreenBox" ) },
					{ text: "Ms.", thumbnail: Assets.getTexture( "GreenBox" ) },
					
				]);
			
			// define the rendered fields in each button
			title.listProperties.itemRendererFactory = function():IListItemRenderer
			{
				var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
				renderer.labelField = "text";
				renderer.iconSourceField = "thumbnail";
				renderer.defaultSkin = new Image( Assets.getTexture( "GreenBox" ) );
				
				return renderer;
			};
			
			// Event handlers
			title.addEventListener(starling.events.Event.CHANGE, title_changeHandler);
			
			// screen position and appearence
			title.x = 50;
			title.y = 100;
			
			title.prompt = "Title";
			title.selectedIndex = -1;
			
			return title;
			
		}
		
		private function title_changeHandler(e:Event):void
		{
			var pl:PickerList;
			
			if(e.target is PickerList)
			{
				pl = e.target as PickerList;
				trace("PickerList[title] : " + pl.labelField );
			}
		}
	}
}