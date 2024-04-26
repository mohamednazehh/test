import 'package:flutter/material.dart';
import '../../constant/components.dart';

import '../../models/Bisection.dart';
import '../result/resultscreen.dart';

class BisectionScreen extends StatefulWidget {
  BisectionScreen({super.key});

  @override
  State<BisectionScreen> createState() => _BisectionScreenState();
}

class _BisectionScreenState extends State<BisectionScreen> {
/*-------------Variables----------------*/
  late String fx;

  late double xlI;

  late double xuI;

  late double eps;

  var fx_controller = TextEditingController();

  var xl_controller = TextEditingController();

  var xu_controller = TextEditingController();

  var eps_controller=TextEditingController();

  Bisection? b;

  /*------------UI design--------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Bisection',
          style: TextStyle(
            color: Colors.blueGrey,
            fontStyle: FontStyle.italic,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.blueGrey,
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter the required inputs",
                        style:TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration:BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:defualtFromField(
                          controller:fx_controller,
                          keyboardType:TextInputType.text,
                          lable: 'F(x)',
                          onSumbit: (String value){
                            fx = value;
                            b?.equation=fx;
                            print(fx);
                          },
                          onChange: (String value){
                            fx=value;
                            b?.equation=fx;

                          }

                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration:BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:defualtFromField(
                            controller:xl_controller,
                            keyboardType:TextInputType.text,
                            lable: 'Xl',
                            onSumbit: (String value){
                              xlI = double.parse(value);
                              b?.xlI=xlI;
                              print(xlI);
                            },
                            onChange: (String value){
                              xlI = double.parse(value);
                              b?.xlI=xlI;

                            }

                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration:BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:defualtFromField(
                            controller:xu_controller,
                            keyboardType:TextInputType.text,
                            lable: 'Xu',
                            onSumbit: (String value){
                              xuI = double.parse(value);
                              b?.xuI=xuI;
                              print(xuI);
                            },
                            onChange: (String value){
                              xuI = double.parse(value);
                              b?.xuI=xuI;

                            }

                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration:BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:defualtFromField(
                            controller:eps_controller,
                            keyboardType:TextInputType.text,
                            lable: 'Error',
                            onSumbit: (String value){
                              eps = double.parse(value);
                              b?.eps=eps;
                              print(eps);
                            },
                            onChange: (String value){
                              eps = double.parse(value);
                              b?.eps=eps;
                            }

                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration:BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                            onPressed:
                                (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResultScreen()));
                            },
                            child:
                            Text(
                              'Calculate',
                              style: TextStyle(
                                color: Colors.white,
                              ),


                            )),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
