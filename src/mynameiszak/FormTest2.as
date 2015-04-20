package mynameiszak
{
	
	import Theme;
	
	import cc.cote.feathers.softkeyboard.KeyEvent;
	import cc.cote.feathers.softkeyboard.SoftKeyboard;
	import cc.cote.feathers.softkeyboard.layouts.Layout;
	import cc.cote.feathers.softkeyboard.layouts.NumbersSymbolsSwitch;
	import cc.cote.feathers.softkeyboard.layouts.QwertySwitch;
	
	import feathers.controls.TextInput;
	import feathers.controls.text.BitmapFontTextRenderer;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.core.ITextEditor;
	import feathers.core.ITextRenderer;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;

	public class FormTest2 extends starling.display.Sprite
	{

		private var input:TextInput;
		private var keyboard:SoftKeyboard;

		public function FormTest2()
		{
			super();
			
			new Theme(this);
			
			BuildForm();
			
		}
		
		private function BuildForm():void
		{
			
		//	var bg:Image = new Image(Assets.getTexture("HitScreen"));
			
			input = new TextInput();
			
			input.textEditorFactory = function():ITextEditor
			{
				return new TextFieldTextEditor();
			};
			
			input.promptFactory = function():ITextRenderer
			{
				var textRenderer:BitmapFontTextRenderer = new BitmapFontTextRenderer();
				
				// customize properties and styleshere
				
				
				return textRenderer;
			}
			
			input.prompt = "Enter a valid email address";
			input.selectRange( 0, input.text.length );
			input.addEventListener( starling.events.Event.CHANGE , input_changeHandler );
			input.x = 300;
			input.y = 300;
			input.backgroundSkin = new Quad(300, 40, 0xffffff);
		
			
			this.addChild(input);
			
			var layout:Vector.<Layout> = new <Layout>[
				new QwertySwitch(NumbersSymbolsSwitch),
				new NumbersSymbolsSwitch(QwertySwitch)
			];
			keyboard = new SoftKeyboard(layout);
			keyboard.addEventListener(KeyEvent.KEY_UP, onKeyUp);
			this.addChild(keyboard);
			keyboard.width = 900;
			keyboard.height = 300;
			
		}
		
		private function onKeyUp(e:KeyEvent):void
		{
			var c:uint = (e.charCode);
			
			trace(c);
			
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
					input.text = input.text.substr( 0, input.text.length - 1);
					break;
				case 9:
					// tab
					trace("Go to next field");
					break;
				case 4294967295:
					// switch layout key was pressed
					break;
				default:
					if(e.char != null)
					{
						input.text += e.char;
					}
					break;
			}
			
			
		}
		
		private function input_changeHandler(e:starling.events.Event):void
		{
			
			trace(input.text);
			
		}
	}
}