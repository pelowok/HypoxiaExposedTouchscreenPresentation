package mynameiszak
{
	import com.greensock.TweenLite;
	
	import flash.display3D.textures.Texture;
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
	import feathers.themes.HypoxiaTheme;
	
	import screens.ScreenRegister;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	
	public class RegistrationForm extends Sprite
	{
		
		public var keyboardIsVisible:Boolean;
		public var arrContactData:Array;
		
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
		private var btnSubmit:starling.display.Button;
		
		public function RegistrationForm()
		{
			super();
			
			new HypoxiaTheme(this);
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, BuildForm);
			
		}
		
		private function BuildForm(e:starling.events.Event = null):void
		{
			
			keyboardIsVisible = false;
			
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
			specialtyPicker = BuildPickerList(specialtyPicker, "Select from List", 865, 406);
			
			firstName = BuildTextInput(firstName, "Enter your first name", 450, 402);
			surName = BuildTextInput(surName, "Enter your surname", 450, 504);
			institution = BuildTextInput(institution, "Enter Institution Name", 450, 609);
			email1 = BuildTextInput(email1, "Enter your email address", 868, 506);
			email2 = BuildTextInput(email2, "Confirm your email address", 868, 609);
			
			insight1 = BuildCheck(insight1, 1275, 305);
			insight2 = BuildCheck(insight2, 1275, 380);
			insight3 = BuildCheck(insight3, 1275, 455);
			insight4 = BuildCheck(insight4, 1275, 535);
			
			btnSubmit = BuildSubmitButton(btnSubmit, 652, 680);
			
			// add components to display list in order bottom to top
			this.addChild(hitscreen);
			this.addChild(titlePicker);
			this.addChild(firstName);
			this.addChild(surName);
			this.addChild(rolePicker);
			this.addChild(specialtyPicker);
			this.addChild(institution);
			this.addChild(email1);
			this.addChild(email2);
			this.addChild(insight1);
			this.addChild(insight2);
			this.addChild(insight3);
			this.addChild(insight4);
			this.addChild(btnSubmit);
			
			// keyboard needs to be on top
			this.addChild(keyboard);
			
			// push all the sliding components into arrSlidingForm
			arrSlidingForm = new Array();
			arrSlidingForm.push(bg1);
			arrSlidingForm.push(titlePicker);
			arrSlidingForm.push(firstName);
			arrSlidingForm.push(surName);
			arrSlidingForm.push(rolePicker);
			arrSlidingForm.push(specialtyPicker);
			arrSlidingForm.push(institution);
			arrSlidingForm.push(email1);
			arrSlidingForm.push(email2);
			arrSlidingForm.push(insight1);
			arrSlidingForm.push(insight2);
			arrSlidingForm.push(insight3);
			arrSlidingForm.push(insight4);
			arrSlidingForm.push(btnSubmit);
			
			
			// Prepare array for contact data
			arrContactData = new Array();
			
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
		
		
		public function ShowKeyboard():void
		{
			
			if(!keyboardIsVisible)
			{
				
				keyboardIsVisible = true;
				
				hitscreen.visible = true;
				
				trace("ShowKeyboard is disabling btnSubmit");
				btnSubmit.enabled = false;
				btnSubmit.removeEventListener( TouchEvent.TOUCH, HandleSubmitTouch );
				trace("btnSubmit.hasEventListener(TouchEvent.TOUCH) : " + btnSubmit.hasEventListener(TouchEvent.TOUCH) );
				
				for each(var obj in arrSlidingForm)
				{
					TweenLite.to(obj, 1, {y:(obj.y - 75)});
				}
				
				TweenLite.to(keyboard, 1, {y:580, onComplete:(function():void{hitscreen.addEventListener(TouchEvent.TOUCH, HideKeyboard);})});
				
			}
			
		}
		
		public function HideKeyboard(e:TouchEvent):void
		{
			if(keyboardIsVisible)
			{
				var ub:UnstyledButton = e.currentTarget as UnstyledButton;
				
				var touch:Touch = e.getTouch(ub, starling.events.TouchPhase.BEGAN);
				if (touch)
				{

					ToggleSubmit( TestFields() );
					
					keyboardIsVisible = false;
					
					hitscreen.visible = false;
					hitscreen.removeEventListener(TouchEvent.TOUCH, HideKeyboard);
					
					for each(var obj in arrSlidingForm)
					{
						TweenLite.to(obj, 1, {y:(obj.y + 75)});
					}
					
					TweenLite.to(keyboard, 1, {y:1080});
					
				}
			}
		}
		
		private function BuildPickerListItemArray(pl:PickerList):Array
		{

			var items:Array = [];

			switch(pl)
			{
				case titlePicker:
				//	trace("titlePicker");
					items.push({ text: "<no preferred title>" });
					items.push({ text: "Dr." });
					items.push({ text: "Mr." });
					items.push({ text: "Mrs." });
					items.push({ text: "Ms." });
					items.fixed = true;
					break;
				case rolePicker:
				//	trace("rolePicker");
					items.push({ text: "PHYSICIAN" });
					items.push({ text: "RESEARCHER" });
					items.push({ text: "NURSE PRACTITIONER" });
					items.push({ text: "REGISTERED NURSE" });
					items.push({ text: "PHYSICIAN'S ASSISTANT" });
					items.push({ text: "OTHER" });
					items.fixed = false;
					break;
				case specialtyPicker:
				//	trace("specialtyPicker");
					items.push({ text: "LOREM IPSUM 1" });
					items.push({ text: "LOREM IPSUM 2" });
					items.push({ text: "LOREM IPSUM 3" });
					items.push({ text: "LOREM IPSUM 4" });
					items.push({ text: "LOREM IPSUM 5" });
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
			pl.addEventListener(starling.events.Event.CHANGE, PickerChangeHander);
			
			// screen position and appearence
			pl.width = 335;
			
			pl.x = _x;
			pl.y = _y;
			
			return pl;
		
		}
		
		private function PickerChangeHander(e:starling.events.Event):void
		{
			var pl:PickerList;
			
			if(e.target is PickerList)
			{
			
				pl = e.target as PickerList;
				trace( pl.selectedItem.text);
				
				// Should we enable the submit button?
				ToggleSubmit( TestFields() );
				
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
				
				if(!keyboardIsVisible)
				{
					ShowKeyboard();
				}
				
			}
			
		}
		
		private function BuildCheck(check:Check, _x:int, _y:int):Check
		{
			
			// CHECK BOXES
			check = new Check();
			
			check.defaultIcon = new Image(Assets.getTexture("Icon5"));
			
			check.defaultSelectedIcon = new Image(Assets.getTexture("Icon4"));
				
			check.isSelected = true;

			// focus manager goes here
			check.addEventListener(TouchEvent.TOUCH , HandleCheckTouch);
			
			// position and appearence
			check.x = _x;
			check.y = _y;

			return check;
			
		}
		
		private function HandleCheckTouch(e:TouchEvent):void
		{
			
		}
			
		private function BuildSubmitButton(btn:starling.display.Button, _x:int, _y:int):starling.display.Button
		{
			
			btn = new starling.display.Button(Assets.getTexture("ScreenFormBtnSubmit"),"",Assets.getTexture("ScreenFormBtnSubmit"));
			btn.x = _x;
			btn.y = _y;
			btn.disabledState = Assets.getTexture( "ScreenFormBtnSubmitDisabled" );
			
			btn.enabled = false;

			return btn;
			
		}
		
		private function HandleSubmitTouch(e:TouchEvent):void
		{
			var btn:starling.display.Button = e.currentTarget as starling.display.Button;
			
			var touch:Touch = e.getTouch(btn, starling.events.TouchPhase.BEGAN);
			if (touch)
			{
				if( TestFields() )
				{
					
					trace("HandleSubmitTouch PASSED validation test : TestFields");
					
					arrContactData = [];
					
					arrContactData = new Array(10)
					// mandatory and validated already
					trace("email1.text : " + email1.text);
					trace("email2.text : " + email2.text);
					
					arrContactData[0] = ( email1.text );
					
					trace("arrContactData[0] : " + arrContactData[0]);
					
					arrContactData[1] = ( firstName.text );
					arrContactData[2] = ( surName.text );
					
					// not validated, so check length first
					if(titlePicker.selectedItem != null)
					{
						arrContactData[3] = ( titlePicker.selectedItem.text );
					} else {
						arrContactData[3] = ( "null" );
					}
					
					if(institution.text.length > 0)
					{
						arrContactData[4] = ( institution.text );
					} else {
						arrContactData[4] = ( "null" );
					}
					
					if(rolePicker.selectedItem != null)
					{
						arrContactData[5] = ( rolePicker.selectedItem.text );
					} else {
						arrContactData[5] = ( "null" );
					}
					
					if(specialtyPicker.selectedItem != null)
					{
						arrContactData[6] = ( specialtyPicker.selectedItem.text );
					} else {
						arrContactData[6] = ( "null" );
					}
		
					
					// does not require validation
					arrContactData[7] = ( insight1.isSelected );
					arrContactData[8] = ( insight2.isSelected );
					arrContactData[9] = ( insight3.isSelected );
					arrContactData[10] = ( insight4.isSelected );
					
					PretendToSendHtml();
					
				} else {
					
					trace("HandleSubmitTouch FAILED validation test : TestFields");
					
				}
			}
		}
		
		
		private function ValidateName():Boolean
		{
			var foo:Boolean = false;
			
			trace("firstName.text : " + firstName.text);
			trace("surName.text : " + surName.text);
			
			if(firstName.text.length >= 1)
			{
				if(surName.text.length >= 1)
				{
					foo = true;
				} else {
					trace("Validation failed at step 2 of ValidateName");
				}
			} else {
				trace("Validation failed at step 1 of ValidateName");
			}
			
			return foo;
		}
		
		private function ValidateEmail():Boolean
		{
			var foo:Boolean = false;
			
			trace("email1.text : " + email1.text);
			trace("email2.text : " + email2.text);
			
			if(isValidEmail(email1.text) )
			{
				
				if(email1.text === email2.text)
				{
					trace("VALID EMAIL");
					foo = true;
				} else {
					trace("Validation failed at ValidateEmail, step 2");
				}

				
			} else {
				trace("Validation failed at ValidateEmail, step 1");
			}
			
			return foo;
		}		
		
		private function isValidEmail(email:String):Boolean {
			
			var emailExpression:RegExp = /([a-z0-9._-]+?)@([a-z0-9.-]+)\.([a-z]{2,4})/;
			return emailExpression.test(email);
			
		}
		
		private function TestFields():Boolean
		{
			var foo:Boolean = false;
			
			var fooName:Boolean = ValidateName();
			var fooEmail:Boolean = ValidateEmail();
			
			trace("  -- fooName : " + fooName);
			trace("  -- fooEmail : " + fooEmail);
			
			if( fooName == true && fooEmail == true )
			{

				foo = true;
				
			} 

			trace("TestFields returns : " + foo);
			return foo;
			
		}
		
		private function ToggleSubmit(valid:Boolean):void
		{
			
			if(valid)
			{
				trace("VALID");

				trace(" * DEBUG * EventListener not releasing or detecting properly on btnSubmit ");	
				
				trace("Adding event listener TOUCH to btnSubmit");
				btnSubmit.addEventListener(TouchEvent.TOUCH, HandleSubmitTouch);
				
				btnSubmit.enabled = true;
				
			} else {
				trace("INVALID");
				
				trace(" * DEBUG * EventListener not releasing or detecting properly on btnSubmit ");
				
				trace("Removing event listener TOUCH from btnSubmit");
				btnSubmit.removeEventListener(TouchEvent.TOUCH, HandleSubmitTouch);

				btnSubmit.enabled = false;
				
			}
			
			trace( ">> btnSubmit.hasEventListener( TouchEvent.TOUCH ) : " + btnSubmit.hasEventListener( TouchEvent.TOUCH ) );
			
		}
		
		// HTML Email on validated SUBMIT
		private function PretendToSendHtml():void
		{
			
		//	var request:URLRequest = new URLRequest('http://www.mynameiszak.com/sandbox/php/HtmlEmailScript.php');
		//	var request:URLRequest = new URLRequest('http://www.mynameiszak.com/sandbox/php/HtmlEmailScript2.php');
			var request:URLRequest = new URLRequest('http://www.mynameiszak.com/sandbox/php/HtmlEmailScript3.php');
			
			var variables:URLVariables = new URLVariables();
			
			variables.sender_email = 'mynameiszak@gmail.com';
			
			variables.email_address = arrContactData[0];
			variables.first_name = arrContactData[1];
			variables.last_name = arrContactData[2];
			
			variables.job_title = arrContactData[3];
			variables.institution_name = arrContactData[4];
			variables.role_name = arrContactData[5];
			variables.specialty_name = arrContactData[6];
			
			variables.insight1_bool = arrContactData[7];
			variables.insight2_bool = arrContactData[8];
			variables.insight3_bool = arrContactData[9];
			variables.insight4_bool = arrContactData[10];
			
			request.data = variables;
			request.method = URLRequestMethod.POST;
	
			trace("EMAIL.REQUEST : " + request );
			trace("  DATA: " + request.data );
			trace("  METHOD : " + request.method );

			var loader:URLLoader = new URLLoader();
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.addEventListener(flash.events.Event.COMPLETE, handleSubmitComplete);
			loader.load(request);
			
		}
		
		private function CallSecondHTML():void
		{
			
			trace("CallSecondHTML fired.");
			
			var request:URLRequest = new URLRequest('http://www.mynameiszak.com/sandbox/php/add_rowgs.php');
			
			var variables:URLVariables = new URLVariables();
			
			variables.sender_email = 'mynameiszak@gmail.com';
			
			variables.email_address = arrContactData[0];
			variables.first_name = arrContactData[1];
			variables.last_name = arrContactData[2];
			
			variables.job_title = arrContactData[3];
			variables.institution_name = arrContactData[4];
			variables.role_name = arrContactData[5];
			variables.specialty_name = arrContactData[6];
			
			variables.insight1_bool = arrContactData[7];
			variables.insight2_bool = arrContactData[8];
			variables.insight3_bool = arrContactData[9];
			variables.insight4_bool = arrContactData[10];
			
			request.data = variables;
			request.method = URLRequestMethod.POST;
			
			trace("EMAIL.REQUEST : " + request );
			trace("  DATA: " + request.data );
			trace("  METHOD : " + request.method );
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.addEventListener(flash.events.Event.COMPLETE, handleSubmitComplete2);
			loader.load(request);
			
		}
		
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
			
			trace('vars.SenderEmail: '+vars.SenderEmail);
			trace('vars.EmailAddress: '+vars.EmailAddress);
			trace('vars.FirstName: '+vars.FirstName);
			trace('vars.LastName: '+vars.LastName);
			trace('vars.JobTitle: ' + vars.JobTitle);
			trace('vars.InstitutionName: ' + vars.InstitutionName);
			trace('vars.RoleName: ' + vars.RoleName);
			trace('vars.SpecialtyName: ' + vars.SpecialtyName);
			trace('vars.Insight1: ' + vars.Insight1);
			trace('vars.Insight2: ' + vars.Insight2);
			trace('vars.Insight3: ' + vars.Insight3);
			trace('vars.Insight4: ' + vars.Insight4);
			
			CallSecondHTML();

		}
		
		private function handleSubmitComplete2(e:flash.events.Event):void {
			
			var loader:URLLoader = URLLoader(e.target);
			var vars:URLVariables = new URLVariables(loader.data);
			
			trace('vars.SenderEmail: '+vars.SenderEmail);
			trace('vars.EmailAddress: '+vars.EmailAddress);
			trace('vars.FirstName: '+vars.FirstName);
			trace('vars.LastName: '+vars.LastName);
			trace('vars.JobTitle: ' + vars.JobTitle);
			trace('vars.InstitutionName: ' + vars.InstitutionName);
			trace('vars.RoleName: ' + vars.RoleName);
			trace('vars.SpecialtyName: ' + vars.SpecialtyName);
			trace('vars.Insight1: ' + vars.Insight1);
			trace('vars.Insight2: ' + vars.Insight2);
			trace('vars.Insight3: ' + vars.Insight3);
			trace('vars.Insight4: ' + vars.Insight4);
			
			StoreDataLocally();
			
			if(this.parent is ScreenRegister)
			{
				var screenreg:ScreenRegister = this.parent as ScreenRegister;
				
				screenreg.ChangeFormBG();
				
			}	
			
		}

		protected function HTTPReport(e:HTTPStatusEvent):void
		{
			
			trace(e);
		}
		
		protected function ioErrorHandler(e:IOErrorEvent):void
		{
			
			trace(e);
			
		}
		
		private function StoreDataLocally():void
		{
			
			trace("ADD CODE HERE TO STORE DATA LOCALLY");
			
			
			//  onComplete, call clean up to clear the array of contact data
			CleanUp();
			
			
			
		}
		
		public function CleanUp():void
		{
			arrContactData = [];
			
			trace("ADD CODE HERE TO FIRE THIS DATA CLEAR ONCOMPLETE");
		}
	}
}