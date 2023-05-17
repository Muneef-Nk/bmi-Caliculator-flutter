import 'package:flutter/material.dart';

class MessageBMI extends StatelessWidget {

  final Color msgColor;
  final String bmiCout;
  final String  status;
  MessageBMI({
    required this.msgColor,
    required this.bmiCout,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.width*0.20,
      // width: MediaQuery.of(context).size.width*0.90,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
             Text(
              'BMI = $bmiCout',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: msgColor
              ),
            ),
          SizedBox(height: 10,),

          Text(status,  style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: msgColor
          ), ),
        ],
      ),
    );
  }
}

