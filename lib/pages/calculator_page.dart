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
  String input = "";
  String display = "";

  String currOperator = "";

  // method to check its printed
  void isPrinted(int index){
    print("$index is Printed");
  }
  void addDigit(int number){
    setState(() {
      input = input + number.toString();
      display = input;
    });

  }
  void removeDigit(){
      setState(() {
        if(!total.isEmpty){
          input = input.substring(0, total.length-1);
          if(total.length == 0){
            input = "0";
          }
        } else{
          input = "0";
        }
        display = input;
      });
    
  }
  void clearDigit() {
    if (!total.isEmpty) {
      myCalculateController.setTotal(0);
      setState(() {
        total = "0";
        input = "";
      });
    }
  }
  void calculate(String operator){
    int secondNum =0;
    if(!total.isEmpty){
      secondNum = int.parse(input);
    }else{
      return;
    }

    setState(() {
      switch(currOperator){
        case "+":
          total = myCalculateController.addNum(secondNum);
          display = total;
          input = "";
          break;
        case "-":
          total = myCalculateController.subNum(secondNum);
          display = total;
          input = "";
          break;
        case "/":
          if(secondNum==0){
            display = "undefined";
            myCalculateController.setTotal(0);
            total = "0";
            input = "";
            break;
          }
          total = myCalculateController.divNum(secondNum);
          display = total;
          input = "";
          break;
        case "*":
          total = myCalculateController.mulNum(secondNum);
          display = total;
          input = "";
          break;
        case "=":
          myCalculateController.setTotal(secondNum);
          display = total;
          input = "";
          break;
        case "":
          myCalculateController.setTotal(secondNum);
          display = total;
          input = "";
          break;
        default:
          print("ERROR");
      }
    });
    currOperator = operator;
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
                      display,
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
                  }else if (index == 3){
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
                          calculate("+");
                        },
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  else if (index == 7) {
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
                          calculate("-");
                        },
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  else if (index == 11) {
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
                          calculate("/");
                        },
                        child: Center(
                          child: Text(
                            "/",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  else if (index == 15) {
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
                          calculate("*");
                        },
                        child: Center(
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  else if (index == 19) {
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
                          calculate("=");
                        },
                        child: Center(
                          child: Text(
                            "=",
                            style: TextStyle(
                              fontSize: 30,
                            ),
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