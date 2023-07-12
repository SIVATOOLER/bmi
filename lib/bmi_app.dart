import 'package:bmi_app/resultpage.dart';
import 'package:flutter/material.dart';
const List<String> list = <String>["cm","inches"];
 const List<String> list1=<String>["kg","pounds"];


class bmiApp extends StatefulWidget {
  const bmiApp({super.key});

  @override
  State<bmiApp> createState() => _bmiAppState();
}

class _bmiAppState extends State<bmiApp> {
  var dropdownValue1=list1.first;
    var dropdownValue = list.first;
    TextEditingController heightcontroller=TextEditingController();
    TextEditingController weightcontroller=TextEditingController();
    TextEditingController agecontroller=TextEditingController();
    double hvalue=0.0;
    double wvalue=0.0;
    double bmiValue =0.0;
  //  double weightValue=0.0;
   double heightsq=0.0;
    int oncolor=0;
   calculation(){
     dropdownValue1 =="kg"? 
      wvalue=(double.parse(weightcontroller.text)):
      wvalue=(double.parse(weightcontroller.text))* 0.453592;
    print("weight""$wvalue");
     dropdownValue =="cm"? hvalue=(double.parse(heightcontroller.text))*0.01:
    hvalue=(int.parse(heightcontroller.text))*0.0254; 
    print("height""$hvalue");
    heightsq=hvalue*hvalue;
       bmiValue=(wvalue/heightsq);
       Navigator.push(context, MaterialPageRoute(builder: ((context) => ResultPage(value: bmiValue) )));
       print("BMI $bmiValue");
   }
  @override
 
  Widget build(BuildContext context) {
    double heightof = MediaQuery.of(context).size.height;
     double widthof = MediaQuery.of(context).size.width;
  
    return Scaffold( 
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height:heightof ,
      
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Stack(
                   children: [Text("BMI",style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.w600 ,fontStyle:
                     FontStyle.italic,
                     foreground: Paint()
                      ..style=PaintingStyle.stroke
                      ..strokeWidth=4
                      ..color=Colors.blue.shade900
                      ),),
                      Text("BMI",style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.w600 ,fontStyle:
                     FontStyle.italic,
                     color: Colors.blue[100]
                     )),Text("\n\nCalculator",style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color:Colors.blue[900],),),         
                      ]
                  ),
                  Spacer(),
                   CircleAvatar(
                                 radius: 23,
                                 backgroundColor: Colors.blue[100],
                                 child: Text("%",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                               )
                ],
              ),
              
               Row(
                 children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                     child: Image.asset("assets/images/cartoon.jpg"),
                    ),
                  ),
                   Column(
                   // mainAxisAlignment: MainAxisAlignment.sp,
                     children: [
                       Align(
                        alignment: Alignment.centerRight,
                         child: Container(
                          width: 130,
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gender:",style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w400
                              ),),
                            Container(
                             
                              height: 44,
                              width: 128,
                             
                              decoration: BoxDecoration(
                              
                                border:Border.all(
                                color: Colors.grey.shade600,
                                width: 2
                                
                              )),
                             // color: Colors.blue,
                              child: Row(
                                  children:[
                                    GestureDetector(
                                      onTap: ()=>setState(()=> oncolor=1),
                                      child: Container(
                                      height: 40,
                                      width: 40,
                                        color: oncolor==1 ?Colors.grey[400]:Colors.transparent,
                                        child: Icon(Icons.male),
                                      ),
                                    ),
                                    Container(
                                    width: 2,
                                      color: Colors.grey.shade600),
                                    GestureDetector(
                                      onTap: ()=>setState(()=> oncolor=2),
                                      child: Container(
                                      height: 40,
                                      width: 40,
                                        color: oncolor==2 ?Colors.grey[400]:Colors.transparent,
                                        child: Icon(Icons.female),
                                      ),
                                    ),
                                    Container(
                                      width: 2,
                                      color: Colors.grey.shade600,),    
                                    GestureDetector(
                                      onTap: ()=>setState(()=> oncolor=3),
                                      child: Container(
                                      height: 40,
                                      width: 40,
                                        color: oncolor==3 ?Colors.grey[400]:Colors.transparent,
                                        child: Icon(Icons.transgender),
                                      ),
                                    ),
                                  ],
                               ),
                             ),
                            ],
                          ),
                         ),
                       ),
                       Align(
                        alignment: Alignment.centerRight,
                         child: Container(
                          width: 130,
                                               // color: Colors.amber,
                          child:Column(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Age:")),
                            Material(
                            elevation:20.20,
                              shadowColor: Colors.blue[300],
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: agecontroller,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400,),
                              decoration: InputDecoration(
                                  border:OutlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white, ),
                                    borderRadius: BorderRadius.circular(2)),
                                ),
                            ),
                            )
                          ],)
                         ),
                       ),
                       Align(
                        alignment: Alignment.centerRight,
                         child: Container(
                          width: 130,
                        
                          child:Column(children: [
                            Row(
                              children: [
                                Text("Height:"),
                                Spacer(),
                               DropdownButton<String>(
                                                 value: dropdownValue,
                                                      icon: const Icon(Icons.arrow_drop_down),
                                                            style: const TextStyle(color: Colors.blueGrey),
                                   onChanged: (String? value) {
                                    setState(() {
                                    dropdownValue = value!;
                                  });
                                  },
                                  items: list.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                  }).toList(),
                                  )
                                                      ],
                            ),
                            Material(
                            elevation:20.20,
                              shadowColor: Colors.blue[300],
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: heightcontroller,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400,),
                            
                            //  style: TextStyle(color: Colors.amber
                              decoration: InputDecoration(
                                  border:OutlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white, ),
                                    borderRadius: BorderRadius.circular(2)),
                                ),
                            
                            ),
                            )
                          ],)
                         ),
                       ),
                       Align(
                        alignment: Alignment.centerRight,
                         child: Container(
                          width: 130,
                        // color: Colors.amber,
                          child:Column(children: [
                            Row(
                              children: [
                                Text("Weight:"),
                                Spacer(),
                               DropdownButton<String>(
                                value: dropdownValue1,
                                icon: const Icon(Icons.arrow_drop_down),
                                
                                style: const TextStyle(color: Colors.blueGrey),
                                onChanged: (String? value) {
                                setState(() {
                                  dropdownValue1 = value!;
                                });
                                },
                                items: list1.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                )
                              ],
                            ),
                            Material(
                            elevation:20.20,
                              shadowColor: Colors.blue[300],
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: weightcontroller,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400,),
                            
                            //  style: TextStyle(color: Colors.amber
                              decoration: InputDecoration(
                                  border:OutlineInputBorder(
                                  borderSide: BorderSide(color:Colors.white, ),
                                    borderRadius: BorderRadius.circular(2)),
                                ),
                            ),
                            )
                          ],)
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
               Container(
                width:double.infinity,
               //color: Colors.blue[800],
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800]
                  ),
                  onPressed: (){
          
                    if(heightcontroller.text.isEmpty||hvalue >= 2.57 ||weightcontroller.text.isEmpty||wvalue>=650){
                       ScaffoldMessenger.of( context).showSnackBar( const SnackBar(content: Text("please Enter The Values (or)\n Check The Enter Value"))) ;
                    }else{
                     calculation();} 
                  }, child: Text("Calculate",
                 style: TextStyle(color: Colors.white,fontSize: 20),
                  )),
               )
            ],
          ),
        ),
      ),
    ),
       );
  }
}