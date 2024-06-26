import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../calculator/CalcScreenView.dart';
import '../constant/components.dart';
import '../provider/EquationProvider.dart';
import 'FormScreenViewModel.dart';
import 'FromNavigator.dart';

class FormScreen extends StatefulWidget {
  static const String routeName = 'Form Screen';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> implements FormNavigator{
  FormScreenViewModel viewModel = FormScreenViewModel();
  final formKey = GlobalKey<FormState>();
  var xlController = TextEditingController();
  var xuController = TextEditingController();
  var xController = TextEditingController();
  var xOfIMin1Controller = TextEditingController();
  var xOfIlController = TextEditingController();
  var errorController = TextEditingController();
  var iterationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }
  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
  }

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context)?.settings.arguments as String;
    var provider = Provider.of<EquationsProvider>(context , listen: false);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        decoration:const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg' ,),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                if (title == "Bisection" || title == 'FalsePosition') ...[
                  myTextFormField("XL" , viewModel.isValid , xlController),
                  myTextFormField("XU" , viewModel.isValid , xuController),
                ] else if (title == "SampleFixedPoint" || title == "Newton") ...[
                  myTextFormField("X" , viewModel.isValid , xController),
                ] else ...[
                  myTextFormField("X of i-1" , viewModel.isValid , xOfIMin1Controller),
                  myTextFormField("X of i" , viewModel.isValid , xOfIlController),
                ],
                myTextFormField('Error' , viewModel.isValid , errorController),
                myTextFormField('Number Of iterations (Optional)' , viewModel.isValidIteration , iterationController),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {viewModel.goToMainScreen(provider);},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(MyTheme.green),
                          ),
                          child: const Icon(Icons.navigate_before)),
                      ElevatedButton(
                          onPressed: () {
                            viewModel.goToHomeScreen(
                              formKey.currentState!.validate() ,
                              provider,
                              type: title ,
                              x: xController.text,
                              xl: xlController.text,
                              xu: xuController.text,
                              xOfI: xOfIlController.text,
                              xOfIMin1: xOfIMin1Controller.text,
                              error: errorController.text,
                              numberOfIterations: iterationController.text,
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(MyTheme.green),
                          ),
                          child: const Icon(Icons.navigate_next))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myTextFormField(String hintText , Function validator , TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(20),
      //input Text
      child: TextFormField(
        validator:(value)=> validator(value),
        controller: controller,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        cursorColor: Colors.grey,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9,.,-]+')),
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: MyTheme.green,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          contentPadding: const EdgeInsets.all(20),
          errorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3, color: MyTheme.red)),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3, color: MyTheme.grey)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3, color: MyTheme.grey)),
          disabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3, color: MyTheme.grey)),
        ),
      ),
    );
  }

  @override
  void goToHomeScreen() {
    Navigator.pushNamed(context, CalculatorScreen.routeName);
  }

  @override
  void goToMainScreen() {
    Navigator.pop(context);
  }
}