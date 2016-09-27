package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class StraightTurn{
		public var start_x:Number;
		public var start_y:Number;
		public var car:Car;
		public var car_input:Car;
		public var i:int;
		public var h:int;
		public var distance_1:Number;
		public var distance_2:Number;
		public var angle:Number;
		public var aim:Number;
		public var kakudo:Number;
		
		public function StraightTurn(car_input:Car):void{
			car = car_input;
		}
		public function turn():void{
			if(car.angle_before >= 0){
				if((car.angle_next >=0)&&(car.angle_next<= car.angle_before)){
					car.movie.rotation = car.movie.rotation - (Math.acos(car.angle)* 180/Math.PI)/15;
				}
				else if((car.angle_next >= car.angle_before - 180)&&(car.angle_next <0)){
					car.movie.rotation = car.movie.rotation - (Math.acos(car.angle)* 180/Math.PI)/15;
				}
				else if((car.angle_next >= car.angle_before)&&(car.angle_next<= 180)){
					car.movie.rotation = car.movie.rotation + (Math.acos(car.angle)* 180/Math.PI)/15;
				}
				else{
					car.movie.rotation = car.movie.rotation + (Math.acos(car.angle)* 180/Math.PI)/15;
				}
			}
			else if(car.angle_before < 0){
				if((car.angle_next >=-180)&&(car.angle_next<= car.angle_before)){
					car.movie.rotation = car.movie.rotation - (Math.acos(car.angle)* 180/Math.PI)/15;
				}
				else if((car.angle_next >= car.angle_before + 180)&&(car.angle_next <180)){
					car.movie.rotation = car.movie.rotation - (Math.acos(car.angle)* 180/Math.PI)/15;
				}
				else if((car.angle_next >= 0)&&(car.angle_next<= car.angle_before)){
					car.movie.rotation = car.movie.rotation + (Math.acos(car.angle)* 180/Math.PI)/15;
				}
				else{
					car.movie.rotation = car.movie.rotation + (Math.acos(car.angle)* 180/Math.PI)/15;
				}
			}
			car.movie.x = car.movie.x + (car.cross_end_point_x -car.start_point_x)/15;
			car.movie.y = car.movie.y + (car.cross_end_point_y -car.start_point_y)/15;
			car.i++;
		}
	}
}