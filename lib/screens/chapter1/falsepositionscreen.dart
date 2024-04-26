import 'package:flutter/material.dart';
import '../../constant/components.dart';
class FalsePosMethod extends StatefulWidget {

  FalsePosMethod({super.key});

  @override
  State<FalsePosMethod> createState() => _FalsePosMethodState();
}

class _FalsePosMethodState extends State<FalsePosMethod> {
  late String fx;

  late double xl;

  late double xu;

  late double eps;

  var fx_controller = TextEditingController();

  var xl_controller = TextEditingController();

  var xu_controller = TextEditingController();

  var eps_controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'False Position',
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
      body: Container(
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
                            print(fx);
                          },
                          onChange: (String value){
                            fx=value;
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
                            xl = double.parse(value);
                            print(xl);
                          },
                          onChange: (String value){
                            xl = double.parse(value);
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
                            xu = double.parse(value);
                            print(xu);
                          },
                          onChange: (String value){
                            xu = double.parse(value);
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
                            print(eps);
                          },
                          onChange: (String value){
                            eps = double.parse(value);
                          }

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
