import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final bool? isPassword;
  final String? hintText;
  final String formProperty;
  final Map<String, String>? formValues;
  final TextEditingController? controller;
  final String? rePassword;
  final TextInputType? inputType;

  const InputForm(
      {Key? key,
      this.isPassword,
      this.hintText,
      this.controller,
      required this.formProperty,
      this.formValues,
      this.rePassword,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: isPassword != null ? controller : null,
      textCapitalization: isPassword == null
          ? TextCapitalization.none
          : TextCapitalization.words,
      obscureText: isPassword != null ? true : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        formValues?[formProperty] = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es requerido';
        }
        if (isPassword != null && value.length < 8) {
          return 'Debe ingresar al menos 8 caracteres';
        }
      },
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: const BorderSide(),
          )),
    );
  }
}
