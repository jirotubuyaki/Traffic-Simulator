package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.text.*;

	public class Text extends Sprite { 
		[Embed(source='./fonts/visitor2.ttf', fontName='visitor', mimeType='application/x-font',embedAsCFF='false')] 
		//[Embed(source='visitor2.ttf', fontName='visitor', mimeType='application/x-font')] 
		private var embedFont:Class;
		
		public var moji:Array = new Array();
		public var change_moji:Array = new Array();
		public var word:String;
		public var display_word:String;
		public var i:int=0;
		public var j:int=0;
		public var z_z:int = 0;
		public var i_state:Array = new Array();
		public var parent_obj:Object;
		public var text_field:TextField;
		public var word_number:int = 1;
		public var main:Main2;
		public var text_width:int;
		public var text_height:int;
		public var text_x:int;
		public var text_y:int;
		public var text_size:int;
		public var text_color:int;
		public function Text(word_input:String,main_input:Main2,parent_input:Object){
			main = main_input;
			word = word_input;
			parent_obj = parent_input;
			
			for(i=0;i<word.length;i++){
				i_state[i] = "go";
			}
			for(i=0;i<word.length;i++){
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
			text_field.text = word;
			text_field.setTextFormat(format);
			
			main.addChild(text_field);
			this.addEventListener(Event.ENTER_FRAME,act);
		}
		public function act(e:Event):void{
			if(word_number <= word.length){
				main.removeChild(text_field);
				Change();
				Display();
				main.addChild(text_field);
				display_word = "";
				j++;
			}
		}
		public function Change():void{
			for(i=0;i<word_number;i++){
				if(i_state[i] != "stop"){
					if(word.charAt(i) == change_moji[j]){
						moji[i] = change_moji[j];
						i_state[i] = "stop";
						word_number++;
						j=0;
					}
					else{
						moji[i] = change_moji[j];
					}
				}
			}
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
		}
	}
}