import 'package:aplicativo_firebase/Model/Data.dart';
import 'package:aplicativo_firebase/Provider/Service.dart';
import 'package:aplicativo_firebase/Widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormState();
}

class _FormState extends State<Forms> {
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final DataM = Data();

  final formKey = GlobalKey<FormState>();
  final services = Services();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _autovalidateMode,
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Form Information',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTextFormField(
                initialValue: "",
                names: "Name :",
                onSaved: saveName,
                validator: validatorName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
                initialValue: "",
                names: "Lastname :",
                onSaved: savelastname,
                validator: validatorlastname),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
                initialValue: "",
                names: "Days :",
                onSaved: saveDays,
                validator: validatorDays),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
                initialValue: "",
                names: "Num of cigarettes :",
                onSaved: saveCigarettes,
                validator: validatorCigarettes),
          ),
          createBoton()
        ],
      ),
    );
  }

  void saveDays(String? value) {
    if (value != null) {
      DataM.days = value;
    }
  }

  String? validatorDays(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter days';
    }

    return null;
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

  void savelastname(String? value) {
    if (value != null) {
      DataM.lastname = value;
    }
  }

  String? validatorlastname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your lastname';
    }

    return null;
  }

  void saveCigarettes(String? value) {
    if (value != null) {
      DataM.cigarettes = value;
      validateStatus(value);
    }
  }

  String? validatorCigarettes(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter num of Cigarettes';
    }

    return null;
  }

  Widget createBoton() {
    return ElevatedButton.icon(
      onPressed: _submit,
      icon: const Icon(Icons.save),
      label: const Text("Guardar"),
    );
  }

  void validateStatus(String valur) {
    int? validate = int.parse(valur);

    if (validate >= 5) {
      DataM.status = 1;
    } else {
      DataM.status = 2;
    }
  }

  void _submit() {
    formKey.currentState!.save();

    // print(DataM.toJson());
    if (formKey.currentState!.validate()) {
      //
      // print(DataM.toJson());
      services.save(DataM);
      
      print("guardado");
    
    }
  }
}
