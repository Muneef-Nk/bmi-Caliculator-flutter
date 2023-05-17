import 'package:bmi_calculator/bmimessage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _result = '';
  bool messageColor = false;
  bool messageColor1 = false;
  bool messageColor2 = false;
  bool messageColor3 = false;

  String normal = '';

  var _weightcontroller = TextEditingController();
  var _heightcontroller = TextEditingController();

  void checkbmi() {
    double weight = double.parse(_weightcontroller.text);
    double height = double.parse(_heightcontroller.text) / 100;
    double heightSqure = height * height;
    double result = weight / heightSqure;
    String finalResult = result.toStringAsFixed(4);
    _result = finalResult;

    setState(() {
      if (result > 18.5 && result < 24.9) {
        String normal1 = 'You are Healthy';
        normal = normal1;
        messageColor = true;
        // green color
      } else if (result > 24.9 && result < 29.9) {
        String normal1 = 'Overweight';
        normal = normal1;
        messageColor1 = true;
        // orange color
      } else if (result < 18.5) {
        String normal1 = 'Underweight';
        normal = normal1;
        messageColor2 = true;
        // blue color
      } else {
        String normal1 = 'Obesity';
        normal = normal1;
        messageColor3 = true;
        //red color
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: AssetImage('images/healthy.jpg'),
                fit: BoxFit.cover,
                opacity: 120,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'BMI CALCULATOR',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 120,
                ),
                TextField(
                  controller: _weightcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Weight (KG)'),
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Enter your weight (KG)',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _heightcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Height (CM)'),
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Enter your height (CM)',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    checkbmi();
                    showModalBottomSheet(
                        elevation: 3,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        context: context,
                        builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            margin: EdgeInsets.only(top: 30),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/healthy.jpg'))),
                            child: Column(
                              children: [
                                messageColor
                                    ? MessageBMI(
                                        msgColor: Colors.green,
                                        bmiCout: _result,
                                        status: normal,
                                      )
                                    : messageColor1
                                        ? MessageBMI(
                                            msgColor: Colors.orange,
                                            bmiCout: _result,
                                            status: normal,
                                          )
                                        : messageColor2
                                            ? MessageBMI(
                                                msgColor: Colors.blue,
                                                bmiCout: _result,
                                                status: normal,
                                              )
                                            : messageColor3
                                                ? MessageBMI(
                                                    msgColor: Colors.red,
                                                    bmiCout: _result,
                                                    status: normal,
                                                  )
                                                : Text(''),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 9,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Underweight',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 10,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Healthy',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      radius: 10,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Overweight',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 10,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'obesity',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('close'))
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Check BMI',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
