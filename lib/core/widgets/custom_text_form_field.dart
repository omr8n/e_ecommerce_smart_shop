import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.focusNode,
      this.onFieldSubmitted,
      this.textInputActionl,
      this.keyboardType,
      this.obscureText = false,
      this.prefixIcon,
      this.validator,
      this.hintText,
      this.suffixIcon,
      required TextInputAction textInputAction});
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputAction? textInputActionl;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputActionl,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
