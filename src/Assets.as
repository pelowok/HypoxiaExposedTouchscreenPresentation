package
{
	import starling.textures.Texture;
	import flash.utils.Dictionary;
	import flash.display.Bitmap;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		// Fonts
		[Embed(source="../assets/fonts/HELVETICANEUELTPRO-HV.OTF", fontFamily = "Helvetica", mimeType = "application/x-font", embedAsCFF="false")]
		public static const HelveticaHeavy:Class;
		
		// Assets for all screens
		[Embed(source="../assets/bg/mainBG.jpg")]
		public static const MainBG:Class;
		
		[Embed(source="../assets/footerscreen/footer.png")]
		public static const Footer:Class;
		
		[Embed(source="../assets/bg/hitscreen.png")]
		public static const HitScreen:Class;
		
		// Home screen assets
		[Embed(source="../assets/homescreen/HypoxiaExposedLogo.png")]
		public static const HypoxiaExposedLogo:Class;
		
		[Embed(source="../assets/homescreen/SeeWhatsLurking.png")]
		public static const SeeWhatsLurking:Class;
		
		[Embed(source="../assets/homescreen/TapToBegin.png")]
		public static const TapToBegin:Class;
		
		// Assets for Main Menu
		[Embed(source="../assets/mainmenuscreen/button01.png")]
		public static const MainButton01a:Class;
		
		[Embed(source="../assets/mainmenuscreen/button01tap.png")]
		public static const MainButton01b:Class;
		
		[Embed(source="../assets/mainmenuscreen/button02.png")]
		public static const MainButton02a:Class;
		
		[Embed(source="../assets/mainmenuscreen/button02tap.png")]
		public static const MainButton02b:Class;
		
		// Assets for 1.0 Tumor Hypoxia
		[Embed(source="../assets/1-0_tumor/1-0bg.png")]
		public static const Screen10BG:Class;
		
		[Embed(source="../assets/1-0_tumor/1-0ref.png")]
		public static const Screen10Ref:Class;
		
		[Embed(source="../assets/1-0_tumor/navPop1a.png")]
		public static const Screen10Nav1a:Class;
		
		[Embed(source="../assets/1-0_tumor/navPop1b.png")]
		public static const Screen10Nav1b:Class;
		
		[Embed(source="../assets/1-0_tumor/navPop2a.png")]
		public static const Screen10Nav2a:Class;
		
		[Embed(source="../assets/1-0_tumor/navPop2b.png")]
		public static const Screen10Nav2b:Class;
		
		[Embed(source="../assets/1-0_tumor/navPop3a.png")]
		public static const Screen10Nav3a:Class;
		
		[Embed(source="../assets/1-0_tumor/navPop3b.png")]
		public static const Screen10Nav3b:Class;
		
		// Assets for 1.1
		[Embed(source="../assets/1-1_lethal/1-1bg.png")]
		public static const Screen11BG:Class;
		
		[Embed(source="../assets/1-1_lethal/1-1ref.png")]
		public static const Screen11Ref:Class;
		
		[Embed(source="../assets/1-1_lethal/innerNav1.png")]
		public static const Screen11InnerNav1:Class;
		
		[Embed(source="../assets/1-1_lethal/innerNav2.png")]
		public static const Screen11InnerNav2:Class;
		
		[Embed(source="../assets/1-1_lethal/pop1.png")]
		public static const Screen11NavPop1:Class;
		
		[Embed(source="../assets/1-1_lethal/pop2.png")]
		public static const Screen11NavPop2:Class;
		
	//	[Embed(source="../assets/1-1_lethal/videoImg.png")]
	//	public static const Screen11VideoImg:Class;
		
		[Embed(source="../assets/1-1_lethal/playVideo.png")]
		public static const Screen11PlayVideo:Class;
		
		// Assets for 1.2
		[Embed(source="../assets/1-2_pervasive/1-2bg.png")]
		public static const Screen12BG:Class;
		
		[Embed(source="../assets/1-2_pervasive/bgPersist.png")]
		public static const Screen12Chart:Class;
		
		[Embed(source="../assets/1-2_pervasive/whiteBox.png")]
		public static const WhiteBox:Class;
		
		[Embed(source="../assets/1-2_pervasive/1-2ref.png")]
		public static const Screen12Ref:Class;
		
		[Embed(source="../assets/1-2_pervasive/innerNav1.png")]
		public static const Screen12InnerNav1:Class;
		
		[Embed(source="../assets/1-2_pervasive/innerNav2.png")]
		public static const Screen12InnerNav2:Class;
		
		[Embed(source="../assets/1-2_pervasive/pop1.png")]
		public static const Screen12NavPop1:Class;
		
		[Embed(source="../assets/1-2_pervasive/pop2.png")]
		public static const Screen12NavPop2:Class;
		
		[Embed(source="../assets/1-2_pervasive/returnHome.png")]
		public static const ReturnHome:Class;
		
		// Assets for 2.0
		[Embed(source="../assets/2-0_insights/2-0bg.png")]
		public static const Screen20BG:Class;
		
		[Embed(source="../assets/2-0_insights/ref1.png")]
		public static const Screen20Ref1:Class;
		
		[Embed(source="../assets/2-0_insights/ref2.png")]
		public static const Screen20Ref2:Class;
		
		[Embed(source="../assets/2-0_insights/ref3.png")]
		public static const Screen20Ref3:Class;
		
		[Embed(source="../assets/2-0_insights/ref4.png")]
		public static const Screen20Ref4:Class;
		
		[Embed(source="../assets/2-0_insights/navPop1a.png")]
		public static const Screen20Nav1a:Class;
		
		[Embed(source="../assets/2-0_insights/navPop1b.png")]
		public static const Screen20Nav1b:Class;
		
		[Embed(source="../assets/2-0_insights/navPop2a.png")]
		public static const Screen20Nav2a:Class;
		
		[Embed(source="../assets/2-0_insights/navPop2b.png")]
		public static const Screen20Nav2b:Class;
		
		[Embed(source="../assets/2-0_insights/navPop3a.png")]
		public static const Screen20Nav3a:Class;
		
		[Embed(source="../assets/2-0_insights/navPop3b.png")]
		public static const Screen20Nav3b:Class;
		
		[Embed(source="../assets/2-0_insights/navPop4a.png")]
		public static const Screen20Nav4a:Class;
		
		[Embed(source="../assets/2-0_insights/navPop4b.png")]
		public static const Screen20Nav4b:Class;
		
		[Embed(source="../assets/2-0_insights/btnRef.png")]
		public static const Screen20BtnRef:Class;
		
		[Embed(source="../assets/2-0_insights/btnSend.png")]
		public static const Screen20BtnSend:Class;
		
		// Assets for form
		[Embed(source="../assets/form/formBG1.png")]
		public static const ScreenFormBG1:Class;
		
		[Embed(source="../assets/form/formBG2.png")]
		public static const ScreenFormBG2:Class;
		
		[Embed(source="../assets/form/btnReturn.png")]
		public static const ScreenFormBtnReturn:Class;
		
		[Embed(source="../assets/form/screenRegBtnSubmit1.png")]
		public static const ScreenFormBtnSubmit1:Class;
		
		[Embed(source="../assets/form/screenRegBtnSubmit2.png")]
		public static const ScreenFormBtnSubmit2:Class;
		
		[Embed(source="../assets/form/btnSubmitDisabled.png")]
		public static const ScreenFormBtnSubmitDisabled:Class;
		
		[Embed(source="../assets/form/screenRegBtnReset1.png")]
		public static const ScreenFormBtnReset1:Class;
		
		[Embed(source="../assets/form/screenRegBtnReset2.png")]
		public static const ScreenFormBtnReset2:Class;
		
		[Embed(source="../assets/form/downIcon.png")]
		public static const DownIcon:Class;
		
		[Embed(source="../assets/form/PinkBox.png")]
		public static const PinkBox:Class;
		
		[Embed(source="../assets/form/GreenBox.png")]
		public static const GreenBox:Class;
		
		[Embed(source="../assets/form/PinkFrame.png")]
		public static const PinkFrame:Class;
		
		[Embed(source="../assets/form/icon4.png")]
		public static const Icon4:Class;
		
		[Embed(source="../assets/form/icon5.png")]
		public static const Icon5:Class;
		
		// Assets for nav
		[Embed(source="../assets/nav/navNext.png")]
		public static const NavNext:Class;
		
		[Embed(source="../assets/nav/navPrev.png")]
		public static const NavPrev:Class;
	
		[Embed(source="../assets/nav/sideNav1.png")]
		public static const SideNav1a:Class;

		[Embed(source="../assets/nav/sideNav1tap.png")]
		public static const SideNav1b:Class;
		
		[Embed(source="../assets/nav/sideNav2.png")]
		public static const SideNav2a:Class;
		
		[Embed(source="../assets/nav/sideNav2tap.png")]
		public static const SideNav2b:Class;
		
		[Embed(source="../assets/nav/sideNav3.png")]
		public static const SideNav3a:Class;
		
		[Embed(source="../assets/nav/sideNav3tap.png")]
		public static const SideNav3b:Class;
		
		[Embed(source="../assets/nav/subNav.png")]
		public static const SubNava:Class;
		
		[Embed(source="../assets/nav/subNavtap.png")]
		public static const SubNavb:Class;
		
	//	[Embed(source="../assets/grid.png")]
	//	public static const GridOverlay:Class;
		


		public static var gameScreens:Array = new Array();
		private static var gameTextures:Dictionary = new Dictionary();	
		
		public static var globalReturnScreenID:String;
		
		public static function getTexture(name:String):Texture
		{
			
			if (gameTextures[name] == undefined)
			{
				
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);

			}
			
			return gameTextures[name];
			
		}
		
		public static function getAtlas(name:String):TextureAtlas
		{
			
			if (gameTextures[name] == undefined)
			{
				
				var str:String = name + "_xml";
				var tex:Texture = Texture.fromEmbeddedAsset(new Assets[( str )]() );
				var xml:XML = new XML(new Assets[(name + "_png")]() );
				
				gameTextures[name] = new TextureAtlas(tex, xml);
				
			}
			
			return gameTextures[name];
			
		}
	}
}