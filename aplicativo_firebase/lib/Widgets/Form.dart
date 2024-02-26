import 'package:aplicativo_firebase/Model/Data.dart';
import 'package:aplicativo_firebase/Widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormState();
}

class _FormState extends State<Forms> {
  final DataM = Data();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
                initialValue: "Please enter your name",
                names: "Name :",
                onSaved: saveName,
                validator: validatorName),
          )
        ],
      ),
    );
  }

  void saveName(String? value) {
    if (value != null) {
      DataM.name = value;
    }
  }

  String? validatorName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }
}
