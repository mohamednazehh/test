import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:numericalanalysis/form/FormScreen.dart';

import '../../matrix/matrixview.dart';
//Main Screen for the chapter one
class MatrixViewScreen extends StatelessWidget {
  static const String routeName = 'matrix view screen';
  List<String> methods = ['Cramer.png' , 'LU.png' , 'GaussJordan.png' , 'Gauss.png'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg' ,),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //to slide the select buttons
            CarouselSlider(
              items: methods.map((method) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MatrixScreen.routeName , arguments: method.substring(0,method.length-4));
                  },
                  child: Center(child: Image.asset('assets/images/$method' , height: double.infinity,),))).toList(),
              options: CarouselOptions(
                height: 550,
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                scrollDirection: Axis.vertical,
              ),
            )
          ],
        ),
      ),
    );
  }
}