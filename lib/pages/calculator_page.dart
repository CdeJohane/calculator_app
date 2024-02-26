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

  // Methods For calcualtion Based off of Press

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
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
                      fontSize: 75,
                    ),
                  ),
                ),
              ),
            ),

            // Grid For the Numbers
          ],
        ),
      ),
    );
  }
}