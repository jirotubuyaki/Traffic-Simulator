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
	
    public class Button1 extends Sprite{
  		
        [Embed(source='./images/button.swf')]
        public var button_anime:Class;
        
		public var mouse:String ="stop";
		public var main:Main2;
		public var movie:MovieClip;
		public var movie_up:MovieClip;
		
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
		public var move_x_sum:Number=0;

        public function Button1(start_x_in:Number,start_y_in:Number,main_input:Main2,street_input:Street){		
          	main = main_input;
          	street = street_input;
          	
          	start_x = start_x_in;
          	start_y = start_y_in;
			movie = new button_anime();
			movie_up = new button_anime();
			
        	main.addChild(movie);
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
			
			
			word = "CAR";
			text_obj = new Text2(word,main,this);
			text_obj.url_input = "";
			text_obj.text_width = 50;
			text_obj.text_height = 50;
			text_obj.text_color = 0xffffff;
			text_obj.text_size = 16;
			text_obj.text_x = start_x-13;
			text_obj.text_y = start_y-6;
			
			main.addChild(movie_up);
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
					else{
						scale_state = "+";
						angle_state = "-";

						Scale();
						Rotation();
						t = t+ 1;
					}
					break;
				case "over":
					if(t >=t_memory){
						t_memory = 7;
						f = 49.8;
						state = "stop";
					}
					else{
						scale_state = "+";
						angle_state = "-";
						move_state = "+";
						text_obj.ChangeWord("CARADDSTREETGO");
						Move();
						Scale();
						t = t+ 1;
						t_state = t_state + 1;
					}
					break;
				case "out":
					if(t >=t_memory){
						t_memory = 7;
						f = 149.9;
						x_in = start_x * f_before/view;
						y_in = start_y * f_before/view;
						state = "stop";

					}
					else{
						scale_state = "-";
						angle_state = "+";
						move_state = "-";
						text_obj.ChangeWord("CAR");
	
						Move();
						Scale();
						t = t+ 1;
						t_state = t_state - 1;
					}
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
						text_obj.ChangeWord("ADD");
						state = "stop";
						t = 1;
						s = 1;
					}
					else{
						if(t == 2){
							t = 1;
						}
						else{
							t = t + 1;
							s = s + 1;
						}
					}
					break;
				case "stop":
					break;
			}
		}
		public function Move():void{
			move_point_x = 8;
			move_point_y = 0 ;
			
			if(move_state == "+"){
				move_x = move_point_x;
				move_x_sum = move_x_sum + move_x;
				if(move_x_sum>=57){
					move_x = 0;
				}

			}
			else if(move_state == "-"){
				move_x = -1 * move_point_x;
				move_x_sum = move_x_sum + move_x;
				if(move_x_sum<0){
					move_x = 0;
				}
			
			}
			

			
			x_in = x_in+ move_x;
			y_in = y_in+ move_y;
			
			text_obj.ChangePosition(view/f_before*move_x,view/f*move_y);
			text_obj.movie.x = text_obj.movie.x + view/f_before*move_x;
			text_obj.movie.y = text_obj.movie.y + view/f_before*move_y;

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
			if(state == "start"){
				f = f - scale;
			}
			else if(scale_state == "+"){
				if(f >=40){
					f = f -scale;

				}
			}
			else if(scale_state == "-"){
				if(f <=150){
					f =f -scale;
				}
			}

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
			if((state == "stop")&&(main.state !="mouse_down")){
				text_obj.ChangeWord("ADD");
				t = 1;
				s = 1;
				state = "down";
				main.state = "stop";
				
				AddCar();
			}
		}
		public function mouseOverHandler(evt:MouseEvent):void{
			if((state != "over")&&(main.state !="mouse_down")){
				
				t_memory = 7-t_state;
				t = 1;
				
				state = "over";
				main.state = "stop";
			}
		}

		public function mouseOutHandler(evt:MouseEvent):void{
			if((state != "out")&&(main.state !="mouse_down")){

				t_memory =  t_state-1;

				state = "out";
				t = 1;
				main.state = "normal";
			}
		}
		public function AddCar():void{
				main.car_distance = Math.sqrt((street.end_x - street.start_x)*(street.end_x - street.start_x)+(street.end_y - street.start_y)*(street.end_y - street.start_y));
				main.car_start_x = street.end_y -street.start_y;
				main.car_start_y = street.end_x - street.start_x;
				
				main.car_angle = (main.car_start_x * 1 + main.car_start_y * 0) / main.car_distance * 1;
				main.car_start_x = 7 * (street.end_y - street.start_y)/ main.car_distance + street.start_x;
				main.car_start_y = -7 * (street.end_x -street.start_x)/ main.car_distance + street.start_y;
				main.car = new Car(main.car_start_x,main.car_start_y,main,street);
				main.car.movie.rotation = Math.atan2(main.car_start_y,main.car_start_x)* 180/Math.PI;
				
				street.Add(main.car);
				//main.addChild(main.car);
				//main.car_obj.push(main.car);

				main.addChildAt(main.car.movie,main.line_obj.length);
				main.car_obj.push(main.car);
		}
	}
}