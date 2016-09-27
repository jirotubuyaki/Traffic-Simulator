package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Car extends Sprite{
		[Embed(source='./images/CarGreen.swf')]
		public var car_green_anime:Class;
		
		[Embed(source='./images/CarBlue.swf')]
		public var car_blue_anime:Class;

		[Embed(source='./images/CarPink.swf')]
		public var car_pink_anime:Class;
		
		[Embed(source='./images/CarYellow.swf')]
		public var car_yellow_anime:Class;

		[Embed(source='./images/CarRed.swf')]
		public var car_red_anime:Class;
		
		public var movie:MovieClip;
		public var a:Number;
		public var v:Number;
		public var next_turn:String;
		public var cross_end_point_x:Number;
		public var cross_end_point_y:Number;		
		public var obj_state:Object;
		public var obj_left:Object;
		public var obj_right:Object;
		public var obj_straight:Object;
		public var street:Street;
		public var main:Main2;
		public var obj_car:Array = new Array();
		public var i:int = 0;
		public var j:Number;
		public var k:int;
		public var current_street:Street;
		public var front_car_distance:Number;
		public var distance:Number;
		public var distance_2:Number;
		public var angle:Number;
		public var angle_before:Number;
		public var angle_next:Number;
		public var flag:String ="off";
		public var go_flag:String = "off";
		public var next_street:Street;
		public var car_distance:Number;
		public var start_point_x:Number;
		public var start_point_y:Number;
		public var front_car:Car;
		public var next_street_left:Street;
		public var next_street_right:Street;
		public var next_street_straight:Street;
		public var state:String = "run";
		public var timer:Timer;
		public var time:int = 0;
		public var button:Button6;
		public var timer_stop:Timer;
		public var time_stop:int=0;
		
		public function Car(start_x:Number,start_y:Number,main_input:Main2,street_input:Street){
		  	main = main_input;
		  	current_street = street_input;
			
			front_car = current_street.Add(this);
			
			timer = new Timer(600, 0);
			timer.addEventListener(TimerEvent.TIMER,onTick);
			
			timer_stop = new Timer(4000, 0);
			timer_stop.addEventListener(TimerEvent.TIMER,onTickStop);
			
		  	a = Math.random()*0.14 + 0.025;
		  	v = 1;
		  	
		  	start_point_x = start_x;
		  	start_point_y = start_y;
			obj_left = new LeftTurn(this);
			obj_right = new RightTurn(this);
			obj_straight = new StraightTurn(this);
			next_street = main.street_0;
			while(next_street == main.street_0){
	   	 		j = Math.random() * 3;
				if(j <= 1){
					next_turn = "Left";
					obj_state = obj_left;
					next_street = current_street.left_next;
					next_street_left = next_street;
	   	 		}
	   			else if(j <= 2){
	   				next_turn = "Right";
	   				obj_state = obj_right;
	   				next_street = current_street.right_next;
	   				next_street_right = next_street;
	   			}
	   			else{
	   				next_turn = "Straight";
	   				obj_state = obj_straight;
	   				next_street = current_street.straight_next;
	   				next_street_straight = next_street;
				}
			}
			next_street = main.street_0;
			j = Math.random()*5;
			if(j <=1){movie = new car_green_anime();}
			else if(j<=2 ){movie = new car_blue_anime();}
			else if(j<=3){movie = new car_pink_anime();}
			else if(j<=4){movie = new car_yellow_anime();}
			else{movie = new car_red_anime();}
			
			movie.x=start_x;
			movie.y=start_y;

			movie.addEventListener(Event.ENTER_FRAME,act);
			button = new Button6(current_street.start_x+ 50,current_street.start_y-10,main,street);
			timer.start();
			
		}
		public function act(e:Event):void{
			switch(next_turn){
				case "Straight":
					switch(state){
						case "run":
							distance = Math.sqrt((current_street.start_x - current_street.end_x) * (current_street.start_x - current_street.end_x) + (current_street.start_y - current_street.end_y) * (current_street.start_y - current_street.end_y));
							car_distance = Math.sqrt((movie.x -start_point_x)*(movie.x-start_point_x)+(movie.y-start_point_y)*(movie.y-start_point_y));
							if(car_distance + 10 >= distance){
								state = "turn";
							}
							else{
								v = v + a;
								if(v <= 1){
									v = 1;
								}
								if(current_street.run_car[0] != this){
									front_car_distance = Math.sqrt((front_car.movie.x-movie.x)*(front_car.movie.x-movie.x)+(front_car.movie.y-movie.y)*(front_car.movie.y-movie.y));
									if(front_car_distance <=11){
										v = front_car.v-0.2;
										if(front_car.v <= 0){
											v = 0;
										}
									}
								}
								if((current_street.signal_state == "red")&&(car_distance + 43>= distance)){
									state = "stop";
								}
								movie.x = movie.x + v * (current_street.end_x -current_street.start_x)/ distance;
								movie.y = movie.y + v * (current_street.end_y -current_street.start_y)/ distance;
								movie.rotation = Math.atan2(current_street.end_y -current_street.start_y,current_street.end_x -current_street.start_x)* 180/Math.PI;
							}
						break;
						case "turn":
							if(i == 0){
								distance = Math.sqrt((current_street.start_x - current_street.end_x) * (current_street.start_x - current_street.end_x) + (current_street.start_y - current_street.end_y) * (current_street.start_y - current_street.end_y));
								distance_2 = Math.sqrt((next_street_straight.start_x - next_street_straight.end_x) * (next_street_straight.start_x - next_street_straight.end_x) + (next_street_straight.start_y - next_street_straight.end_y) * (next_street_straight.start_y - next_street_straight.end_y));
								cross_end_point_x = current_street.end_x + 5 * (next_street_straight.end_x -next_street_straight.start_x)/distance_2 + 7 * (next_street_straight.end_y -next_street_straight.start_y)/distance_2;
								cross_end_point_y = current_street.end_y + 5 * (next_street_straight.end_y -next_street_straight.start_y)/distance_2 - 7 * (next_street_straight.end_x -next_street_straight.start_x)/distance_2;
								angle_before = Math.atan2(current_street.end_y -current_street.start_y,current_street.end_x -current_street.start_x)* 180/Math.PI;
								angle_next = Math.atan2(next_street_straight.end_y-next_street_straight.start_y,next_street_straight.end_x -next_street_straight.start_x)* 180/Math.PI;

								angle = ((current_street.start_x - current_street.end_x) *(next_street_straight.start_x - next_street_straight.end_x) + (current_street.start_y - current_street.end_y) *(next_street_straight.start_y - next_street_straight.end_y)) /(distance * distance_2);
								i = 1;
								v = 0.5;
								start_point_x = movie.x;
								start_point_y = movie.y;
							}
							else if(i <14){
								obj_state.turn();
								v = 1.2;
							}
							else{
								state = "end";
							}		
						break;
						case "stop":
							if(current_street.signal_state == "red"){
								v = 0;
								timer_stop.start();
							}
							else{
								state = "run";
								timer_stop.stop()
							}
						break;
						case "end":
							start_point_x = movie.x;
							start_point_y = movie.y;
							current_street.Delete(this);
							current_street = next_street_straight;
							front_car = current_street.Add(this);
							
							i = 0;
							while(next_street == main.street_0){
	   					 		j = Math.random() * 3;
								if(j <= 1){
									next_turn = "Left";
									obj_state = obj_left;
									next_street = current_street.left_next;
	   								next_street_left = next_street;
	   					 		}
	   							else if(j <= 2){
	   								next_turn = "Right";
	   								obj_state = obj_right;
	   								next_street = current_street.right_next;
	   								next_street_right = next_street;
	   							}
	   							else{
	   								next_turn = "Straight";
	   								obj_state = obj_straight;
	   								next_street = current_street.straight_next;
	   								next_street_straight = next_street;
								}
							}
							next_street = main.street_0;
							state = "run";
						break;
					}

				break;
				
				case "Right":
					switch(state){
						case "run":
							distance = Math.sqrt((current_street.start_x - current_street.end_x) * (current_street.start_x - current_street.end_x) + (current_street.start_y - current_street.end_y) * (current_street.start_y - current_street.end_y));
							car_distance = Math.sqrt((movie.x -start_point_x)*(movie.x-start_point_x)+(movie.y-start_point_y)*(movie.y-start_point_y));
							if(car_distance + 10 >= distance){
								state = "turn";
							}
							else{
								v = v + a;
								if(v <= 1){
									v = 1;
								}
								if(current_street.run_car[0] != this){
									front_car_distance = Math.sqrt((front_car.movie.x-movie.x)*(front_car.movie.x-movie.x)+(front_car.movie.y-movie.y)*(front_car.movie.y-movie.y));
									if(front_car_distance <=11){
										v = front_car.v-0.2;
										if(front_car.v <= 0){
											v = 0;
										}
									}
								}
								if((current_street.signal_state == "red")&&(car_distance + 43>= distance)){
									state = "stop";
								}
								movie.x = movie.x + v * (current_street.end_x -current_street.start_x)/ distance;
								movie.y = movie.y + v * (current_street.end_y -current_street.start_y)/ distance;
								movie.rotation = Math.atan2(current_street.end_y -current_street.start_y,current_street.end_x -current_street.start_x)* 180/Math.PI;
							}
						break;
						case "turn":
						if(i == 0){
								distance = Math.sqrt((current_street.start_x - current_street.end_x) * (current_street.start_x - current_street.end_x) + (current_street.start_y - current_street.end_y) * (current_street.start_y - current_street.end_y));
								distance_2 = Math.sqrt((next_street_right.start_x - next_street_right.end_x) * (next_street_right.start_x - next_street_right.end_x) + (next_street_right.start_y - next_street_right.end_y) * (next_street_right.start_y - next_street_right.end_y));
								cross_end_point_x = current_street.end_x + 5 * (next_street_right.end_x -next_street_right.start_x)/distance_2 + 7 * (next_street_right.end_y -next_street_right.start_y)/distance_2;
								cross_end_point_y = current_street.end_y + 5 * (next_street_right.end_y -next_street_right.start_y)/distance_2 - 7 * (next_street_right.end_x -next_street_right.start_x)/distance_2;
								angle_before = Math.atan2(current_street.end_y -current_street.start_y,current_street.end_x -current_street.start_x)* 180/Math.PI;
								angle_next = Math.atan2(next_street_right.end_y-next_street_right.start_y,next_street_right.end_x -next_street_right.start_x)* 180/Math.PI;
								angle = ((current_street.start_x - current_street.end_x) *(next_street_right.start_x - next_street_right.end_x) + (current_street.start_y - current_street.end_y) *(next_street_right.start_y - next_street_right.end_y)) /(distance * distance_2);
								i = 1;
								v = 0.5;
								start_point_x = movie.x;
								start_point_y = movie.y;
							}
							else if(i <14){
								obj_state.turn();
								v = 1.2;
							}
							else{
								state = "end";
							}
						
						break;
						case "stop":
							if(current_street.signal_state == "red"){
								v = 0;
								timer_stop.start();
							}
							else{
								state = "run";
								timer_stop.stop();
							}
						break;
						case "end":
							start_point_x = movie.x;
							start_point_y = movie.y;
							current_street.Delete(this);
							current_street = next_street_right;
							front_car = current_street.Add(this);
							
							i = 0;
							while(next_street == main.street_0){
	   					 		j = Math.random() * 3;
								if(j <= 1){
									next_turn = "Left";
									obj_state = obj_left;
									next_street = current_street.left_next;
	   								next_street_left = next_street;
	   					 		}
	   							else if(j <= 2){
	   								next_turn = "Right";
	   								obj_state = obj_right;
	   								next_street = current_street.right_next;
	   								next_street_right = next_street;
	   							}
	   							else{
	   								next_turn = "Straight";
	   								obj_state = obj_straight;
	   								next_street = current_street.straight_next;
	   								next_street_straight = next_street;
								}
							}
							next_street = main.street_0;
							state = "run";
						break;
					}
				break;
				
				case "Left":
					switch(state){
						case "run":
							distance = Math.sqrt((current_street.start_x - current_street.end_x) * (current_street.start_x - current_street.end_x) + (current_street.start_y - current_street.end_y) * (current_street.start_y - current_street.end_y));
							car_distance = Math.sqrt((movie.x -start_point_x)*(movie.x-start_point_x)+(movie.y-start_point_y)*(movie.y-start_point_y));
							if(car_distance + 10 >= distance){
								state = "turn";
							}
							else{
								v = v + a;
								if(v <= 1){
									v = 1;
								}
								if(current_street.run_car[0] != this){
									front_car_distance = Math.sqrt((front_car.movie.x-movie.x)*(front_car.movie.x-movie.x)+(front_car.movie.y-movie.y)*(front_car.movie.y-movie.y));
									if(front_car_distance <=11){
										v = front_car.v-0.2;
										if(front_car.v <= 0){
											v = 0;
										}
									}
								}
								if((current_street.signal_state == "red")&&(car_distance + 43>= distance)){
									state = "stop";
								}
								movie.x = movie.x + v * (current_street.end_x -current_street.start_x)/ distance;
								movie.y = movie.y + v * (current_street.end_y -current_street.start_y)/ distance;
								movie.rotation = Math.atan2(current_street.end_y -current_street.start_y,current_street.end_x -current_street.start_x)* 180/Math.PI;
							}
						break;
						case "turn":
							if(i == 0){
								distance = Math.sqrt((current_street.start_x - current_street.end_x) * (current_street.start_x - current_street.end_x) + (current_street.start_y - current_street.end_y) * (current_street.start_y - current_street.end_y));
								distance_2 = Math.sqrt((next_street_left.start_x - next_street_left.end_x) * (next_street_left.start_x - next_street_left.end_x) + (next_street_left.start_y - next_street_left.end_y) * (next_street_left.start_y - next_street_left.end_y));
								cross_end_point_x = current_street.end_x + 5 * (next_street_left.end_x -next_street_left.start_x)/distance_2 + 7 * (next_street_left.end_y -next_street_left.start_y)/distance_2;
								cross_end_point_y = current_street.end_y + 5 * (next_street_left.end_y -next_street_left.start_y)/distance_2 - 7 * (next_street_left.end_x -next_street_left.start_x)/distance_2;
								angle_before = Math.atan2(current_street.end_y -current_street.start_y,current_street.end_x -current_street.start_x)* 180/Math.PI;
								angle_next = Math.atan2(next_street_left.end_y-next_street_left.start_y,next_street_left.end_x -next_street_left.start_x)* 180/Math.PI;
								angle = ((current_street.start_x - current_street.end_x) *(next_street_left.start_x - next_street_left.end_x) + (current_street.start_y - current_street.end_y) *(next_street_left.start_y - next_street_left.end_y)) /(distance * distance_2);
								i = 1;
								v = 0.5;
								start_point_x = movie.x;
								start_point_y = movie.y;
							}
							else if(i <14){
								obj_state.turn();
								v = 1.2;
							}
							else{
								state = "end";
							}
						
						break;
						case "stop":
							if(current_street.signal_state == "red"){
								v = 0;
								timer_stop.start();

							}
							else{
								state = "run";
								timer_stop.stop();

							}
						break;
						case "end":
							start_point_x = movie.x;
							start_point_y = movie.y;
							current_street.Delete(this);
							current_street = next_street_left;
							front_car = current_street.Add(this);
							
							i = 0;
							while(next_street == main.street_0){
	   					 		j = Math.random() * 3;
								if(j <= 1){
									next_turn = "Left";
									obj_state = obj_left;
									next_street = current_street.left_next;
	   								next_street_left = next_street;
	   					 		}
	   							else if(j <= 2){
	   								next_turn = "Right";
	   								obj_state = obj_right;
	   								next_street = current_street.right_next;
	   								next_street_right = next_street;
	   							}
	   							else{
	   								next_turn = "Straight";
	   								obj_state = obj_straight;
	   								next_street = current_street.straight_next;
	   								next_street_straight = next_street;
								}
							}
							next_street = main.street_0;
							state = "run";
						break;
					}

				break;
			}
		}
		public function onTickStop(e:TimerEvent):void{
			if(time_stop == 0){
				time_stop++;
			}
			else{
				time_stop=0;
				timer_stop.stop();
				current_street.signal_state == "blue";
			}
		}
		public function onTick(e:TimerEvent):void{
			if(time == 1){
				main.removeChild(button.movie);
				main.removeChild(button.movie_up);
				main.removeChild(button.text_obj.text_field);
				main.removeChild(button.text_obj.movie);
				timer.stop();
			}
			time++;
		}
	}
}