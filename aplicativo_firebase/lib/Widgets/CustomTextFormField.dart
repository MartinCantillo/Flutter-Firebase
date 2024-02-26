import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? initialValue;
  final String? name;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key, this.initialValue, this.name, this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.initialValue,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: name != null ? name! : "",
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
