import 'package:flutter/material.dart';

class ButtonLoginAndRegister extends StatelessWidget {
  const ButtonLoginAndRegister({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });
  final String text;
  final void Function()? onPressed;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          // backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        //  icon: const Icon(Icons.login),
        icon: icon,
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        // onPressed: () async {
        //   //_loginFct();
        // },
        onPressed: onPressed,
      ),
    );
  }
}
