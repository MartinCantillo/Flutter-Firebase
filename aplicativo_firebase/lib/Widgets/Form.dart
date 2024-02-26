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
      DataM.id = value;
    }
  }

  String? validatorDays(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your code';
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
      DataM.name = value;
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
      DataM.name = value;
    }
  }

  String? validatorCigarettes(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your lastname';
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

  void _submit() {
    formKey.currentState!.save();

    // productoProvider.crearproductos(productM);

    if (formKey.currentState!.validate()) return;
  }
}
