import 'package:e_commerce_shop_smart/core/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/utils/my_validators.dart';

class LoginBodyViewForm extends StatefulWidget {
  const LoginBodyViewForm({super.key});

  @override
  State<LoginBodyViewForm> createState() => _LoginBodyViewFormState();
}

class _LoginBodyViewFormState extends State<LoginBodyViewForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  final bool isLoading = false;

  /// final auth = FirebaseAuth.instance;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // Focus Nodes
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // Focus Nodes
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email address",
            prefixIcon: const Icon(
              IconlyLight.message,
            ),
            validator: (value) {
              return MyValidators.emailValidator(value);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextFormField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            hintText: "*********",
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(
              IconlyLight.message,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (value) {
              return MyValidators.passwordValidator(value);
            },
            onFieldSubmitted: (value) {
              // _loginFct();
            },
          ),
        ],
      ),
    );
  }
}
