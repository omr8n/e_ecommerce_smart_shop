import 'package:e_commerce_shop_smart/core/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

import '../forgot_password.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
        },
        child: const SubtitleTextWidget(
          label: "Forgot password?",
          textDecoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
