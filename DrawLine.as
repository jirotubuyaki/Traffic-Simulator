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

	public class DrawLine extends Sprite {
		[Embed(source='./images/CarAdd.swf')]
		public var add_anime:Class;
		public var movie:MovieClip;
  		
  		public var start_x:Number;
  		public var start_y:Number;
  		public var end_x:Number;
  		public var end_y:Number;
  		  		
		public var main:Main2;
		public var line:Sprite
		public var line_up:Sprite

		public var button:Button1;
		public var street:Street;
		public var state:String = "off";
		public function DrawLine(main_input:Main2){
			
			main = main_input;
			line = new Sprite();
			
			line.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			line.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
			line.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);

			line.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			line.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
		}
		private function mouseDownHandler(evt:MouseEvent):void{
		}
		private function mouseUpHandler(evt:MouseEvent):void{


		}
		private function mouseMoveHandler(evt:MouseEvent):void{
		}
		private function mouseOverHandler(evt:MouseEvent):void{

		}
		private function mouseOutHandler(evt:MouseEvent):void{

		}
		public function Line(x0:Number,y0:Number,x1:Number,y1:Number):Sprite{
			start_x = x0;
			start_y = y0;
			end_x = x1;
			end_y = y1;
			line.graphics.clear();
			line.graphics.lineStyle(20,0xe7e7e7);
			line.graphics.moveTo(x0,y0);
			line.graphics.lineTo(x1,y1);
			return line;
			
		}

	}
}