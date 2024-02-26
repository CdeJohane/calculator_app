// ignore_for_file: prefer_const_constructors

import 'package:calculator_app/controllers/calculateController.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage ({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // Variable for Total
  CalculateController myCalculateController = CalculateController();
  TextEditingController myTextEditingController = TextEditingController();
  String total = "0";
  

  // method to check its printed
  void isPrinted(int index){
    print("$index is Printed");
  }
  void addDigit(int number){
    setState(() {
      total = total + number.toString();
    });
  }
  void removeDigit(){
    if(!total.isEmpty){
      setState(() {
        total = total.substring(0, total.length-1);
      });
    }
  }
  void clearDigit() {
    if (!total.isEmpty) {
      myCalculateController.setTotal(0);
      setState(() {
        total = "";
      });
    }
  }


  // Methods For calcualtion Based off of Press

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 135,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Center(
                    child: Text(
                      total,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 55,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Grid For the Numbers and operators
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
                itemBuilder:(context, index) {
                  //If Statements
                  if(index<=2){
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                      )
                    );
                  }else if(index>3 && index<7){
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                        border: Border.all(
                          width: 3,
                          color: Colors.black26,
                        )
                      ),
                      child: GestureDetector(
                        onTap: () {
                          addDigit(index + 3);
                        },
                        child: Center(
                          child: Text(
                            (index+3).toString(), 
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }else if (index > 7 && index < 11) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                        border: Border.all(
                          width: 3,
                          color: Colors.black26,
                        )
                      ),
                      child: GestureDetector(
                        onTap: () {
                          addDigit(index - 4);
                        },
                        child: Center(
                          child: Text(
                            (index-4).toString(), 
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }else if (index > 11 && index < 15) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                        border: Border.all(
                          width: 3,
                          color: Colors.black26,
                        )
                      ),
                      child: GestureDetector(
                        onTap: () {
                          addDigit(index -11);
                        },
                        child: Center(
                          child: Text(
                            (index-11).toString(), 
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }else if (index == 16) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                        border: Border.all(
                          width: 3,
                          color: Colors.black26,
                        )
                      ),
                      child: GestureDetector(
                        onTap: () {
                          addDigit(0);
                        },
                        child: Center(
                          child: Text(
                            "0", 
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }else if(index==17){
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                            width: 3,
                            color: Colors.black26,
                          )),
                      child: GestureDetector(
                        onTap: () {
                          removeDigit();
                        },
                        child: Center(
                          child: Icon(Icons.backspace, color: Colors.black,),
                        ),
                      ),
                    );
                  }else if(index==18){
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                            width: 3,
                            color: Colors.black26,
                          )),
                      child: GestureDetector(
                        onTap: () {
                          clearDigit();
                        },
                        child: Center(
                          child: Icon(
                            Icons.cancel,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }
                  else{
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                            width: 3,
                            color: Colors.black26,
                          )),
                      child: GestureDetector(
                        onTap: () {
                          isPrinted(index);
                        },
                        child: Center(
                          child: Text(
                            "Null",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}