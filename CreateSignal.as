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

	public class CreateSignal extends Sprite {
		[Embed(source='./images/SignalPoint.swf')]
		public var point_anime:Class;	
		public var movie:MovieClip;
		public var point_movie:MovieClip;	
		public var start_x:Number;
		public var start_y:Number;
		public var end_x:Number;
		public var end_y:Number;
		public var main:Main2;
		public var point_x:Number;
		public var point_y:Number;
		public var button:Button2;
		public var state:String = "off";
		public var street:Street;
		public function CreateSignal(point_x_input:Number,point_y_input:Number,main_input:Main2,street_input:Street){
			main = main_input;
			street = street_input;
			main = main_input;
			point_movie = new point_anime();
			point_x = point_x_input;
			point_y = point_y_input;
			point_movie.x = point_x;
			point_movie.y = point_y;
			point_movie.alpha = 0.6;
			main.addChildAt(point_movie,main.line_obj.length);
			button = new Button2(point_x+40,point_y,main,this,street);
			
			point_movie.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			point_movie.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
			point_movie.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);

			point_movie.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			point_movie.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
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
	}
}