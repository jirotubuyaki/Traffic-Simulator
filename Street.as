package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Street extends Sprite{
		public var start_x:Number;
		public var start_y:Number;
		public var end_x:Number;
		public var end_y:Number;
		public var straight_next:Street;
		public var right_next:Street;
		public var left_next:Street;
		public var straight_back:Street;
		public var right_back:Street;
		public var left_back:Street;
		public var run_car:Array = new Array();
		public var i:int;
		public var signal:Signal;
		public var main:Main2;
		public var signal_state:String;
		
		public function Street(){
		}
		public function RoadCenter(center_1_x:Number,center_1_y:Number,center_2_x:Number,center_2_y:Number):void{
			start_x = center_1_x;
			start_y = center_1_y;
			end_x = center_2_x;
			end_y = center_2_y;
		}
		public function NextRoad(straight_1:Street,right_1:Street,left_1:Street):void{
			straight_next = straight_1;
			right_next = right_1;
			left_next = left_1;
		}
		public function BackRoad(straight_1:Street,right_1:Street,left_1:Street):void{
			straight_back = straight_1;
			right_back = right_1;
			left_back = left_1;
		}		
		public function Add(car_input:Car):Car{
			run_car.push(car_input);
			if(run_car.length == 1){
				return run_car[0];
			}
			else{
				return run_car[run_car.length-2];
			}
		}
		public function Delete(car_input:Car):void{
			run_car.shift();
			
		}
		public function FrontCar():Car{
			return run_car[0];
		}
	}
}