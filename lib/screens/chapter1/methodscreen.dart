import 'package:flutter/material.dart';
import 'bisectionscreen.dart';
import 'falsepositionscreen.dart';
class ChapterOneMethods extends StatefulWidget {
  const ChapterOneMethods({super.key});

  @override
  State<ChapterOneMethods> createState() => _ChapterOneMethodsState();
}

class _ChapterOneMethodsState extends State<ChapterOneMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Chapter One',
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
                      "Please choose which method you want to use",
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
                      child: TextButton(
                          onPressed:
                              (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BisectionScreen()));
                          },
                          child:
                          Text(
                            'Bisection Method',
                            style: TextStyle(
                              color: Colors.white,
                            ),


                          )),
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FalsePosMethod()));

                              },
                          child:
                          Text(
                            'False Position Method',
                            style: TextStyle(
                              color: Colors.white,
                            ),


                          )),
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
                              (){},
                          child:
                          Text(
                            'Simple Fixed Point Method',
                            style: TextStyle(
                              color: Colors.white,
                            ),


                          )),
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
                              (){},
                          child:
                          Text(
                            'Newton Method',
                            style: TextStyle(
                              color: Colors.white,
                            ),


                          )),
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
                              (){},
                          child:
                          Text(
                            'Secant Method',
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
    );
  }
}
