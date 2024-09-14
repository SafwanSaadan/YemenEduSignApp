// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {required this.label,
      required this.type,
      this.controller,
      this.validate,
      this.isPassword,
      this.onSubmit,
      this.onChange,
      this.prefix,
      this.suffix,
      this.fieldRadius,
      this.colorBorderSide,
      super.key});

  TextEditingController? controller;
  String label;
  TextInputType type;
  bool? isPassword;
  Function? onSubmit;
  Function? onChange;
  String? validate;
  IconData? prefix;
  IconData? suffix;
  double? fieldRadius;
  Color? colorBorderSide;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword == null ? false : isPassword!,
      onFieldSubmitted: (String value) {
        onSubmit;
      },
      onChanged: (String value) {
        onChange;
      },
      validator: (value) {
        if (value!.isEmpty) return validate;
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(fieldRadius == null ? 8 : fieldRadius!),
            borderSide: BorderSide(
                color:
                    colorBorderSide == null ? Colors.grey : colorBorderSide!)),
      ),
    );
  }
}
