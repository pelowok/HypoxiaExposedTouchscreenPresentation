/*

Copyright (c) 2013-2014, Jean-Philippe Côté (www.cote.cc)
All rights reserved.

This library is provided "as is" with no guarantees whatsoever. Use it at your own risk.

*/

package cc.cote.feathers.softkeyboard.layouts
{
	import cc.cote.feathers.softkeyboard.CharCode;
	import cc.cote.feathers.softkeyboard.Key;
	import cc.cote.feathers.softkeyboard.keycollections.SymbolKeyVariants;
	
	/**
	 * The <code>NumbersSymbolsSwitch</code> class defines a keyboard layout containing all 10 
	 * digits and the most useful symbol characters (including many key variants). It also features
	 * a <code>SWITCH_LAYOUT</code> key.
	 */
	public class NumbersSymbolsSwitch extends Layout
	{
		
		/** The label to use on <code>SWITCH_LAYOUT</code> keys pointing to this layout. */
		public static const SWITCH_KEY_LABEL:String = '123 @$?';
		
		/** 
		 * Creates a new NumbersSymbolsSwitch object.
		 * 
		 * @param switchKeyClass The class to use with the <code>SWITCH_KEY</code> defined by this
		 * layout.
		 */
		public function NumbersSymbolsSwitch(switchKeyClass:Class):void {
			
			// Define all rows of keys for that layout
			rows = new <Vector.<Key>>[
				new <Key>[
					new Key(CharCode.DIGIT_1),
					new Key(CharCode.DIGIT_2),
					new Key(CharCode.DIGIT_3),
					new Key(CharCode.DIGIT_4),
					new Key(CharCode.DIGIT_5),
					new Key(CharCode.DIGIT_6),
					new Key(CharCode.DIGIT_7),
					new Key(CharCode.DIGIT_8),
					new Key(CharCode.DIGIT_9),
					new Key(CharCode.DIGIT_0)
				],
				new <Key>[
					new Key(CharCode.HYPHEN, SymbolKeyVariants.MINUS),
					new Key(CharCode.SLASH, SymbolKeyVariants.SLASH),
					new Key(CharCode.COLON, SymbolKeyVariants.COLON),
					new Key(CharCode.TILDE),
					new Key(CharCode.LEFT_PARENTHESIS, SymbolKeyVariants.LEFT_PARENTHESIS), 
					new Key(CharCode.RIGHT_PARENTHESIS, SymbolKeyVariants.RIGHT_PARENTHESIS),
					new Key(CharCode.DOLLAR, SymbolKeyVariants.DOLLAR_SIGN),
					new Key(CharCode.AMPERSAND),
					new Key(CharCode.APOSTROPHE),
					new Key(CharCode.QUOTE)
				],
				new <Key>[
					new Key(CharCode.AT_SIGN, SymbolKeyVariants.AT_SIGN),
					new Key(CharCode.PERIOD),
					new Key(CharCode.COMMA),
					new Key(CharCode.QUESTION_MARK, SymbolKeyVariants.QUESTION_MARK),
					new Key(CharCode.EXCLAMATION_MARK, SymbolKeyVariants.EXCLAMATION_MARK),
					new Key(CharCode.HASH),
					new Key(CharCode.CIRCUMFLEX_ACCENT),
					new Key(CharCode.BACKTICK),
					new Key(CharCode.PERCENT, SymbolKeyVariants.PERCENT),
					new Key(CharCode.ASTERISK,  SymbolKeyVariants.ASTERISK),
					new Key(CharCode.BACKSPACE, null, Key.EDITING_KEY, 'BACKSPACE', 1.55)
				],
				new <Key>[
					new Key(CharCode.SWITCH_LAYOUT, null, Key.SYSTEM_KEY, switchKeyClass.SWITCH_KEY_LABEL, 2.5, 1, switchKeyClass),
					new Key(CharCode.SPACE, null, Key.CHARACTER_KEY, '', 5),
					new Key(CharCode.RETURN, null, Key.EDITING_KEY, 'RETURN', 2.5)
				]
			];
			
		}					
		
	}
	
}

