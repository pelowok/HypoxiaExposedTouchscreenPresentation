package
{
	import starling.textures.Texture;
	import flash.utils.Dictionary;
	import flash.display.Bitmap;

	public class Assets
	{
		[Embed(source="../assets/bg/mainBG.jpg")]
		public static const MainBG:Class;
		
		[Embed(source="../assets/footerscreen/footer.png")]
		public static const Footer:Class;
		
		[Embed(source="../assets/homescreen/HypoxiaExposedLogo.png")]
		public static const HypoxiaExposedLogo:Class;
		
		[Embed(source="../assets/homescreen/SeeWhatsLurking.png")]
		public static const SeeWhatsLurking:Class;
		
		[Embed(source="../assets/homescreen/TapToBegin.png")]
		public static const TapToBegin:Class;
		
		[Embed(source="../assets/mainmenuscreen/button01.png")]
		public static const MainButton01a:Class;
		
		[Embed(source="../assets/mainmenuscreen/button01tap.png")]
		public static const MainButton01b:Class;
		
		[Embed(source="../assets/mainmenuscreen/button02.png")]
		public static const MainButton02a:Class;
		
		[Embed(source="../assets/mainmenuscreen/button02tap.png")]
		public static const MainButton02b:Class;

		
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