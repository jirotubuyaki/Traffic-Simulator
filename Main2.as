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

	public class Main2 extends Sprite {	
		[Embed(source='./fonts/visitor2.ttf', fontName='visitor', mimeType='application/x-font',embedAsCFF='false')] 	
		private var embedFont:Class;
		public var text_obj:Text2;
		public var text_name_obj:Text2NoSound;
		public var name_text:String = "name";
		public var time_count:int=0;
		public var x0:Number=0;
		public var x1:Number=0;
		public var z_z:int=0;
		public var load_byte:uint=0;
		public var state:String = "normal";
		public var number:int = 0;
		public var z_z_z:Number=0;
		public var text_field:TextField;
		public var line:Sprite;
		public var car:Car;

		public var signal_movie:MovieClip;
		public var timer:Timer;
		public var timer_intro:Timer;

		public var time:int=0;
		public var time_intro:int=0;
		public var j:Number;
		public var start_x:Number;
		public var start_y:Number;
		public var end_x:Number;
		public var end_y:Number;
		
		public var start_back_x:Number;
		public var start_back_y:Number;
		public var end_back_x:Number;
		public var end_back_y:Number;
		
		public var car_obj:Array = new Array();
		public var button_obj:Array = new Array();
		public var button2_obj:Array = new Array();

		public var point_start_x:Array = new Array();
		public var point_start_y:Array = new Array();
		public var point_end_x:Array = new Array();
		public var point_end_y:Array = new Array();
		
		public var cross_point_start_x:Array = new Array();
		public var cross_point_start_y:Array = new Array();
		public var cross_point_end_x:Array = new Array();
		public var cross_point_end_y:Array = new Array();
		
		public var point_start_x_back:Array = new Array();
		public var point_start_y_back:Array = new Array();
		public var point_end_x_back:Array = new Array();
		public var point_end_y_back:Array = new Array();
		
		public var next_street:Array = new Array();
		public var back_street:Array = new Array();
		public var vector:Array = new Array();
		public var vector_state:String = "";
		
		public var street_check:Array = new Array();
		public var street_connect:Array = new Array();
		public var street_connect_back:Array = new Array();
		
		public var connect_state_start:String = "off";
		public var connect_state_end:String = "off";

		public var distance:Number=0;
		public var c:int = 0;
		public var i:int = 0;
		public var k:int = 0;
		public var a:int = 0;
		public var o:int = 0;
		public var p:int = 0;
		public var first_click:String = "off";
		public var street_obj:Array = new Array();
		public var street_back_obj:Array = new Array();
		public var button_street:Array = new Array();

		public var street:Street;
		public var street_back:Street;
		public var street_0:Street;
	
		public var signal:Signal;
		
		public var mouse_point_x:Number;
		public var mouse_point_y:Number;

		public var car_start_x:Number;
		public var car_start_y:Number;
		public var car_angle:Number;
		public var car_distance:Number;
		
		public var draw_line:DrawLine;
		public var word:String = "START";
		
		public var button:Button1;
		public var button3:Button3;
		public var button4:Button4;

		public var signal_flag:String = "off";
		public var signal_add_flag:String = "off";
		public var line_obj:Array = new Array();
		public var create_signal:CreateSignal;
		public var signal_point_x_add:Array = new Array();
		public var signal_point_y_add:Array = new Array();
		public var signal_street:Array = new Array();
		public var signal_street_back:Array = new Array();

		public var count:int = 0;
		public var md5:String;
		public var play_flag:String="off";
		public var format:TextFormat;
		
		public var street_x_1:Number;
		public var street_y_1:Number;
		public var street_x_2:Number;
		public var street_y_2:Number;
		public var street_x_3:Number;
		public var street_y_3:Number;
		public var street_x_4:Number;
		public var street_y_4:Number;
		public var street_x_5:Number;
		public var street_y_5:Number;
		public var street_x_6:Number;
		public var street_y_6:Number;
		
		public var street_x:Number;
		public var street_y:Number;
		
		public var cross_1:Number;
		public var cross_2:Number;
		public var cross_3:Number;
		public var cross_4:Number;
		
		public var d_1:Number;
		public var d_2:Number;
		public var t:Number;
		
		public var P_x:Array = new Array();
		public var P_y:Array = new Array();
		public var signal_x:Array = new Array();
		public var signal_y:Array = new Array();
		public var signal_obj:Array = new Array();
		
		public var cross_street:Array = new Array();
		public var cross_street_delete:Array = new Array();
		public var cross_street_turn:Array = new Array();

		public var distance_P_obj:Array = new Array();
		public var distance_P_1:Number;
		public var distance_P_2:Number;
		
		public var P_x_1:Number;
		public var P_y_1:Number;
		public var insert:Number;
		
		public var connect_flag:String = "off";

		public var dot_1:Number;
		public var dot_2:Number;
		public var sepa:Number;
		public var angle:Number;
		
		public var distance_P_1_sepa:Number;
		public var distance_P_2_sepa:Number;
		public var distance_sepa:Number;
		public var dot:Number;
		
		public var point_start_x_sepa:Number;
		public var point_start_y_sepa:Number;
		public var point_end_x_sepa:Number;
		public var point_end_y_sepa:Number;
		
		public var line_number:int=0;

		public var text_mouse:Object;

		public var car_number:int=0;
		
		
		public function Main2(){
			stage.scaleMode =StageScaleMode.SHOW_ALL;
			stage.align=StageAlign.TOP;
			

			street_0= new Street();
			street_0.RoadCenter(0,0,0,0);

			
			timer = new Timer(200, 0);
			timer.addEventListener(TimerEvent.TIMER,onTick);

			timer_intro = new Timer(300, 0);
			timer_intro.addEventListener(TimerEvent.TIMER,onTick_intro);
			
			
			stage.addEventListener(Event.ENTER_FRAME,act);
			stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
			

			timer_intro.start();

			var text_obj1:Object = new Text("TRAFFIC",this,this);
			text_obj1.text_width = 400;
			text_obj1.text_height = 40;
			text_obj1.text_color = 0x000000;
			text_obj1.text_size = 36;
			text_obj1.text_x =0;
			text_obj1.text_y = 10;

			var text_obj1:Object = new Text("SIMULATOR",this,this);
			text_obj1.text_width = 400;
			text_obj1.text_height = 40;
			text_obj1.text_color = 0x000000;
			text_obj1.text_size = 36;
			text_obj1.text_x =140;
			text_obj1.text_y = 10;

			text_mouse = new Text("DRAG",this,this);
			text_mouse.text_width = 400;
			text_mouse.text_height = 40;
			text_mouse.text_color = 0x000000;
			text_mouse.text_size = 18;
			text_mouse.text_x =140;
			text_mouse.text_y = 10;

			var format:TextFormat = new TextFormat();
			//format.font= "japanese";
			format.size= 15;
			text_field = new TextField();
			text_field.textColor= 0xaaaaaa;
			text_field.border = false;
			text_field.x = 0;
			text_field.y = 50;
			text_field.width= 500;
			text_field.height = 100;
			text_field.antiAliasType = AntiAliasType.ADVANCED;
			text_field.sharpness =0;
			text_field.thickness =0;
			//text_field.embedFonts = true;
			text_field.text = "\nTraffic Simulator intaractive: Please Drag.";
			text_field.setTextFormat(format);

			addChild(text_field);
		}
		private function mouseDownHandler(evt:MouseEvent):void{
			if((state == "normal")&&(mouseY >=50)){
				draw_line = new DrawLine(this);
				start_x = mouseX;
				start_y = mouseY;
				mouse_point_x = mouseX;
				mouse_point_y =mouseY;
				this.addChildAt(draw_line.line,0);
				line_obj.push(draw_line.line);
				line_number = line_obj.length-1;
				state = "mouse_down";
				CheckPointStart();

			}
		}
		private function mouseUpHandler(evt:MouseEvent):void{
			CheckPointEnd();
			if((state == "mouse_down")&&(mouseY>=50)){
				if((first_click == "off")&&(Math.sqrt((end_x-start_x)*(end_x-start_x)+(end_y-start_y)*(end_y-start_y)) >20)){
					end_x = mouseX;
					end_y = mouseY;
					mouse_point_x = mouseX;
					mouse_point_y = mouseY;
 			 		line = draw_line.Line(start_x,start_y,end_x,end_y);
					point_start_x.push(start_x);
					point_end_x.push(end_x);
					point_start_y.push(start_y);
					point_end_y.push(end_y);
					
					point_start_x_back.push(end_x);
					point_end_x_back.push(start_x);
					point_start_y_back.push(end_y);
					point_end_y_back.push(start_y);

	 		 		street = new Street();
					street_back = new Street();
					
					street_obj.push(street);
					street_back_obj.push(street_back);
					
					street.RoadCenter(start_x,start_y,end_x,end_y);
					street.NextRoad(street_back_obj[0],street_0,street_0);
					street.BackRoad(street_back_obj[0],street_0,street_0);
					
					street_back.RoadCenter(end_x,end_y,start_x,start_y);
					street_back.NextRoad(street_obj[0],street_0,street_0);
					street_back.BackRoad(street_obj[0],street_0,street_0);
					
					signal_street.push(street);
					signal_street_back.push(street_back);
			
					state = "normal";
					first_click = "on";
					count++;
					number = 0;
				}
				else{

					if(Math.sqrt((end_x-start_x)*(end_x-start_x)+(end_y-start_y)*(end_y-start_y)) >20){
						if(connect_state_start == "off"){
							FitStart();
						}
						if(connect_state_end == "off"){
							end_x = mouseX;
							end_y = mouseY;
							mouse_point_x = mouseX;
							mouse_point_y = mouseY;
							
							FitEnd();
						}
						CrossCheck(start_x,start_y,end_x,end_y);
						CrossPoint(start_x,start_y,end_x,end_y);
						line = draw_line.Line(start_x,start_y,end_x,end_y);
						
						if(cross_street_turn.length == 0){
						

							point_start_x.push(start_x);
							point_end_x.push(end_x);
							point_start_y.push(start_y);
							point_end_y.push(end_y);
							
							point_start_x_back.push(end_x);
							point_end_x_back.push(start_x);
							point_start_y_back.push(end_y);
							point_end_y_back.push(start_y);
						
	 		 				street = new Street();
							street_back = new Street();
						
							street.RoadCenter(start_x,start_y,end_x,end_y);
							street_back.RoadCenter(end_x,end_y,start_x,start_y);
						
							street_obj.push(street);
							street_back_obj.push(street_back);
						
							signal_street.push(street);
							signal_street_back.push(street_back);

							if(connect_state_start == "off"){
								street_back.NextRoad(street,street_0,street_0);
								street_back.BackRoad(street,street_0,street_0);

							}
							else if(connect_state_start == "on"){
								CreateConnectStart();
								CreateSignalPointStart();
							}
							if(connect_state_end == "off"){
								street.NextRoad(street_back,street_0,street_0);
								street.BackRoad(street_back,street_0,street_0);

							}
							else if(connect_state_end == "on"){
								CreateConnectEnd();
								CreateSignalPointEnd();
							}
							count++;
							connect_state_start = "off";
							connect_state_end = "off";
							state = "normal";
						timer.start();

							if(count % 4 == 0){

								button = new Button1((end_x + start_x)/2+30,(end_y +start_y)/2,this,street);
								button_obj.push(button);
								button_street.push(street);


							}
						}
						else{
							AddEge(start_x,start_y,end_x,end_y);
							state = "normal";

							if(connect_state_start == "on"){
								CreateSignalPointStart();
								CreateConnectStart();
							}
							if(connect_state_end == "on"){
								CreateSignalPointEnd();
								CreateConnectEnd();
							}
							for(o=0;o<cross_point_start_x.length;o++){
								start_back_x = start_x;
								start_back_y = start_y;
								end_back_x = end_x;
								end_back_y = end_y;
								
								start_x = cross_point_start_x[o];
								start_y = cross_point_start_y[o];
									
								CreateConnectStart();
								CreateSignalPointStart();

								
								end_x = cross_point_end_x[o];
								end_y = cross_point_end_y[o];

								CreateConnectEnd();
								CreateSignalPointEnd();
								
								start_x = start_back_x;
								start_y = start_back_y;
								end_x = end_back_x;
								end_y = end_back_y;
							}
							count++;
							connect_state_start = "off";
							connect_state_end = "off";
							state = "normal";

						timer.start();

							if(count % 4 == 0){

								button = new Button1((end_x + start_x)/2+30,(end_y +start_y)/2,this,street);
								button_obj.push(button);
								button_street.push(street);
							}
						}
					}
				}
				for(o=0;o<cross_street.length;o=0){
					cross_street.shift();
				}
				for(o=0;o<cross_street_turn.length;o=0){
					cross_street_turn.shift();
				}
				for(o=0;o<cross_street_delete.length;o=0){
					cross_street_delete.shift();
				}
				for(o=0;o<distance_P_obj.length;o=0){
					distance_P_obj.shift();
				}
				for(o=0;o<P_x.length;o=0){
					P_x.shift();
					P_y.shift();
				}
				for(o=0;o<cross_point_start_x.length;o=0){
					cross_point_start_x.shift();
					cross_point_end_x.shift();
					cross_point_start_y.shift();
					cross_point_end_y.shift();
				}
				start_back_x = start_x;
				start_back_y = start_y;
				end_back_x = end_x;
				end_back_y = end_y;
						
				for(o=0;o<signal_street.length;o++){
					start_x = signal_street[o].start_x;
					start_y = signal_street[o].start_y;
					end_x = signal_street[o].end_x;
					end_y = signal_street[o].end_y;
					CreateSignalAddStart();
					CreateSignalAddEnd();
					
				}
						
				start_x = start_back_x;
				start_y = start_back_y;
				end_x = end_back_x;
				end_y = end_back_y;
				
			}

		}
		public function act(e:Event):void{
			text_mouse.text_x=mouseX-5;
			text_mouse.text_y = mouseY-15;
			text_mouse.text_field.x=mouseX-5;
			text_mouse.text_field.y = mouseY-15;
			switch(state){
				case "normal":
					break;
				case "mouse_down":
					if(connect_state_end == "off"){
						draw_line.Line(start_x,start_y,mouseX,mouseY);
						mouse_point_x = mouseX;
						mouse_point_y = mouseY;
						end_x = mouseX;
						end_y = mouseY;

					}
					else if(connect_state_end == "on"){
						draw_line.Line(start_x,start_y,end_x,end_y);
						mouse_point_x = end_x;
						mouse_point_y = end_y;
					}
					if(first_click == "on"){
						CheckPointEnd();
					}
					break;
			}
		}
		public function CreateConnectStart():void{
			for(i=0;i<street_obj.length;i++){
				if((point_start_x[i] == start_x)&&(point_start_y[i] == start_y)){
					street_check.push(street_back_obj[i]);
					street_connect.push(street_obj[i]);
					street_connect_back.push(street_back_obj[i]);

					vector_state = "start";
					vector.push(vector_state);
				}
			}
			for(i=0;i<street_back_obj.length;i++){
				if((point_start_x_back[i] == start_x)&&(point_start_y_back[i] == start_y)){
					street_check.push(street_obj[i]);
					street_connect.push(street_back_obj[i]);
					street_connect_back.push(street_obj[i]);

					vector_state = "start";
					vector.push(vector_state);
				}
			}
			for(i=0;i<street_check.length;i++){
				if(street_check.length == 1){
					street_check[0].NextRoad(street_connect[0],street_0,street_0);
					street_check[0].BackRoad(street_connect[0],street_0,street_0);
				}
				else{
					k = 0;
					for(j=0;j<street_connect.length;j++){
						if(street_check[i] != street_connect_back[j]){
							next_street[k] = street_connect[j];
							back_street[k] = street_connect_back[j];
							k++;
						}
					}
					if(k == 0){
						street_check[i].NextRoad(street_check[0],street_0,street_0);
						street_check[i].BackRoad(street_check[0],street_0,street_0);
					}
					else if( k == 1){
						street_check[i].NextRoad(next_street[0],street_0,street_0);
						street_check[i].BackRoad(back_street[0],street_0,street_0);
		
					}
					else if(k == 2){
						street_check[i].NextRoad(next_street[0],next_street[1],street_0);
						street_check[i].BackRoad(back_street[0],back_street[1],street_0);

					}
					else if(k == 3){
						street_check[i].NextRoad(next_street[0],next_street[1],next_street[2]);
						street_check[i].BackRoad(back_street[0],back_street[1],back_street[2]);

					}
					else if(k >=4){

					}
					for(p=0;p<signal_x.length;p++){
						if((signal_x[p] == start_x)&&(signal_y[p] == start_y)){
							signal_obj[p].timer.stop();
							
							signal_obj[p].street.signal_state = "blue";
							signal_obj[p].street.straight_back.signal_state = "blue";
							signal_obj[p].street.left_back.signal_state = "blue";
							signal_obj[p].street.right_back.signal_state = "blue";
							
							signal_x.splice(p,1);
							signal_y.splice(p,1);
							signal_obj.splice(p,1);
							signal_street.push(street_check[i]);
							signal_street_back.push(street_connect[i]);

						}
					}
				}
			}
		 	for(i=0;i<street_connect.length;i=0){
 		 		street_connect.shift();
		 		street_connect_back.shift();
		 	}
		 	for(i=0;i<next_street.length;i=0){
		 		next_street.shift();
		 		back_street.shift();
		 	}
			for(i=0;i<vector.length;i=0){
				vector.shift();
			}
			for(i=0;i<street_check.length;i=0){
				street_check.shift();
			}
		}
		public function CreateConnectEnd():void{
			for(i=0;i<street_obj.length;i++){
				if((point_start_x[i] == end_x)&&(point_start_y[i] == end_y)){
					street_check.push(street_back_obj[i]);
					street_connect.push(street_obj[i]);
					street_connect_back.push(street_back_obj[i]);
					
					vector_state = "start";
					vector.push(vector_state);
				}
			}
			for(i=0;i<street_back_obj.length;i++){
				if((point_start_x_back[i] == end_x)&&(point_start_y_back[i] == end_y)){
					street_check.push(street_obj[i]);
					street_connect.push(street_back_obj[i]);
					street_connect_back.push(street_obj[i]);
		
					vector_state = "start";
					vector.push(vector_state);
				}
			}
			for(i=0;i<street_check.length;i++){
				if(street_check.length == 1){
					street_check[0].NextRoad(street_connect[0],street_0,street_0);
					street_check[0].BackRoad(street_connect[0],street_0,street_0);
				}
				else{
					k = 0;
					for(j=0;j<street_connect.length;j++){
						if(street_check[i] != street_connect_back[j]){
							next_street[k] = street_connect[j];
								back_street[k] = street_connect_back[j]
							k++;
						}
					}
					if(k == 0){
						street_check[i].NextRoad(street_check[0],street_0,street_0);
						street_check[i].BackRoad(street_check[0],street_0,street_0);
					}
					else if( k == 1){
						street_check[i].NextRoad(next_street[0],street_0,street_0);
						street_check[i].BackRoad(back_street[0],street_0,street_0);

					}
					else if(k == 2){
						street_check[i].NextRoad(next_street[0],next_street[1],street_0);
						street_check[i].BackRoad(back_street[0],back_street[1],street_0);

					}
					else if(k == 3){
						street_check[i].NextRoad(next_street[0],next_street[1],next_street[2]);
						street_check[i].BackRoad(back_street[0],back_street[1],back_street[2]);

					}
					else if(k >= 4){
					}
					for(p=0;p<signal_x.length;p++){
						if((signal_x[p] == end_x)&&(signal_y[p] == end_y)){
							signal_obj[p].timer.stop();
							signal_obj[p].street.signal_state = "blue";
							signal_obj[p].street.straight_back.signal_state = "blue";
							signal_obj[p].street.left_back.signal_state = "blue";
							signal_obj[p].street.right_back.signal_state = "blue";
							signal_x.splice(p,1);
							signal_y.splice(p,1);
							signal_obj.splice(p,1);
							signal_street.push(street_connect[i]);
							signal_street_back.push(street_check[i]);

						}
					}
				}
			}
		 	for(i=0;i<street_connect.length;i=0){
 		 		street_connect.shift();
		 		street_connect_back.shift();
		 	}
		 	for(i=0;i<next_street.length;i=0){
		 		next_street.shift();
		 		back_street.shift();
		 	}
			for(i=0;i<vector.length;i=0){
				vector.shift();
			}
			for(i=0;i<street_check.length;i=0){
				street_check.shift();
			}
		}
		public function FitStart():void{
			sepa = -1;
			
			for(i=0;i<street_obj.length;i++){
				street_x_1 = point_end_x[i] - point_start_x[i];
				street_y_1 = point_end_y[i] - point_start_y[i];
				
				street_x_2 = start_x - point_start_x[i];
				street_y_2 = start_y - point_start_y[i];
				
				street_x_3 = point_start_x[i] - point_end_x[i];
				street_y_3 = point_start_y[i] - point_end_y[i];
				
				street_x_4 = start_x - point_end_x[i];
				street_y_4 = start_y - point_end_y[i];
				
				dot_1 = street_x_1 * street_x_2 + street_y_1 * street_y_2;
				dot_2 = street_x_3 * street_x_4 + street_y_3 * street_y_4;
				
				cross_1 = street_x_1 * street_y_2 - street_y_1 * street_x_2;
				distance_P_1 = Math.sqrt((street_x_1)*(street_x_1)+(street_y_1)*(street_y_1));
				distance_P_2 = Math.sqrt((street_x_2)*(street_x_2)+(street_y_2)*(street_y_2));
				
				if((dot_1 >0)&&(dot_2>0)){
					distance = Math.abs(cross_1) / Math.sqrt((street_x_1)*(street_x_1)+(street_y_1)*(street_y_1));
				}
				else{
					distance = 100;
				}
				if(distance <= 30){
					sepa = i;
					dot = dot_1;
					distance_sepa = distance;
					distance_P_1_sepa = distance_P_1;
					distance_P_2_sepa = distance_P_2;
					street_x = street_x_1;
					street_y = street_y_1;
					
					connect_state_start = "on";

				}
				
			}
			if(sepa != -1){
				angle = Math.acos(dot/(distance_P_1_sepa * distance_P_2_sepa));
				distance_P_2_sepa = distance_sepa / Math.tan(angle);
					
				P_x[0] = distance_P_2_sepa * street_x / distance_P_1_sepa + point_start_x[sepa];
				P_y[0] = distance_P_2_sepa * street_y / distance_P_1_sepa + point_start_y[sepa];
				
				SepaStreet();
				start_x = P_x[0];
				start_y = P_y[0];



				CreateConnectStart();
				
	 			P_x.shift();
				P_y.shift();
			}
		}
		public function FitEnd():void{
			sepa = -1;
			
			for(i=0;i<street_obj.length;i++){
				street_x_1 = point_end_x[i] - point_start_x[i];
				street_y_1 = point_end_y[i] - point_start_y[i];
				
				street_x_2 = end_x - point_start_x[i];
				street_y_2 = end_y - point_start_y[i];
				
				street_x_3 = point_start_x[i] - point_end_x[i];
				street_y_3 = point_start_y[i] - point_end_y[i];
				
				street_x_4 = end_x - point_end_x[i];
				street_y_4 = end_y - point_end_y[i];
				
				dot_1 = street_x_1 * street_x_2 + street_y_1 * street_y_2;
				dot_2 = street_x_3 * street_x_4 + street_y_3 * street_y_4;
				
				cross_1 = street_x_1 * street_y_2 - street_y_1 * street_x_2;
				distance_P_1 = Math.sqrt((street_x_1)*(street_x_1)+(street_y_1)*(street_y_1));
				distance_P_2 = Math.sqrt((street_x_2)*(street_x_2)+(street_y_2)*(street_y_2));
				
				if((dot_1 >0)&&(dot_2>0)){
					distance = Math.abs(cross_1) / Math.sqrt((street_x_1)*(street_x_1)+(street_y_1)*(street_y_1));
				}
				else{
					distance = 100;
				}
				if(distance <= 30){
					sepa = i;
					dot = dot_1;
					distance_sepa = distance;
					distance_P_1_sepa = distance_P_1;
					distance_P_2_sepa = distance_P_2;
					street_x = street_x_1;
					street_y = street_y_1;
					
					connect_state_end = "on";
					

				}
				
			}
			if(sepa != -1){
				angle = Math.acos(dot/(distance_P_1_sepa * distance_P_2_sepa));
				distance_P_2_sepa = distance_sepa / Math.tan(angle);
					
				P_x[0] = distance_P_2_sepa * street_x / distance_P_1_sepa + point_start_x[sepa];
				P_y[0] = distance_P_2_sepa * street_y / distance_P_1_sepa + point_start_y[sepa];
			
				SepaStreet();
				end_x = P_x[0];
				end_y = P_y[0];
			
				CreateConnectEnd();
				
	 			P_x.shift();
				P_y.shift();
				
				
			}
		}
		public function CheckPointStart():void{
			c=0;
			for(i=0;i<point_start_x.length;i++){
				distance = Math.sqrt((point_start_x[i]-mouse_point_x)*(point_start_x[i]-mouse_point_x)+(point_start_y[i]-mouse_point_y)*(point_start_y[i]-mouse_point_y));
				if(distance <= 30){
					line = draw_line.Line(start_x,start_y,point_start_x[i],point_start_y[i]);
					start_x = point_start_x[i];
					start_y = point_start_y[i];
					connect_state_start = "on";
					c++;
					
				}
			}
			for(i=0;i<point_end_x.length;i++){
				distance = Math.sqrt((point_end_x[i]-mouse_point_x)*(point_end_x[i]-mouse_point_x)+(point_end_y[i]-mouse_point_y)*(point_end_y[i]-mouse_point_y));
				if(distance <= 30){
					line = draw_line.Line(start_x,start_y,point_end_x[i],point_end_y[i]);
					start_x = point_end_x[i];
					start_y = point_end_y[i];
					connect_state_start = "on";
					c++;

				}
			}
			if(c > 3){
				connect_state_start = "off";
				this.removeChild(draw_line.line);
				line_obj.splice(line_number,1);
				state = "normal";

			}
		}
		public function CheckPointEnd():void{
			c=0;
			for(i=0;i<point_start_x.length;i++){
				distance = Math.sqrt((point_start_x[i]-mouse_point_x)*(point_start_x[i]-mouse_point_x)+(point_start_y[i]-mouse_point_y)*(point_start_y[i]-mouse_point_y));
				if((point_start_x[i] == start_x)&&(point_start_y[i] == start_y)){
				
				}
				else if(distance <= 35){
					line = draw_line.Line(start_x,start_y,point_start_x[i],point_start_y[i]);
					end_x = point_start_x[i];
					end_y = point_start_y[i];
					mouse_point_x = end_x;
					mouse_point_y = end_y;
					connect_state_end = "on";
					connect_flag = "on";
					c++;
				}
			}
			if(connect_flag != "on"){
				connect_state_end = "off";
			}
			connect_flag = "off";
			for(i=0;i<point_end_x.length;i++){
				distance = Math.sqrt((point_end_x[i]-mouse_point_x)*(point_end_x[i]-mouse_point_x)+(point_end_y[i]-mouse_point_y)*(point_end_y[i]-mouse_point_y));
				if((point_end_x[i] == start_x)&&(point_end_y[i] == start_y)){
				}
				else if(distance <= 35){
					line = draw_line.Line(start_x,start_y,point_end_x[i],point_end_y[i]);
					end_x = point_end_x[i];
					end_y = point_end_y[i];
					mouse_point_x = end_x;
					mouse_point_y = end_y;
					connect_state_end = "on";
					connect_flag = "on";
					c++;

				}
			}
			if(connect_flag != "on"){
				connect_state_end = "off";
			}
			if(c > 3){
				connect_state_end = "off";
				this.removeChild(draw_line.line);
				line_obj.splice(line_number,1);
				state = "normal";

			}
			connect_flag = "off";

		}
		public function CreateSignalAddStart():void{
			signal_flag = "off";
			
			for(a = 0;a<signal_x.length;a++){
				if((signal_x[a] == start_x)&&(signal_y[a] == start_y)){
					signal_flag = "on"
				}
			}
			if(signal_flag == "off"){
				signal = new Signal(this);
				signal_movie = signal.SignalFront(signal_street_back[o]);
				signal_obj.push(signal);
				signal_x.push(start_x);
				signal_y.push(start_y);

			}
		}
		public function CreateSignalAddEnd():void{
			signal_flag = "off";
			
			for(a = 0;a<signal_x.length;a++){
				if((signal_x[a] == end_x)&&(signal_y[a] == end_y)){
					signal_flag = "on"
				}
			}
			if(signal_flag == "off"){
				signal = new Signal(this);
				signal_movie = signal.SignalFront(signal_street[o]);
				signal_obj.push(signal);
				signal_x.push(end_x);
				signal_y.push(end_y);

			}
		}

		public function CreateSignalPointStart():void{
			signal_flag = "off";
			
			for(a = 0;a<signal_point_x_add.length;a++){
				if((signal_point_x_add[a] == start_x)&&(signal_point_y_add[a] == start_y)){
					signal_flag = "on"
				}
			}
			if(signal_flag == "off"){
				create_signal = new CreateSignal(start_x,start_y,this,street_back);
				button2_obj.push(create_signal);
				signal_point_x_add.push(start_x);
				signal_point_y_add.push(start_y);
			}
		}
		public function CreateSignalPointEnd():void{
			signal_flag = "off";
			
			for(a = 0;a<signal_point_x_add.length;a++){
				if((signal_point_x_add[a] == end_x)&&(signal_point_y_add[a] == end_y)){
					signal_flag = "on"
				}
			}
			if(signal_flag == "off"){
				create_signal = new CreateSignal(end_x,end_y,this,street);
				button2_obj.push(create_signal);
				signal_point_x_add.push(end_x);
				signal_point_y_add.push(end_y);
			}
		}
		public function AddImage(movie_clip:MovieClip):void{
			this.addChildAt(movie_clip,line_obj.length-1);
			line_obj.push(movie_clip);
		}
		public function onTick(e:TimerEvent):void{
			if(car_number < 50){
				car_distance = Math.sqrt((point_end_x[0] - point_start_x[0])*(point_end_x[0] - point_start_x[0])+(point_end_y[0] - point_start_y[0])*(point_end_y[0] - point_start_y[0]));
				car_start_x = point_end_y[0] -point_start_y[0];
				car_start_y = point_end_x[0] - point_start_x[0];
				car_angle = (car_start_x * 1 + car_start_y * 0) / car_distance * 1;

				car_start_x = 7 * (point_end_y[0] -point_start_y[0])/ car_distance + point_start_x[0];
				car_start_y = -7 * (point_end_x[0] - point_start_x[0])/ car_distance + point_start_y[0];
				car = new Car(car_start_x,car_start_y,this,street_obj[0]);
				car.movie.rotation = Math.atan2(car_start_y,car_start_x)* 180/Math.PI;
				
				street_obj[0].Add(car);
				this.addChildAt(car.movie,line_obj.length);
				car_obj.push(car);
				car_number++;
				number++;
			}
			else{
				timer.stop();
			}
		}
		public function onTick_intro(e:TimerEvent):void{
			if(time_intro == 2){

			}
			if(time_intro ==4){
				timer_intro.stop();
			}
			time_intro++;
		}
		public function CrossCheck(start_x_1:Number,start_y_1:Number,end_x_2:Number,end_y_2:Number):void{
			for(o=0;o<street_obj.length;o++){
				street_x_1 = point_end_x[o] - point_start_x[o];
				street_y_1 = point_end_y[o] - point_start_y[o];
				
				street_x_2 = end_x_2 - start_x_1;
				street_y_2 = end_y_2 - start_y_1;
				
				street_x_3 = point_end_x[o] - start_x_1;
				street_y_3 = point_end_y[o] - start_y_1;
				
				street_x_4 = point_start_x[o] - start_x_1;
				street_y_4 = point_start_y[o] - start_y_1;
				
				street_x_5 = start_x_1 - point_start_x[o];
				street_y_5 = start_y_1 - point_start_y[o];
				
				street_x_6 = end_x_2 - point_start_x[o];
				street_y_6 = end_y_2 - point_start_y[o];
				
				cross_1 = street_x_2 * street_y_3 - street_y_2 * street_x_3;
				cross_2 = street_x_2 * street_y_4 - street_y_2 * street_x_4;
				
				cross_3 = street_x_1 * street_y_5 - street_y_1 * street_x_5;
				cross_4 = street_x_1 * street_y_6 - street_y_1 * street_x_6;
				
				if((cross_1 * cross_2 <0)&&(cross_3 * cross_4 <0)){
					cross_street.push(o);
				}
			}
		}
		public function CrossPoint(start_x_1:Number,start_y_1:Number,end_x_2:Number,end_y_2:Number):void{
			for(i=0;i<cross_street.length;i++){
				street_x_1 = point_end_x[cross_street[i]] - point_start_x[cross_street[i]];
				street_y_1 = point_end_y[cross_street[i]] - point_start_y[cross_street[i]];
				
				street_x_5 = start_x_1 - point_start_x[cross_street[i]];
				street_y_5 = start_y_1 - point_start_y[cross_street[i]];
				
				street_x_6 = end_x_2 - point_start_x[cross_street[i]];
				street_y_6 = end_y_2 - point_start_y[cross_street[i]];
				
				cross_3 = street_x_1 * street_y_5 - street_y_1 * street_x_5;
				cross_4 = street_x_1 * street_y_6 - street_y_1 * street_x_6;
				
				d_1 = Math.abs(cross_3);
				d_2 = Math.abs(cross_4);
				
				t = d_1/(d_1 + d_2);
				
				P_x_1 = start_x_1 + (end_x_2 - start_x_1)*t;
				P_y_1 = start_y_1 + (end_y_2 - start_y_1)*t;
				
				distance_P_1 = Math.sqrt((end_x_2 - start_x_1)*(end_x_2 -start_x_1)+(end_y_2 -start_y_1)*(end_y_2 - start_y_1));
				distance_P_2 = Math.sqrt((P_x_1 - start_x_1)*(P_x_1 -start_x_1)+(P_y_1 -start_y_1)*(P_y_1 - start_y_1));
				
				if((distance_P_2 <10)||(Math.abs(distance_P_2 -distance_P_1) < 10)){
				
				}
				else{
					distance_P_obj.push(distance_P_2);
					P_x.push(P_x_1);
					P_y.push(P_y_1);
					cross_street_turn.push(cross_street[i]);
					cross_street_delete.push(cross_street[i]);
					
				}
			}
			for(o=0;o<distance_P_obj.length-1;o++){
				for(j=distance_P_obj.length-1;j>o;j--){
					if(distance_P_obj[j]<distance_P_obj[j-1]){
						insert = distance_P_obj[j];
						distance_P_obj[j]=distance_P_obj[j-1];
	 					distance_P_obj[j-1]=insert;
	 							
						insert = P_x[j];
						P_x[j]=P_x[j-1];
	 					P_x[j-1]=insert;
	 							
						insert = P_y[j];
						P_y[j]=P_y[j-1];
	 					P_y[j-1]=insert;
	 							
						insert = cross_street_turn[j];
						cross_street_turn[j]=cross_street_turn[j-1];
	 					cross_street_turn[j-1]=insert;
					}
				}
	 		}
		}
		public function AddEge(start_x_1:Number,start_y_1:Number,end_x_2:Number,end_y_2:Number):void{
			for(p=0;p<=P_x.length;p++){
				if(p==0){
					point_start_x.push(start_x_1);
					point_end_x.push(P_x[p]);
					point_start_y.push(start_y_1);
					point_end_y.push(P_y[p]);
							
					point_start_x_back.push(P_x[p]);
					point_end_x_back.push(start_x_1);
					point_start_y_back.push(P_y[p]);
					point_end_y_back.push(start_y_1);
				
	 			 	street = new Street();
					street_back = new Street();
						
					street.RoadCenter(start_x_1,start_y_1,P_x[p],P_y[p]);
					street_back.RoadCenter(P_x[p],P_y[p],start_x_1,start_y_1);

					signal_street.push(street);
					signal_street_back.push(street_back);
				
					street_obj.push(street);
					street_back_obj.push(street_back);
					
					if(connect_state_start == "on"){
						CreateSignalPointStart();
					}
					
					if(connect_state_start == "off"){
						street_back.NextRoad(street,street_0,street_0);
						street_back.BackRoad(street,street_0,street_0);

					}
					
					cross_point_start_x.push(start_x_1);
					cross_point_end_x.push(P_x[p]);
					cross_point_start_y.push(start_y_1);
					cross_point_end_y.push(P_y[p]);
				
				}
				else if(p == P_x.length){
				
					start_back_x = start_x;
					start_back_y = start_y;
					end_back_x = end_x;
					end_back_y = end_y;
					
					point_start_x.push(P_x[p-1]);
					point_end_x.push(end_x_2);
					point_start_y.push(P_y[p-1]);
					point_end_y.push(end_y_2);
							
					point_start_x_back.push(end_x_2);
					point_end_x_back.push(P_x[p-1]);
					point_start_y_back.push(end_y_2);
					point_end_y_back.push(P_y[p-1]);
				
	 			 	street = new Street();
					street_back = new Street();
						
					street.RoadCenter(P_x[p-1],P_y[p-1],end_x_2,end_y_2);
					street_back.RoadCenter(end_x_2,end_y_2,P_x[p-1],P_y[p-1]);
					
					street_obj.push(street);
					street_back_obj.push(street_back);
					
					signal_street.push(street);
					signal_street_back.push(street_back);

					start_x = P_x[p-1];
					start_y = P_y[p-1];
					CreateSignalPointStart();
						
					if(connect_state_end == "on"){
						CreateSignalPointEnd();
					}
					
					if(connect_state_end == "off"){
						street.NextRoad(street_back,street_0,street_0);
						street.BackRoad(street_back,street_0,street_0);
					}
					
					cross_point_start_x.push(P_x[p-1]);
					cross_point_end_x.push(end_x_2);
					cross_point_start_y.push(P_y[p-1]);
					cross_point_end_y.push(end_y_2);
					
					start_x = start_back_x;
					start_y = start_back_y;
					end_x = end_back_x;
					end_y = end_back_y;
				}
				else{
					start_back_x = start_x;
					start_back_y = start_y;
					end_back_x = end_x;
					end_back_y = end_y;
					
					point_start_x.push(P_x[p-1]);
					point_end_x.push(P_x[p]);
					point_start_y.push(P_y[p-1]);
					point_end_y.push(P_y[p]);
							
					point_start_x_back.push(P_x[p]);
					point_end_x_back.push(P_x[p-1]);
					point_start_y_back.push(P_y[p]);
					point_end_y_back.push(P_y[p-1]);
				
	 		 		street = new Street();
					street_back = new Street();
						
					street.RoadCenter(P_x[p-1],P_y[p-1],P_x[p],P_y[p]);
					street_back.RoadCenter(P_x[p],P_y[p],P_x[p-1],P_y[p-1]);
					
					street_obj.push(street);
					street_back_obj.push(street_back);
					
					signal_street.push(street);
					signal_street_back.push(street_back);
					
					start_x = P_x[p-1];
					start_y = P_y[p-1];
					end_x = P_x[p];
					end_y = P_y[p];
					
					CreateSignalPointStart();
					CreateSignalPointEnd();
					signal_street.push(street);
		 			signal_street_back.push(street_back);
 				
					cross_point_start_x.push(P_x[p-1]);
					cross_point_end_x.push(P_x[p]);
					cross_point_start_y.push(P_y[p-1]);
					cross_point_end_y.push(P_y[p]);
							
					start_x = start_back_x;
					start_y = start_back_y;
					end_x = end_back_x;
					end_y = end_back_y;
				}
			}
			for(i=0;i<cross_street_turn.length;i++){
				start_back_x = start_x;
				start_back_y = start_y;
				end_back_x = end_x;
				end_back_y = end_y;
				
				point_start_x.push(point_start_x[cross_street_turn[i]]);
				point_end_x.push(P_x[i]);
				point_start_y.push(point_start_y[cross_street_turn[i]]);
				point_end_y.push(P_y[i]);
				
				
				point_start_x_back.push(P_x[i]);
				point_end_x_back.push(point_start_x[cross_street_turn[i]]);
				point_start_y_back.push(P_y[i]);
				point_end_y_back.push(point_start_y[cross_street_turn[i]]);
				
				cross_point_start_x.push(point_start_x[cross_street_turn[i]]);
				cross_point_end_x.push(P_x[i]);
				cross_point_start_y.push(point_start_y[cross_street_turn[i]]);
				cross_point_end_y.push(P_y[i]);
				

	 		 	
	 		 	street = new Street();
				street_back = new Street();
				
				street.RoadCenter(point_start_x[cross_street_turn[i]],point_start_y[cross_street_turn[i]],P_x[i],P_y[i]);
				street_back.RoadCenter(P_x[i],P_y[i],point_start_x[cross_street_turn[i]],point_start_y[cross_street_turn[i]]);
			
				street_obj.push(street);
				street_back_obj.push(street_back);
				
		 		signal_street.push(street);
				signal_street_back.push(street_back);
		 		
				point_start_x.push(P_x[i]);
				point_end_x.push(point_end_x[cross_street_turn[i]]);
				point_start_y.push(P_y[i]);
				point_end_y.push(point_end_y[cross_street_turn[i]]);
				
				
				point_start_x_back.push(point_end_x[cross_street_turn[i]]);
				point_end_x_back.push(P_x[i]);
				point_start_y_back.push(point_end_y[cross_street_turn[i]]);
				point_end_y_back.push(P_y[i]);
				
				cross_point_start_x.push(P_x[i]);
				cross_point_end_x.push(point_end_x[cross_street_turn[i]]);
				cross_point_start_y.push(P_y[i]);
				cross_point_end_y.push(point_end_y[cross_street_turn[i]]);
				
				
	 		 	street = new Street();
				street_back = new Street();
				
				street.RoadCenter(P_x[i],P_y[i],point_end_x[cross_street_turn[i]],point_end_y[cross_street_turn[i]]);
				street_back.RoadCenter(point_end_x[cross_street_turn[i]],point_end_y[cross_street_turn[i]],P_x[i],P_y[i]);
				
				street_obj.push(street);
				street_back_obj.push(street_back);

		 		signal_street.push(street);
				signal_street_back.push(street_back);
		 		
				start_x = start_back_x;
				start_y = start_back_y;
				end_x = end_back_x;
				end_y = end_back_y;
			}
			for(i=cross_street_delete.length-1;i>=0;i--){
				for(p=0;p<button_street.length;p++){
					if(button_street[p] == street_obj[cross_street_delete[i]]){
						this.removeChild(button_obj[p].movie_up);
						this.removeChild(button_obj[p].movie);
						this.removeChild(button_obj[p].text_obj.text_field);
						this.removeChild(button_obj[p].text_obj.movie);
						button_obj.splice(p,1);
						button_street.splice(p,1);
					}
				}
				point_start_x.splice(cross_street_delete[i],1);
				point_end_x.splice(cross_street_delete[i],1);
				point_start_y.splice(cross_street_delete[i],1);
				point_end_y.splice(cross_street_delete[i],1);
							
				point_start_x_back.splice(cross_street_delete[i],1);
				point_end_x_back.splice(cross_street_delete[i],1);
				point_start_y_back.splice(cross_street_delete[i],1);
				point_end_y_back.splice(cross_street_delete[i],1);
				
			for(var q:int=0;q<car_obj.length;q++){
				if(car_obj[q].current_street == street_obj[cross_street_delete[i]]){
					this.removeChild(car_obj[q].movie);
					car_obj.splice(q,1);
					q--;
					car_number--;
				}
			}
			for(var q:int=0;q<car_obj.length;q++){
				if(car_obj[q].current_street == street_back_obj[cross_street_delete[i]]){
					this.removeChild(car_obj[q].movie);
					car_obj.splice(q,1);
					q--;
					car_number--;
				}
			}
				street_obj.splice(cross_street_delete[i],1);
				street_back_obj.splice(cross_street_delete[i],1);

				signal_street.splice(cross_street_delete[i],1);
				signal_street_back.splice(cross_street_delete[i],1);
				

			}
		}
		public function SepaStreet():void{
		
			start_back_x = start_x;
			start_back_y =start_y;
			end_back_x = end_x;
			end_back_y = end_y;
			
			point_start_x_sepa = point_start_x[sepa];
			point_start_y_sepa = point_start_y[sepa];
			point_end_x_sepa = point_end_x[sepa];
			point_end_y_sepa = point_end_y[sepa];
			
			for(p=0;p<button_street.length;p++){
				if(button_street[p] == street_obj[sepa]){
					this.removeChild(button_obj[p].movie_up);
					this.removeChild(button_obj[p].movie);
					this.removeChild(button_obj[p].text_obj.text_field);
					this.removeChild(button_obj[p].text_obj.movie);
					button_obj.splice(p,1);
					button_street.splice(p,1);
				}
			}
			point_start_x.splice(sepa,1);
			point_end_x.splice(sepa,1);
			point_start_y.splice(sepa,1);
			point_end_y.splice(sepa,1);
							
			point_start_x_back.splice(sepa,1);
			point_end_x_back.splice(sepa,1);
			point_start_y_back.splice(sepa,1);
			point_end_y_back.splice(sepa,1);


		for(var q:int=0;q<car_obj.length;q++){
			if(car_obj[q].current_street == street_obj[sepa]){
				this.removeChild(car_obj[q].movie);
				car_obj.splice(q,1);
				q--;
				car_number--;
			}
		}
		for(var q:int=0;q<car_obj.length;q++){
			if(car_obj[q].current_street == street_back_obj[sepa]){
				this.removeChild(car_obj[q].movie);
				car_obj.splice(q,1);
				q--;
				car_number--;
			}
		}
			street_obj.splice(sepa,1);
			street_back_obj.splice(sepa,1);


			point_start_x.push(point_start_x_sepa);
			point_end_x.push(P_x[0]);
			point_start_y.push(point_start_y_sepa);
			point_end_y.push(P_y[0]);
			
				
			point_start_x_back.push(P_x[0]);
			point_end_x_back.push(point_start_x_sepa);
			point_start_y_back.push(P_y[0]);
			point_end_y_back.push(point_start_y_sepa);
				
			street = new Street();
			street_back = new Street();
				
			street.RoadCenter(point_start_x_sepa,point_start_y_sepa,P_x[0],P_y[0]);
			street_back.RoadCenter(P_x[0],P_y[0],point_start_x_sepa,point_start_y_sepa);
			
		 	street_obj.push(street);
		 	street_back_obj.push(street_back);
		 	
		 	start_x = point_start_x_sepa;
		 	start_y = point_start_y_sepa;
		 	CreateConnectStart();
		 	
			signal_street.push(street);
			signal_street_back.push(street_back);
	
			start_x = point_start_x_sepa;
			start_y = point_start_y_sepa;
			CreateConnectStart();
			
			end_x = P_x[0];
			end_y = P_y[0];
			CreateConnectEnd();
			
			point_start_x.push(P_x[0]);
			point_end_x.push(point_end_x_sepa);
			point_start_y.push(P_y[0]);
			point_end_y.push(point_end_y_sepa);
				
				
			point_start_x_back.push(point_end_x_sepa);
			point_end_x_back.push(P_x[0]);
			point_start_y_back.push(point_end_y_sepa);
			point_end_y_back.push(P_y[0]);
				
	 		street = new Street();
			street_back = new Street();
				
			street.RoadCenter(P_x[0],P_y[0],point_end_x_sepa,point_end_y_sepa);
			street_back.RoadCenter(point_end_x_sepa,point_end_y_sepa,P_x[0],P_y[0]);
				
			street_obj.push(street);
			street_back_obj.push(street_back);
		 
		 	signal_street.push(street);
			signal_street_back.push(street_back);

			end_x = point_end_x_sepa;
			end_y = point_end_y_sepa;
			CreateConnectEnd();
			
			
			start_x = start_back_x;
			start_y =start_back_y;
			end_x = end_back_x;
			end_y = end_back_y;

		}

	}
}