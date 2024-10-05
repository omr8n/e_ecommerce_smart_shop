import 'package:e_commerce_shop_smart/Features/auth/presentation/views/widgets/login_body_view_form.dart';
import 'package:e_commerce_shop_smart/Features/auth/presentation/views/widgets/or_connect_using.dart';
import 'package:e_commerce_shop_smart/core/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/title_text.dart';
import '../../../../home/presentation/views/widgets/app_name_text.dart';

import '../register_view.dart';
import 'button_login_and_rigister.dart';
import 'forget_password_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          const AppNameTextWidget(
            fontSize: 30,
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: TitlesTextWidget(label: "Welcome back"),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const LoginBodyViewForm(),
          const SizedBox(
            height: 16.0,
          ),
          const ForgetPasswordButton(),
          const SizedBox(
            height: 16.0,
          ),
          ButtonLoginAndRegister(
            text: "Login",
            icon: const Icon(Icons.login),
            onPressed: () {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          SubtitleTextWidget(
            label: "OR connect using".toUpperCase(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const OrConnectUsing(),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SubtitleTextWidget(
                label: "Don't have an account?",
              ),
              TextButton(
                child: const SubtitleTextWidget(
                  label: "Sign up",
                  textDecoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterView.routeName);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
