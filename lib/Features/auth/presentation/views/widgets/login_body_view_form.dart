import 'package:e_commerce_shop_smart/core/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/utils/my_validators.dart';
import 'button_login_and_rigister.dart';
import 'forget_password_button.dart';
import 'or_connect_using.dart';

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
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      // try {
      //   setState(() {
      //     _isLoading = true;
      //   });
      //   await auth.signInWithEmailAndPassword(
      //     email: _emailController.text.trim(),
      //     password: _passwordController.text.trim(),
      //   );
      //   Fluttertoast.showToast(
      //     msg: "Login Successful",
      //     toastLength: Toast.LENGTH_SHORT,
      //     textColor: Colors.white,
      //   );
      //   if (!mounted) return;

      //   Navigator.pushReplacementNamed(context, RootScreen.routName);
      // } on FirebaseAuthException catch (error) {
      //   await MyAppMethods.showErrorORWarningDialog(
      //     context: context,
      //     subtitle: "An error has been occured ${error.message}",
      //     fct: () {},
      //   );
      // } catch (error) {
      //   await MyAppMethods.showErrorORWarningDialog(
      //     context: context,
      //     subtitle: "An error has been occured $error",
      //     fct: () {},
      //   );
      // } finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      // }
    }
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
              _loginFct();
            },
          ),
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
          const OrConnectUsing(),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
