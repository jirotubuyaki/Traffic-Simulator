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
	
	public class Button4 extends Sprite{
		[Embed(source='./images/button3.swf')]
		public var button_anime:Class;
		
		[Embed(source='./images/play_back.swf')]
		public var play_anime:Class;
		
		public var mouse:String ="stop";
		public var main:Main2;
		public var movie:MovieClip;
		public var movie_up:MovieClip;
		public var movie_play:MovieClip;
		
		public var count:int=0;
		
		public var start_x:Number;
		public var start_y:Number;

		public var angle:int;
		public var angle_move:Number;
		
		public var f:Number;
		public var f_before:Number
		public var scale:Number;
		public var view:Number;
		
		public var V_x:Number = 1;
		public var V_y:Number = 1;
		
		public var x_in:Number;
		public var y_in:Number;
		
		public var x_unit:Number;
		public var y_unit:Number;
		
		public var current_point_x:Number;
		public var current_point_y:Number;
		public var i:int=0;
		public var j:int=0;
		public var o:int=0;
		public var state:String ="start";
		
		public var scale_state:String = "+";
		public var angle_state:String = "+";
		public var move_state:String = "+";

		public var t:int=1;
		public var s:int=1;

		public var t_memory:int = 7;
		public var t_state:int = 1;
		
		public var move_x:Number=0;
		public var move_y:Number=0;

		public var before_x_in:Number=0;
		public var before_y_in:Number=0;
		
		public var move_center_x:Number=0;
		public var move_center_y:Number=0;
		
		public var move_point_x:Number=0;
		public var move_point_y:Number=0;
		
		public var center_x:Number;
		public var center_y:Number;
		
		public var scale_center_x:Number;
		public var scale_center_y:Number;
		
		public var rotation_center_x:Number;
		public var rotation_center_y:Number;
		
		public var distance:Number;
		
		public var f_font:Number=1;
		
		public var text_obj:Text2;
		public var word:String;
		public var street:Street;
		public function Button4(start_x:Number,start_y:Number,main_input:Main2){		
		  	main = main_input;
		  	
			movie = new button_anime();
			movie_up = new button_anime();
			
			main.addChildAt(movie,main.numChildren);
			center_x = start_x;
			center_y = start_y;
  			scale = 0.1;
  			angle = 5;
  			f = 250;
  			f_before = f;
  			view = 50;
  			
  			angle_move = 17;
			movie.x = start_x;
			movie.y = start_y;

			movie.scaleX = view/f;
			movie.scaleY = view/f;
			
			movie_up.x = start_x;
			movie_up.y = start_y;
			
			movie_up.scaleX = view/f;
			movie_up.scaleY = view/f;
			
			x_in = movie.x * f / view;
			y_in = movie.y * f / view;
			
			current_point_x = center_x * f/view;
			current_point_y = center_y * f/view;
			
  			scale_center_x = center_x * f/view;
  			scale_center_y = center_y * f/view;
  			
  			rotation_center_x = center_x * f/view;
  			rotation_center_y = center_y * f/view;
  			
			distance = Math.sqrt((x_in)*(x_in)+(y_in)*(y_in));
					
			x_unit = x_in/distance;
			y_unit = y_in/distance;
			
			
			word = "NEXT";
			text_obj = new Text2(word,main,this);
			text_obj.url_input = "";
			text_obj.text_width = 50;
			text_obj.text_height = 50;
			text_obj.text_color = 0xffffff;
			text_obj.text_size = 19;
			text_obj.text_x = start_x-15;
			text_obj.text_y = start_y-6;
			
			main.addChildAt(movie_up,main.numChildren);
			movie_up.alpha = 0;
			
   			movie_up.addEventListener(Event.ENTER_FRAME,act);
		}
		public function act(e:Event):void{
			switch(state){
				case "start":
					if(t >=t_memory){
						t_memory = 7;
						state = "stop";
						movie_up.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
						movie_up.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
						movie_up.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
						movie_up.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
						
					}
					scale_state = "+";
					angle_state = "-";

					Scale();
					t = t+ 1;
					break;
				case "over":
					if(t >=t_memory){
						t_memory = 7;
						state = "stop";
					}
					scale_state = "+";
					angle_state = "-";
					move_state = "+";
					text_obj.ChangeWord("GOGO");
					t = t+ 1;
					t_state = t_state + 1;
					
					break;
				case "out":
					if(t >=t_memory){
						t_memory = 7;
						state = "stop";
					}
					scale_state = "-";
					angle_state = "+";
					move_state = "-";
					text_obj.ChangeWord("NEXT");

					t = t+ 1;
					t_state = t_state - 1;
					break;
				case "down":
					if(s < 3){
						scale_state = "-";
						angle_state = "+";
						Scale();
					}
					else{
						scale_state = "+";
						angle_state = "-";
						Scale();
					}
					if(s ==4){
						text_obj.ChangeWord("START");
						state = "stop";
						t = 1;
					}
					if(t == 2){
						t = 1;
					}
					else{
						t = t + 1;
					}
					s = s + 1;
					break;
				case "stop":
					break;
			}
		}
		public function Move():void{
			move_point_x = 40;
			move_point_y = 0 ;
			
			if(move_state == "+"){
				move_x = (-100/203 * t * t + 4900/203) *move_point_x / 100;
				move_y = (-100/203 * t * t + 4900/203) *move_point_y / 100;
			}
			else if(move_state == "-"){
				move_x = (100/203 * t * t - 4900/203) *move_point_x / 100;
				move_y = (100/203 * t * t - 4900/203) *move_point_y / 100;
			}
			
			movie.x = movie.x +view/f*move_x;
			movie.y = movie.y +view/f*move_y;
			
			movie_up.x = movie_up.x +view/f*move_x;
			movie_up.y = movie_up.y +view/f*move_y;
				
			x_in = x_in+ move_x;
			y_in = y_in+ move_y;
			
			text_obj.ChangePosition(view/f*move_x,view/f*move_y);
			text_obj.movie.x = text_obj.movie.x + view/f*move_x;
			text_obj.movie.y = text_obj.movie.y + view/f*move_y;

		}
		public function Rotation():void{
			if(angle_state == "+"){
				angle = (-100/203 * t * t + 4900/203) *angle_move / 100;
			}
			else if(angle_state == "-"){
				angle = (100/203 * t * t - 4900/203) *angle_move / 100;
			}
			movie.rotation = movie.rotation + angle;
			movie.rotation = movie.rotation + angle;
			
			movie_up.rotation = movie_up.rotation + angle;
			movie_up.rotation = movie_up.rotation + angle;
			

		}
		public function Scale():void{
			if(scale_state == "+"){
				scale = (-100/203 * t * t + 4900/203)*1.001;

			}
			else if(scale_state == "-"){
				scale = (100/203 * t * t - 4900/203)*1.001;

			}
			f = f - scale;

			x_in = x_in -scale_center_x;
			y_in = y_in -scale_center_y;
			movie.x = x_in * view/f + scale_center_x * view/f_before;
			movie.y = y_in * view/f + scale_center_y * view/f_before;
			movie_up.x = x_in * view/f + scale_center_x * view/f_before;
			movie_up.y = y_in * view/f + scale_center_y * view/f_before;
			x_in = x_in+ scale_center_x;
			y_in = y_in+ scale_center_y;
		

			movie.scaleX = view / f;
			movie.scaleY = view / f;

			movie_up.scaleX = view / f;
			movie_up.scaleY = view / f;
			
			
		}
		public function mouseDownHandler(evt:MouseEvent):void{

		}
		public function mouseUpHandler(evt:MouseEvent):void{
			text_obj.ChangeWord("START");
			t = 1;
			s = 1;
			state = "down";
			main.play_flag = "on";
			for(i=0;i<main.car_obj.length;i=0){
				main.removeChild(main.car_obj[0].movie);
				main.car_obj.shift();

			}
			for(i=0;i<main.button_obj.length;i=0){
				main.removeChild(main.button_obj[0].movie_up);
				main.removeChild(main.button_obj[0].movie);
				main.removeChild(main.button_obj[0].text_obj.text_field);
				main.removeChild(main.button_obj[0].text_obj.movie);

				main.button_obj.shift();

			}
			for(i=0;i<main.button2_obj.length;i=0){
				main.removeChild(main.button2_obj[0].button.movie_up);
				main.removeChild(main.button2_obj[0].button.movie);
				main.removeChild(main.button2_obj[0].point_movie);
				main.removeChild(main.button2_obj[0].button.text_obj.text_field);
				main.removeChild(main.button2_obj[0].button.text_obj.movie);

				main.button2_obj.shift();

			}
			for(i=0;i<main.signal_street.length;i=0){
				main.signal_street.shift();
				main.signal_street_back.shift();
			}
			for(i=0;i<main.signal_x.length;i=0){
				main.signal_x.shift();
				main.signal_y.shift();
			}
			for(i=0;i<main.point_start_x.length;i=0){
				main.point_start_x.shift();
				main.point_start_y.shift();
				main.point_end_x.shift();
				main.point_end_y.shift();
				
				main.point_start_x_back.shift();
				main.point_start_y_back.shift();
				main.point_end_x_back.shift();
				main.point_end_y_back.shift();
			}
			for(i=0;i<main.street_obj.length;i=0){
				main.street_obj.shift();
				main.street_back_obj.shift();
			}
			for(i=0;i<main.signal_point_x_add.length;i=0){
				main.signal_point_x_add.shift();
				main.signal_point_y_add.shift();
			}
			for(i=0;i<main.line_obj.length;i=0){
				main.removeChild(main.line_obj[0]);
				main.line_obj.shift();

			}
			for(o=0;o<main.cross_street.length;o=0){
				main.cross_street.shift();
			}
			for(o=0;o<main.cross_street_turn.length;o=0){
				main.cross_street_turn.shift();
			}
			for(o=0;o<main.cross_street_delete.length;o=0){
				main.cross_street_delete.shift();
			}
			for(o=0;o<main.distance_P_obj.length;o=0){
				main.distance_P_obj.shift();
			}
			for(o=0;o<main.P_x.length;o=0){
				main.P_x.shift();
				main.P_y.shift();
			}
			for(o=0;o<main.signal_obj.length;o=0){
				main.signal_obj.shift();
			}
			for(o=0;o<main.cross_point_start_x.length;o=0){
				main.cross_point_start_x.shift();
				main.cross_point_end_x.shift();
				main.cross_point_start_y.shift();
				main.cross_point_end_y.shift();
			}
			for(o=0;o<main.button_street.length;o=0){
				main.button_street.shift();
			}

		}
		public function mouseOverHandler(evt:MouseEvent):void{
			if(state != "over"){
				current_point_x = x_in;
				current_point_y = y_in;
				before_x_in = x_in;
				before_y_in = y_in;
				
				state = "over";
				t_memory = 7-t_state;
				t = 1;
				
			}
		}

		public function mouseOutHandler(evt:MouseEvent):void{
			if(state != "out"){
				current_point_x = x_in;
				current_point_y = y_in;
				t_memory =  t_state-1;
				state = "out";
				t = 1;
			}
		}
	}
}