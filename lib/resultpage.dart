import "package:flutter/material.dart";
import 'package:syncfusion_flutter_gauges/gauges.dart';
class resultPage extends StatefulWidget {
  double d;
   resultPage(this.d);

  @override
  State<resultPage> createState(){ return _resultPageState(this.d);
}}

class _resultPageState extends State<resultPage> {
  late double d;
  _resultPageState(this.d);
  @override
  void initState() {
    print(d);

    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("BMI Result"),
      ),
      body: Column(children: [
      Text("$d")
      ]),
      
    );
  }
  
}
class ResultPage extends StatefulWidget {
 final double value;
 var n;
   ResultPage({super.key,required this.value});
  @override
  State<ResultPage> createState() => _ResultPageState();

}

class _ResultPageState extends State<ResultPage> {
   late double bmiValue;
   double bmiValue1=0;
  String level="";
  String lateV="" ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Future.delayed(const Duration(seconds: 2),(){
        setState(() {
          lateV="$bmiValue1";
        });
       });
    setState(() {
      bmiValue = widget.value;
      bmiValue1=double.parse(bmiValue.toStringAsFixed(2));
    });
      range(bmiValue);
  } 
   range(n){
    var value = "";
   if(n<=18.5){
    value = "Under Weight ";
   }else if((n>= 18.6) && (n<= 25)) {
    value = "Normal";
   } else if((n>25)&&(n<=30)){
    value = "Over Weighted";
   }else if ((n>30)&&(n<=40)){
    value = "Obesity";
   }
  print("ff $value");
   setState(() {
     level = value;
        });
   }
   lateValue(){
    
   }

  @override
 
  Widget build(BuildContext context) {
  
  
     return Scaffold(
      appBar:AppBar(
        title: Text("BMI Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
     
      Container(
        
          child: SfRadialGauge(
            enableLoadingAnimation: true,animationDuration: 200,
          axes: <RadialAxis>[
          RadialAxis(minimum: 10, maximum: 40,axisLineStyle: AxisLineStyle(thickness: 40, gradient: SweepGradient(colors: [Colors.red.shade800,Colors.red])),
            ranges: <GaugeRange>[
              
              GaugeRange(startValue: 10,endValue: 18.5,color: Colors.red,startWidth: 20,endWidth: 20 ,label: "Under Weight" ,),
              GaugeRange(startValue: 18.5, endValue: 25, color:Colors.green,startWidth: 20,endWidth: 20,label: "Healthy Weight",),
              GaugeRange(startValue: 25,endValue: 30,color: Colors.orange,startWidth: 20,endWidth: 20,label: "Over Weight",),
              GaugeRange(startValue: 30,endValue: 40,color: Colors.red,startWidth: 20,endWidth: 20 ,label: "Obesity",)],
            pointers: <GaugePointer>[
              NeedlePointer(value: bmiValue,enableAnimation:true,animationDuration: 2000,)],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(widget: Container(child: 
                 Center(child: Text("BMI Range\n $level",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)))),
                 angle: 90, positionFactor: 0.6
              )]
          )])
      ),
       Container(child:Text("BMI Ratio: $lateV",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500 )))
      ]),
      
    );
  }
}