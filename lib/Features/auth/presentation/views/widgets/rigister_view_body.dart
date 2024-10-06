import 'package:e_commerce_shop_smart/Features/auth/presentation/views/widgets/rigister_view_body_form.dart';
import 'package:e_commerce_shop_smart/Features/home/presentation/views/widgets/app_name_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/widgets/subtitle_text.dart';
import '../../../../../core/widgets/title_text.dart';
import 'button_login_and_rigister.dart';

class RigisterViewBody extends StatefulWidget {
  const RigisterViewBody({super.key});

  @override
  State<RigisterViewBody> createState() => _RigisterViewBodyState();
}

class _RigisterViewBodyState extends State<RigisterViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitlesTextWidget(label: "Welcome"),
              SubtitleTextWidget(label: "Your welcome message")
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        const RigisterViewBodyForm(),
        const SizedBox(
          height: 25.0,
        ),
        ButtonLoginAndRegister(
          text: "Sign up",
          icon: const Icon(IconlyLight.addUser),
          onPressed: () async {
            //  _registerFct();
          },
        )
      ],
    );
  }
}
