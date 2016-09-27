package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Signal extends Sprite{
		[Embed(source='./images/SignalRed.swf')]
		public var signal_red_anime:Class;
		
		[Embed(source='./images/SignalBlue.swf')]
		public var signal_blue_anime:Class;

		[Embed(source='./images/SignalYellow.swf')]
		public var signal_yellow_anime:Class;
		
		[Embed(source='./images/WalkLoad.swf')]
		public var walk_anime:Class;
		
		public var distance_1:Number;
		public var distance_2:Number;
		public var angle:Number;
		public var angle_straight:Number;
		public var angle_right:Number;
		public var angle_left:Number;
		public var movie_blue:MovieClip;
		public var movie_red:MovieClip;
		public var movie_yellow:MovieClip;
		public var movie_straight_blue:MovieClip;
		public var movie_straight_red:MovieClip;
		public var movie_straight_yellow:MovieClip;
		public var movie_right_blue:MovieClip;
		public var movie_right_red:MovieClip;
		public var movie_right_yellow:MovieClip;
		public var movie_left_blue:MovieClip;
		public var movie_left_red:MovieClip;
		public var movie_left_yellow:MovieClip;
		public var walk_load:MovieClip;
		public var walk_load_straight:MovieClip;
		public var walk_load_right:MovieClip;
		public var walk_load_left:MovieClip;
		public var street:Street;
		public var main:Main2;
		public var timer:Timer;
		public var j:Number;
		public var state:int = 1;
		
		public function Signal(main_input:Main2):void{
			j = Math.random()* 3600 + 2000;
			timer = new Timer(j,0);
			timer.addEventListener(TimerEvent.TIMER,onTick);
			main = main_input;
	 		
			walk_load = new walk_anime();
			walk_load_straight = new walk_anime();
			walk_load_right = new walk_anime();
			walk_load_left = new walk_anime();

			movie_red = new signal_red_anime();
			movie_blue = new signal_blue_anime();
			movie_yellow = new signal_yellow_anime();

			movie_straight_red = new signal_red_anime();
			movie_straight_blue = new signal_blue_anime();
			movie_straight_yellow = new signal_yellow_anime();
			
			movie_right_red = new signal_red_anime();
			movie_right_blue = new signal_blue_anime();
			movie_right_yellow = new signal_yellow_anime();

			movie_left_red = new signal_red_anime();
			movie_left_blue = new signal_blue_anime();
			movie_left_yellow = new signal_yellow_anime();
	 	}
		public function SignalFront(street_input:Street):MovieClip{
			street = street_input;
			street.signal = this;
			street.straight_back.signal = this;
			street.left_back.signal = this;
			street.right_back.signal = this;
			
			distance_1 = Math.sqrt((street.start_x - street.end_x) * (street.start_x - street.end_x) + (street.start_y - street.end_y) * (street.start_y - street.end_y));
			distance_2 = 1;
			angle = ((street.end_x - street.start_x) *(1) + (street.end_y - street.start_y) *(0 - 0)) /(distance_1 * distance_2);

			walk_load.x = street.end_x + 18 * (street.start_x -street.end_x)/distance_1;
			walk_load.y = street.end_y + 18 * (street.start_y -street.end_y)/distance_1;
			
			if((street.end_y - street.start_y) <0){
				walk_load.rotation =walk_load.rotation -Math.acos(angle)* 180/Math.PI;
			}
			else{
				walk_load.rotation =walk_load.rotation +Math.acos(angle)* 180/Math.PI;
			}
			main.AddImage(walk_load);
			
			distance_1 = Math.sqrt((street.straight_back.start_x - street.straight_back.end_x) * (street.straight_back.start_x - street.straight_back.end_x) + (street.straight_back.start_y - street.straight_back.end_y) * (street.straight_back.start_y - street.straight_back.end_y));
			distance_2 = 1;
			angle = ((street.straight_back.end_x - street.straight_back.start_x) *(1) + (street.straight_back.end_y - street.straight_back.start_y) *(0 - 0)) /(distance_1 * distance_2);

			walk_load_straight.x = street.straight_back.end_x + 18 * (street.straight_back.start_x -street.straight_back.end_x)/distance_1;
			walk_load_straight.y = street.straight_back.end_y + 18 * (street.straight_back.start_y -street.straight_back.end_y)/distance_1;
			
			if((street.straight_back.end_y - street.straight_back.start_y) <0){
				walk_load_straight.rotation =walk_load_straight.rotation -Math.acos(angle)* 180/Math.PI;
			}
			else{
				walk_load_straight.rotation =walk_load_straight.rotation +Math.acos(angle)* 180/Math.PI;
			}
			
			if(street.straight_back != main.street_0){
				main.AddImage(walk_load_straight);
			}
			distance_1 = Math.sqrt((street.right_back.start_x - street.right_back.end_x) * (street.right_back.start_x - street.right_back.end_x) + (street.right_back.start_y - street.right_back.end_y) * (street.right_back.start_y - street.right_back.end_y));
			distance_2 = 1;
			angle = ((street.right_back.end_x - street.right_back.start_x) *(1) + (street.right_back.end_y - street.right_back.start_y) *(0 - 0)) /(distance_1 * distance_2);

			walk_load_right.x = street.right_back.end_x + 18 * (street.right_back.start_x -street.right_back.end_x)/distance_1;
			walk_load_right.y = street.right_back.end_y + 18 * (street.right_back.start_y -street.right_back.end_y)/distance_1;
			
			
			if((street.right_back.end_y - street.right_back.start_y) <0){
				walk_load_right.rotation =walk_load_right.rotation -Math.acos(angle)* 180/Math.PI;
			}
			else{
				walk_load_right.rotation =walk_load_right.rotation +Math.acos(angle)* 180/Math.PI;
			}
			
			if(street.right_back != main.street_0){
				main.AddImage(walk_load_right);
			}
			distance_1 = Math.sqrt((street.left_back.start_x - street.left_back.end_x) * (street.left_back.start_x - street.left_back.end_x) + (street.left_back.start_y - street.left_back.end_y) * (street.left_back.start_y - street.left_back.end_y));
			distance_2 = 1;
			angle = ((street.left_back.end_x - street.left_back.start_x) *(1) + (street.left_back.end_y - street.left_back.start_y) *(0 - 0)) /(distance_1 * distance_2);

			walk_load_left.x = street.left_back.end_x + 18 * (street.left_back.start_x -street.left_back.end_x)/distance_1;
			walk_load_left.y = street.left_back.end_y + 18 * (street.left_back.start_y -street.left_back.end_y)/distance_1;
			
			
			if((street.left_back.end_y - street.left_back.start_y) <0){
				walk_load_left.rotation =walk_load_left.rotation -Math.acos(angle)* 180/Math.PI;
			}
			else{
				walk_load_left.rotation =walk_load_left.rotation +Math.acos(angle)* 180/Math.PI;
			}
			if(street.left_back != main.street_0){
				main.AddImage(walk_load_left);
			}
			distance_1 = Math.sqrt((street.start_x - street.end_x) * (street.start_x - street.end_x) + (street.start_y - street.end_y) * (street.start_y - street.end_y));
			distance_2 = 1;
			angle = ((street.end_x - street.start_x) *(1) + (street.end_y - street.start_y) *(0 - 0)) /(distance_1 * distance_2);

			movie_red.x = street.end_x + 8 * (street.start_x -street.end_x)/distance_1 + 23 * (street.end_y -street.start_y)/distance_1;
			movie_red.y = street.end_y + 8 * (street.start_y -street.end_y)/distance_1 - 23 * (street.end_x -street.start_x)/distance_1;
			movie_blue.x = street.end_x + 8 * (street.start_x -street.end_x)/distance_1 + 23 * (street.end_y -street.start_y)/distance_1;
			movie_blue.y = street.end_y + 8 * (street.start_y -street.end_y)/distance_1 - 23 * (street.end_x -street.start_x)/distance_1;
			movie_yellow.x = street.end_x + 8 * (street.start_x -street.end_x)/distance_1 + 23 * (street.end_y -street.start_y)/distance_1;
			movie_yellow.y = street.end_y + 8 * (street.start_y -street.end_y)/distance_1 - 23 * (street.end_x -street.start_x)/distance_1;

			distance_1 = Math.sqrt((street.straight_back.start_x - street.straight_back.end_x) * (street.straight_back.start_x - street.straight_back.end_x) + (street.straight_back.start_y - street.straight_back.end_y) * (street.straight_back.start_y - street.straight_back.end_y));
			distance_2 = 1;
			angle_straight = ((street.straight_back.end_x - street.straight_back.start_x) *(1) + (street.straight_back.end_y - street.straight_back.start_y) *(0 - 0)) /(distance_1 * distance_2);

			movie_straight_red.x = street.straight_back.end_x + 8 * (street.straight_back.start_x -street.straight_back.end_x)/distance_1 + 23 * (street.straight_back.end_y -street.straight_back.start_y)/distance_1;
			movie_straight_red.y = street.straight_back.end_y + 8 * (street.straight_back.start_y -street.straight_back.end_y)/distance_1 - 23 * (street.straight_back.end_x -street.straight_back.start_x)/distance_1;
			movie_straight_blue.x = street.straight_back.end_x + 8 * (street.straight_back.start_x -street.straight_back.end_x)/distance_1 + 23 * (street.straight_back.end_y -street.straight_back.start_y)/distance_1;
			movie_straight_blue.y = street.straight_back.end_y + 8 * (street.straight_back.start_y -street.straight_back.end_y)/distance_1 - 23 * (street.straight_back.end_x -street.straight_back.start_x)/distance_1;
			movie_straight_yellow.x = street.straight_back.end_x + 8 * (street.straight_back.start_x -street.straight_back.end_x)/distance_1 + 23 * (street.straight_back.end_y -street.straight_back.start_y)/distance_1;
			movie_straight_yellow.y = street.straight_back.end_y + 8 * (street.straight_back.start_y -street.straight_back.end_y)/distance_1 - 23 * (street.straight_back.end_x -street.straight_back.start_x)/distance_1;
			
			distance_1 = Math.sqrt((street.right_back.start_x - street.right_back.end_x) * (street.right_back.start_x - street.right_back.end_x) + (street.right_back.start_y - street.right_back.end_y) * (street.right_back.start_y - street.right_back.end_y));
			distance_2 = 1;
			angle_right = ((street.right_back.end_x - street.right_back.start_x) *(1) + (street.right_back.end_y - street.right_back.start_y) *(0 - 0)) /(distance_1 * distance_2);

			movie_right_red.x = street.right_back.end_x + 8 * (street.right_back.start_x -street.right_back.end_x)/distance_1 + 23 * (street.right_back.end_y -street.right_back.start_y)/distance_1;
			movie_right_red.y = street.right_back.end_y + 8 * (street.right_back.start_y -street.right_back.end_y)/distance_1 - 23 * (street.right_back.end_x -street.right_back.start_x)/distance_1;
			movie_right_blue.x = street.right_back.end_x + 8 * (street.right_back.start_x -street.right_back.end_x)/distance_1 + 23 * (street.right_back.end_y -street.right_back.start_y)/distance_1;
			movie_right_blue.y = street.right_back.end_y + 8 * (street.right_back.start_y -street.right_back.end_y)/distance_1 - 23 * (street.right_back.end_x -street.right_back.start_x)/distance_1;
			movie_right_yellow.x = street.right_back.end_x + 8 * (street.right_back.start_x -street.right_back.end_x)/distance_1 + 23 * (street.right_back.end_y -street.right_back.start_y)/distance_1;
			movie_right_yellow.y = street.right_back.end_y + 8 * (street.right_back.start_y -street.right_back.end_y)/distance_1 - 23 * (street.right_back.end_x -street.right_back.start_x)/distance_1;
			
			distance_1 = Math.sqrt((street.left_back.start_x - street.left_back.end_x) * (street.left_back.start_x - street.left_back.end_x) + (street.left_back.start_y - street.left_back.end_y) * (street.left_back.start_y - street.left_back.end_y));
			distance_2 = 1;
			angle_left = ((street.left_back.end_x - street.left_back.start_x) *(1) + (street.left_back.end_y - street.left_back.start_y) *(0 - 0)) /(distance_1 * distance_2);

			movie_left_red.x = street.left_back.end_x + 8 * (street.left_back.start_x -street.left_back.end_x)/distance_1 + 23 * (street.left_back.end_y -street.left_back.start_y)/distance_1;
			movie_left_red.y = street.left_back.end_y + 8 * (street.left_back.start_y -street.left_back.end_y)/distance_1 - 23 * (street.left_back.end_x -street.left_back.start_x)/distance_1;
			movie_left_blue.x = street.left_back.end_x + 8 * (street.left_back.start_x -street.left_back.end_x)/distance_1 + 23 * (street.left_back.end_y -street.left_back.start_y)/distance_1;
			movie_left_blue.y = street.left_back.end_y + 8 * (street.left_back.start_y -street.left_back.end_y)/distance_1 - 23 * (street.left_back.end_x -street.left_back.start_x)/distance_1;
			movie_left_yellow.x = street.left_back.end_x + 8 * (street.left_back.start_x -street.left_back.end_x)/distance_1 + 23 * (street.left_back.end_y -street.left_back.start_y)/distance_1;
			movie_left_yellow.y = street.left_back.end_y + 8 * (street.left_back.start_y -street.left_back.end_y)/distance_1 - 23 * (street.left_back.end_x -street.left_back.start_x)/distance_1;
			
			if((street.end_y - street.start_y) <0){
				movie_red.rotation =movie_red.rotation -Math.acos(angle)* 180/Math.PI;
				movie_blue.rotation =movie_blue.rotation -Math.acos(angle)* 180/Math.PI;
				movie_yellow.rotation =movie_yellow.rotation -Math.acos(angle)* 180/Math.PI;
			}
			else{
				movie_red.rotation =movie_red.rotation +Math.acos(angle)* 180/Math.PI;
				movie_blue.rotation =movie_blue.rotation +Math.acos(angle)* 180/Math.PI;
				movie_yellow.rotation =movie_yellow.rotation +Math.acos(angle)* 180/Math.PI;
			}
			if((street.straight_back.end_y - street.straight_back.start_y <0)){
				movie_straight_red.rotation =movie_straight_red.rotation -Math.acos(angle_straight)* 180/Math.PI;
				movie_straight_blue.rotation =movie_straight_blue.rotation -Math.acos(angle_straight)* 180/Math.PI;
				movie_straight_yellow.rotation =movie_straight_yellow.rotation -Math.acos(angle_straight)* 180/Math.PI;

			}
			else{
				movie_straight_red.rotation =movie_straight_red.rotation +Math.acos(angle_straight)* 180/Math.PI;
				movie_straight_blue.rotation =movie_straight_blue.rotation +Math.acos(angle_straight)* 180/Math.PI;
				movie_straight_yellow.rotation =movie_straight_yellow.rotation +Math.acos(angle_straight)* 180/Math.PI;

			}
			if((street.right_back.end_y - street.right_back.start_y <0)){
				movie_right_red.rotation =movie_right_red.rotation -Math.acos(angle_right)* 180/Math.PI;
				movie_right_blue.rotation =movie_right_blue.rotation -Math.acos(angle_right)* 180/Math.PI;
				movie_right_yellow.rotation =movie_right_yellow.rotation -Math.acos(angle_right)* 180/Math.PI;
				
			}
			else{
				movie_right_red.rotation =movie_right_red.rotation +Math.acos(angle_right)* 180/Math.PI;
				movie_right_blue.rotation =movie_right_blue.rotation +Math.acos(angle_right)* 180/Math.PI;
				movie_right_yellow.rotation =movie_right_yellow.rotation +Math.acos(angle_right)* 180/Math.PI;
			
			}
			if((street.left_back.end_y - street.left_back.start_y <0)){
				movie_left_red.rotation =movie_left_red.rotation -Math.acos(angle_left)* 180/Math.PI;
				movie_left_blue.rotation =movie_left_blue.rotation -Math.acos(angle_left)* 180/Math.PI;
				movie_left_yellow.rotation =movie_left_yellow.rotation -Math.acos(angle_left)* 180/Math.PI;

			}
			else{
				movie_left_red.rotation =movie_left_red.rotation +Math.acos(angle_left)* 180/Math.PI;
				movie_left_blue.rotation =movie_left_blue.rotation +Math.acos(angle_left)* 180/Math.PI;
				movie_left_yellow.rotation =movie_left_yellow.rotation +Math.acos(angle_left)* 180/Math.PI;
			}
			
			main.AddImage(movie_red);
			main.AddImage(movie_blue);
			main.AddImage(movie_yellow);
			
			if(street.straight_back != main.street_0){
				main.AddImage(movie_straight_red);
				main.AddImage(movie_straight_blue);
				main.AddImage(movie_straight_yellow);
			}
			
			if(street.right_back != main.street_0){
				main.AddImage(movie_right_red);
				main.AddImage(movie_right_blue);
				main.AddImage(movie_right_yellow);
			}
			if(street.left_back != main.street_0){
				main.AddImage(movie_left_red);
				main.AddImage(movie_left_blue);
				main.AddImage(movie_left_yellow);
			}
			timer.start();
			return movie_red;
		}
		public function onTick(e:TimerEvent):void{
			if(state == 1){
				street.signal_state = "blue";
				street.straight_back.signal_state = "blue";
				street.left_back.signal_state = "red";
				street.right_back.signal_state = "red";
			
				if(street.straight_back != main.street_0){
					movie_straight_red.visible = false;
					movie_straight_yellow.visible = false;
					movie_straight_blue.visible = true;
				}
				
				if(street.right_back != main.street_0){
					movie_right_red.visible = true;
					movie_right_yellow.visible = false;
					movie_right_blue.visible = false;
				}
				if(street.left_back != main.street_0){
					movie_left_red.visible = true;
					movie_left_yellow.visible = false;
					movie_left_blue.visible = false;
				}
				movie_red.visible = false;
				movie_yellow.visible = false;
				movie_blue.visible = true;
				
				state = 2;
			}
			else if(state == 2){
				street.signal_state = "yellow";
				street.straight_back.signal_state = "yellow";
				street.left_back.signal_state = "red";
				street.right_back.signal_state = "red";
			
				movie_red.visible = false;
				movie_yellow.visible = true;
				movie_blue.visible = false;
				if(street.straight_back != main.street_0){
					movie_straight_red.visible = false;
					movie_straight_yellow.visible = true;
					movie_straight_blue.visible = false;
				}	
				if(street.right_back != main.street_0){
					movie_right_red.visible = true;
					movie_right_yellow.visible = false;
					movie_right_blue.visible = false;
				}
				if(street.left_back != main.street_0){
					movie_left_red.visible = true;
					movie_left_yellow.visible = false;
					movie_left_blue.visible = false;
				}	
				state =3;
			}
			else if(state == 3){
				street.signal_state = "red";
				street.straight_back.signal_state = "red";
				street.left_back.signal_state = "blue";
				street.right_back.signal_state = "blue";
			
				movie_red.visible = true;
				movie_yellow.visible = false;
				movie_blue.visible = false;
				if(street.straight_back != main.street_0){
					movie_straight_red.visible = true;
					movie_straight_yellow.visible = false;
					movie_straight_blue.visible = false;
				}
				
				if(street.right_back != main.street_0){
					movie_right_red.visible = false;
					movie_right_yellow.visible = false;
					movie_right_blue.visible = true;
				}
				if(street.left_back != main.street_0){
					movie_left_red.visible = false;
					movie_left_yellow.visible = false;
					movie_left_blue.visible = true;
				}
				state = 4;
			}
			else{
				street.signal_state = "red";
				street.straight_back.signal_state = "red";
				street.left_back.signal_state = "yellow";
				street.right_back.signal_state = "yellow";
			
				movie_red.visible = true;
				movie_yellow.visible = false;
				movie_blue.visible = false;
				if(street.straight_back != main.street_0){
					movie_straight_red.visible = true;
					movie_straight_yellow.visible = false;
					movie_straight_blue.visible = false;
				}
				
				if(street.right_back != main.street_0){
					movie_right_red.visible = false;
					movie_right_yellow.visible = true;
					movie_right_blue.visible = false;
				}
				if(street.left_back != main.street_0){
					movie_left_red.visible = false;
					movie_left_yellow.visible = true;
					movie_left_blue.visible = false;
				}
				
				state = 1;	
			}
		}
	}
}