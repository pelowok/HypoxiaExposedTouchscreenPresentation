package mynameiszak
{
	
	import flash.events.Event;
	
	import HypoxiaTheme;
	
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
	import feathers.themes.StyleNameFunctionTheme;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;

	public class FormTest2 extends starling.display.Sprite
	{

		public var focusmanager:IFocusManager;
		
		private var activeInput:TextInput;
		
		private var title:PickerList;
		
		private var firstName:TextInput;
		private var surName:TextInput;
		private var institution:TextInput;
		private var emailInput:TextInput;
		private var emailInput2:TextInput;
		
		private var keyboard:SoftKeyboard;

		public function FormTest2()
		{
			super();
			
			new HypoxiaTheme(this);
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, BuildForm);
		//	BuildForm();
			
		}
		
		private function BuildForm(e:starling.events.Event = null):void
		{
			
			// create the focusManager
			focusmanager = FocusManager.defaultFocusManagerFactory(this);
			trace("FocusManager enabled : " + focusmanager.isEnabled);
			
			// declare default styles for feathers components
			
			
			// TITLE
			title = new PickerList();
			
			// assign data 
			title.dataProvider = new ListCollection(
				[
					{ text: "Title 1", thumbnail: Assets.getTexture( "GreenBox" ) },
					{ text: "Title 2", thumbnail: Assets.getTexture( "GreenBox" ) },
					{ text: "Title 3", thumbnail: Assets.getTexture( "GreenBox" ) },
					{ text: "Title 4", thumbnail: Assets.getTexture( "GreenBox" ) },
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
			
			
			
			title.x = 300;
			title.y = 335;
			
			title.prompt = "Title";
			title.selectedIndex = -1;
			
			// Make it so, Number One.
			this.addChild( title );
			
			// EMAIL INPUT
			emailInput = new TextInput();
			emailInput.textEditorFactory = function():ITextEditor
			{
				return new TextFieldTextEditor();
			};
			
			emailInput.promptFactory = function():ITextRenderer
			{
				var textRenderer:BitmapFontTextRenderer = new BitmapFontTextRenderer();
				return textRenderer;
			}
			
			emailInput.prompt = "Enter a valid email address";
			emailInput.selectRange( 0, emailInput.text.length );
			
			// focus manager goes here
			
			
			// position and appearence
			emailInput.x = 300;
			emailInput.y = 300;
			emailInput.backgroundSkin = new Quad(300, 40, 0xffffff);
			this.addChild(emailInput);
		
			var layout:Vector.<Layout> = new <Layout>[
				new QwertySwitch(NumbersSymbolsSwitch),
				new NumbersSymbolsSwitch(QwertySwitch)
			];
			keyboard = new SoftKeyboard(layout);
			keyboard.addEventListener(KeyEvent.KEY_UP, onKeyUp);
			this.addChild(keyboard);
				
			keyboard.x = 440;
			keyboard.y = 880;
			
			keyboard.width = 900;
			keyboard.height = 300;
		
			activeInput = emailInput;
			
		}
		
		
		private function PickerListButtonFactory():Button
		{
			var button:Button = new Button();
			button.defaultSkin = new Image(Assets.getTexture( "GreenBox" ));
			button.downSkin =  new Image(Assets.getTexture( "PinkBox" ));
			button.hoverSkin = new Image(Assets.getTexture( "PinkFrame" ));
			return button;
		};
		
		private function title_changeHandler(e:starling.events.Event):void
		{
			var picker:PickerList;
			
			if(e.target is PickerList)
			{
				picker = e.target as PickerList;
				trace(picker.selectedItem);
			}
	
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
		
	}
}