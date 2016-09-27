package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.geom.*;
	import flash.media.*;
	import flash.media.Sound; 
	import flash.media.SoundChannel;
	import flash.text.*;
	import flash.net.*;


	public class Text2 extends Sprite { 

		[Embed(source='./fonts/visitor2.ttf', fontName='visitor', mimeType='application/x-font',embedAsCFF='false')] 	
		//[Embed(source='visitor2.ttf', fontName='visitor', mimeType='application/x-font')] 
		private var embedFont:Class;

		[Embed(source='./images/back.swf')]
		public var back_anime:Class;	
		public var movie:MovieClip;
		public var text_width:int=0;
		public var text_height:int=0;
		public var text_size:int=0;
		public var text_color:int =0x000000;
		public var text_x:int = 0;
		public var text_y:int = 0;
		public var moji:Array = new Array();
		public var change_moji:Array = new Array();
		public var word:String;
		public var display_word:String="";
		public var i:int=0;
		public var j:int=0;
		public var z_z:int = 0;
		public var i_state:Array = new Array();
		public var parent_obj:Object;
		public var text_field:TextField;
		public var word_number:int = 1;
		public var url_input:String="";
		public var main:Main2;
		public var format:TextFormat;
		
		public function Text2(word_input:String,main_input:Main2,parent_input:Object){
			main = main_input;
			
			movie = new back_anime();
			word = word_input;
			parent_obj = parent_input;
			
			for(i=0;i<word.length;i++){
				i_state[i] = "go";
			}
			for(i=0;i<=word.length;i++){
				moji[i] = "";
			}
			change_moji[0] = "A";
			change_moji[1] = "B";
			change_moji[2] = "C";
			change_moji[3] = "D";
			change_moji[4] = "E";
			change_moji[5] = "F";
			change_moji[6] = "G";
			change_moji[7] = "H";
			change_moji[8] = "I";
			change_moji[9] = "J";
			change_moji[10] = "K";
			change_moji[11] = "L";
			change_moji[12] = "M";
			change_moji[13] = "N";
			change_moji[14] = "O";
			change_moji[15] = "P";
			change_moji[16] = "Q";
			change_moji[17] = "R";
			change_moji[18] = "S";
			change_moji[19] = "T";
			change_moji[20] = "U";
			change_moji[21] = "V";
			change_moji[22] = "W";
			change_moji[23] = "X";
			change_moji[24] = "Y";
			change_moji[25] = "Z";
		
			var format:TextFormat = new TextFormat();
			format.font  = "visitor";
			format.size  = text_size;
			text_field = new TextField();
			text_field.autoSize = TextFieldAutoSize.LEFT;
			text_field.textColor= text_color;
			text_field.border = false;
			text_field.x = text_x;
			text_field.y = text_y;
			text_field.width  = text_width;
			text_field.height = text_height;
			text_field.antiAliasType = AntiAliasType.ADVANCED;
			text_field.sharpness =400;
			text_field.thickness =-50;
			text_field.embedFonts = true;
			text_field.text = "";
			text_field.setTextFormat(format);
			
			movie.x = text_x;
			movie.y = text_y;
			movie.width = text_width;
			movie.height = text_height;
			
			main.addChildAt(text_field,main.numChildren);
			main.addChildAt(movie,main.numChildren);
			
			movie.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			movie.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
			movie.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			movie.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
			this.addEventListener(Event.ENTER_FRAME,act);
			SoundMixer.soundTransform = new SoundTransform(0.06,0);
		}
		private function mouseDownHandler(evt:MouseEvent):void{
			var url_navi:URLRequest = new URLRequest();
			url_navi.url = url_input;
			if(word == "BLOG"){
				navigateToURL(url_navi,"_blank");

			}
			else{
				navigateToURL(url_navi,"center");
			}
		}
		private function mouseUpHandler(evt:MouseEvent):void{

		}
		private function mouseOverHandler(evt:MouseEvent):void{
			text_color = 0xffffff;
			for(i=0;i<word.length;i++){
				i_state[i] = "go";
			}
			j = 0;

		}
		private function mouseOutHandler(evt:MouseEvent):void{

			text_color = 0xffffff;
			for(i=0;i<word.length;i++){
				i_state[i] = "go";
			}
			j = 0;


		}
		public function act(e:Event):void{
			if(j < 26){
				main.removeChild(text_field);
				main.removeChild(movie);
				Change();
				Display();
				main.addChildAt(text_field,main.numChildren);
				main.addChildAt(movie,main.numChildren);
				main.swapChildren(movie,parent_obj.movie_up);
				display_word = "";
				j++;
			}
		}
		public function Change():void{
			for(i=0;i<word.length;i++){
				if(i_state[i] != "stop"){
					if(word.charAt(i) == change_moji[j]){
						moji[i] = change_moji[j];
						i_state[i] = "stop";
					}
					else{
						moji[i] = change_moji[j];
					}
				}
			}
		}
		public function ChangePosition(position_x:Number,position_y:Number):void{
			text_field.x = text_field.x + position_x;
			text_field.y = text_field.y + position_y;
		}
		public function ChangeWord(word_input:String):void{
		
			for(i=0;i<word.length;i++){
				i_state[i] = "go";
			}
			j = 0;
			word = word_input;
		}
		public function ChangeSize(font_size:Number):void{
			format.size = font_size;
		}
		public function Display():void{
			for(i=0;i<word.length;i++){
				display_word = display_word + String(moji[i]);
			}
			var format:TextFormat = new TextFormat();
			format.font  = "visitor";
			format.size  = text_size;
			text_field = new TextField();
			text_field.autoSize = TextFieldAutoSize.LEFT;
			text_field.textColor= text_color;
			text_field.border = false;
			text_field.x = text_x;
			text_field.y = text_y;
			text_field.width  = text_width;
			text_field.height = text_height;
			text_field.antiAliasType = AntiAliasType.ADVANCED;
			text_field.sharpness =400;
			text_field.thickness =-50;
			text_field.embedFonts = true;
			text_field.text = display_word;
			text_field.setTextFormat(format);
			
			movie.x = text_x;
			movie.y = text_y;
			movie.width = text_width;
			movie.height = text_height;
		}
	}
}