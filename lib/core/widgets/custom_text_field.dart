// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTapSuffixIcon,
  });
  final String hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTapSuffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hint,
        // hintStyle: AppStyles.styleRegular16(context).copyWith(
        //   color: const Color(0xFFAAAAAA),
        // ),
        fillColor: const Color(0xFFFAFAFA),
        filled: true,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          // onTap: () {
          //   // setState(() {
          //    //controller.clear();
          // FocusScope.of(context).unfocus();
          //   // });
          // },
          onTap: onTapSuffixIcon,
          child: const Icon(
            Icons.clear,
            color: Colors.red,
          ),
        ),
        // border: buildBorder(),
        // errorBorder: buildBorder(),
        // enabledBorder: buildBorder(),
        // focusedBorder: buildBorder(),
      ),
    );
  }

  // OutlineInputBorder buildBorder() {
  //   return OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(12),
  //     borderSide: const BorderSide(
  //       width: 5,
  //       color: Color(0xFFFAFAFA),
  //     ),
  //   );
  // }
}
