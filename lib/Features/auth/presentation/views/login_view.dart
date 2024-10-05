import 'package:e_commerce_shop_smart/Features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/loading_manager.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/LoginScreen';
  const LoginView({super.key});
  final bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: LoadingManager(
          isLoading: _isLoading,
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(child: LoginViewBody())),
        ),
      ),
    );
  }
}
