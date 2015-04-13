package
{
	import starling.textures.Texture;
	import flash.utils.Dictionary;
	import flash.display.Bitmap;

	public class Assets
	{
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
		
		
		// Assets for 1.2
		
		
		// Assets for 2.0
		
		
		// Assets for form
		
		
		// Assets for nav
		[Embed(source="../assets/nav/navNext.png")]
		public static const NavNext:Class;
	/*	
		[Embed(source="../assets/nav/navPrev.png")]
		public static const NavPrev:Class;
	*/
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
		
		
		public static var gameScreens:Array = new Array();
		private static var gameTextures:Dictionary = new Dictionary();	
		
		public static function getTexture(name:String):Texture
		{
			
			if (gameTextures[name] == undefined)
			{
				
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
				
			}
			
			return gameTextures[name];
			
		}
		
		
	}
}