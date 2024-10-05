import 'package:e_commerce_shop_smart/Features/auth/presentation/views/widgets/rigister_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/loading_manager.dart';

class RegisterView extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        body: LoadingManager(
          isLoading: false,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: RigisterViewBody(),
            ),
          ),
        ),
      ),
    );
  }
}
