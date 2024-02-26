import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? initialValue;
  final String? names; 
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    this.initialValue,
    this.names, 
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: names ?? "",
        labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
