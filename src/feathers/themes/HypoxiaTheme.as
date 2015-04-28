package feathers.themes  
{

	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import cc.cote.feathers.softkeyboard.CharCode;
	import cc.cote.feathers.softkeyboard.Key;
	import cc.cote.feathers.softkeyboard.SoftKeyboard;
	
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.text.BitmapFontTextRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.DisplayListWatcher;
	import feathers.core.FeathersControl;
	import feathers.core.ITextRenderer;
	import feathers.display.Scale9Image;
	import feathers.text.BitmapFontTextFormat;
	import feathers.textures.Scale9Textures;
	import feathers.themes.StyleNameFunctionTheme;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	
	public class HypoxiaTheme extends DisplayListWatcher
	{
		
		/**
		 * Embed all skins, icons and fonts necessary to skin the SoftKeyboard component.
		 */
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinRegularUp.png")]
		public static const SoftKeyboardKeySkinRegularUp:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinRegularHover.png")]
		public static const SoftKeyboardKeySkinRegularHover:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinRegularDown.png")]
		public static const SoftKeyboardKeySkinRegularDown:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinSpecialUp.png")]
		public static const SoftKeyboardKeySkinSpecialUp:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinSpecialHover.png")]
		public static const SoftKeyboardKeySkinSpecialHover:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinSpecialDown.png")]
		public static const SoftKeyboardKeySkinSpecialDown:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinHasVariantsUp.png")]
		public static const SoftKeyboardKeySkinHasVariantsUp:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinHasVariantsHover.png")]
		public static const SoftKeyboardKeySkinHasVariantsHover:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardKeySkinHasVariantsDown.png")]
		public static const SoftKeyboardKeySkinHasVariantsDown:Class;

		[Embed(source="../../../assets/images/SoftKeyboardIconBackspace.png")]
		public static const SoftKeyboardIconBackspace:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardIconCapsLock.png")]
		public static const SoftKeyboardIconCapsLock:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardIconCapsLockSelected.png")]
		public static const SoftKeyboardIconCapsLockSelected:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardIconEnter.png")]
		public static const SoftKeyboardIconEnter:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardIconTab.png")]
		public static const SoftKeyboardIconTab:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardCalloutBackground.png")]
		public static const SoftKeyboardCalloutBackground:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardCalloutRightArrow.png")]
		public static const SoftKeyboardCalloutRightArrow:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardCalloutLeftArrow.png")]
		public static const SoftKeyboardCalloutLeftArrow:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardCalloutTopArrow.png")]
		public static const SoftKeyboardCalloutTopArrow:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardCalloutBottomArrow.png")]
		public static const SoftKeyboardCalloutBottomArrow:Class;
		
		[Embed(source="../../../assets/images/SoftKeyboardGlobalBackground.png")]
		public static const SoftKeyboardGlobalBackground:Class;
		
		/**
		 * Those two assets will only be used if you uncomment the BitmapFontTextRenderer examples 
		 * below (SCENARIO 2).
		 */
//		[Embed(source="../assets/fonts/MarkerFelt.png")]
//		public static const FONT_BITMAP:Class;
		
//		[Embed(source="../assets/fonts/MarkerFelt-XML.fnt", mimeType="application/octet-stream")]
//		public static const FONT_XML:Class;
		

		/** 
		 * Instantiates a new feathers theme which will be actively monitoring the Starling stage 
		 * and skinning components as they are added to it.
		 */		
		public function HypoxiaTheme(root:DisplayObject) {
			
			super(root as DisplayObjectContainer);
			
			var _style:StyleNameFunctionTheme = new StyleNameFunctionTheme();
			
			// SCENARIO 1: Use a TextFieldTextRenderer
			FeathersControl.defaultTextRendererFactory = function():ITextRenderer {
				var tftr:TextFieldTextRenderer = new TextFieldTextRenderer();
				tftr.textFormat = new TextFormat("Helvetica", 24, 0xFFFFFF, true);
				tftr.textFormat.align = TextFormatAlign.CENTER
				return tftr;
			};
			
			// SCENARIO 2: Use a BitmapFontTextRenderer. This will use the font png and xml embedded
			// above.
//			FeathersControl.defaultTextRendererFactory = function():ITextRenderer {
//				var bmf:BitmapFont = new BitmapFont(HypoxiaTheme.getTexture(FONT_BITMAP), XML(new FONT_XML()));
//				var bftr:BitmapFontTextRenderer = new BitmapFontTextRenderer();
//				bftr.textFormat = new BitmapFontTextFormat(bmf, 24);
//				bftr.textFormat.align = TextFormatAlign.CENTER;
//				return bftr;
//			};
			
			// Assign skinning initializers for the 4 elements that can be skinned : SoftKeyboard 
			// (the overall keyboard), Key (each individual key), Key label (only the label 
			// belonging to a SoftKeyboard Key object) and Callout (the key variants pop-up).
			setInitializerForClass(SoftKeyboard, _softKeyboard);
			setInitializerForClass(Key, _key);
			setInitializerForClass(Label, _softkeyboardKeyLabel, Key.SOFTKEYBOARD_KEY_LABEL);
			setInitializerForClass(Callout, _callout);
			
			_style.getStyleProviderForClass(feathers.controls.Button).setFunctionForStyleName("picker-list-button", BuildPickerButtonStyle);
			
		}
		
		private function BuildPickerButtonStyle(button:Button):void
		{
			// trace("OMFGBBQ");
			button.labelFactory = function():ITextRenderer
			{
				return new TextFieldTextRenderer();
			};
			
			button.defaultLabelProperties.textFormat = new TextFormat( "Helvetica", 22, 0x000000, true );
			button.horizontalAlign = "left";
			button.defaultLabelProperties.textFormat.align = TextFormatAlign.LEFT;
			button.defaultLabelProperties.textFormat.leftMargin = 5;
			button.paddingBottom = 11;
		}
		
		/** Initializer for the Key subcomponent */
		private function _key(k:Key):void {
			
			// Assign regular key skins
			k.regularKeyUpSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinRegularUp, 5, 5);
			k.regularKeyHoverSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinRegularHover, 5, 5);
			k.regularKeyDownSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinRegularDown, 5, 5);
			
			// Assign special key skins
			k.specialKeyUpSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinSpecialUp, 5, 5);
			k.specialKeyHoverSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinSpecialHover, 5, 5);
			k.specialKeyDownSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinSpecialDown, 5, 5);
			
			// Assign skins for key that have variants
			k.hasVariantsKeyUpSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinHasVariantsUp, 5, 5);
			k.hasVariantsKeyHoverSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinHasVariantsHover, 5, 5);
			k.hasVariantsKeyDownSkin = HypoxiaTheme.getScale9Image(SoftKeyboardKeySkinHasVariantsDown, 5, 5);
			
			// Assign icons to special keys
			if (k.charCode == CharCode.NUM_LOCK) 	k.icon = HypoxiaTheme.getImage(SoftKeyboardIconBackspace);
			if (k.charCode == CharCode.BACKSPACE) 	k.icon = HypoxiaTheme.getImage(SoftKeyboardIconBackspace);
			if (k.charCode == CharCode.RETURN) 		k.icon = HypoxiaTheme.getImage(SoftKeyboardIconEnter);
			if (k.charCode == CharCode.TAB) 		k.icon = HypoxiaTheme.getImage(SoftKeyboardIconTab);
			
			if (k.charCode == CharCode.CAPS_LOCK) {
				k.icon = HypoxiaTheme.getImage(SoftKeyboardIconCapsLock);
				k.selectedIcon = HypoxiaTheme.getImage(SoftKeyboardIconCapsLockSelected);
			}
			
		}
		
		private function _softkeyboardKeyLabel(l:Label):void {

			// Example: if you want to style the letter 'M' differently
//			if (l.nameList.contains('M')) {
//				l.textRendererProperties.textFormat = new TextFormat('_sans', 22, 0xFF0000);
//			}
			
		}
		
		/** Initializer for the Callout component */
		public function _callout(c:Callout):void {
			c.backgroundSkin = HypoxiaTheme.getScale9Image(SoftKeyboardCalloutBackground, 15, 15);
			
			c.topArrowSkin = HypoxiaTheme.getImage(SoftKeyboardCalloutTopArrow);
			c.rightArrowSkin = HypoxiaTheme.getImage(SoftKeyboardCalloutRightArrow);
			c.bottomArrowSkin = HypoxiaTheme.getImage(SoftKeyboardCalloutBottomArrow);
			c.leftArrowSkin = HypoxiaTheme.getImage(SoftKeyboardCalloutLeftArrow);
			
			c.paddingLeft = 8;
			c.paddingRight = 12;
			c.paddingTop = 7;
			c.paddingBottom = 12;
			
			c.bottomArrowGap = c.topArrowGap = c.leftArrowGap = c.rightArrowGap = -2;
		}
		
		private function _softKeyboard(s:SoftKeyboard):void {
			s.backgroundSkin = HypoxiaTheme.getScale9Image(SoftKeyboardGlobalBackground, 15, 15);
			s.padding = 10;
		}
		
		
		
		
		
		
		
		
		/************** BELOW ARE UTILITY METHODS FOR WORKING WITH IMAGES & TEXTURES **************/
		
		/** Dictionary to store the textures as they are created during runtime */
		private static var _textures:Dictionary = new Dictionary;
		
		/**
		 * Returns a texture matching the specified class.
		 * @param source The class from which to fetch the textures
		 */
		public static function getTexture(source:Class):Texture {
			
			var qName:String = getQualifiedClassName(source);
			
			if (!_textures[qName]) {
				var bitmap:Bitmap = new source();
				_textures[qName] = Texture.fromBitmap(bitmap);
			}
			return _textures[qName];
			
		}
		
		/**
		 * Returns an image built from the texture associated to the class passed as a parameter.
		 * @param source Class associated to the embedded asset
		 */
		public static function getImage(source:Class):Image {
			return new Image(HypoxiaTheme.getTexture(source));
		}
		
		/**
		 * Returns a Scale9Image object from the specified texture name and class
		 * @param name Texture name
		 * @param rect Stretching rectangle
		 */
		public static function getScale9Image(
			source:Class, 
			staticWidth:Number = 25, 
			staticHeight:Number = 25
		):Scale9Image {
			
			var texture:Texture = HypoxiaTheme.getTexture(source);
			
			var rect:Rectangle = new Rectangle(
				staticWidth, 
				staticHeight, 
				texture.width - 2 * staticWidth,
				texture.height - 2 * staticHeight
			)
			
			var s9Textures:Scale9Textures = new Scale9Textures(texture, rect);
			return new Scale9Image(s9Textures);
			
		}
		
	}
	
}
