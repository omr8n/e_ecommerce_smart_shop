import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/widgets/title_text.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 16),
      baseColor: Colors.purple,
      highlightColor: const Color.fromARGB(255, 244, 82, 54),
      child: TitlesTextWidget(
        label: "Shop Smart",
        fontSize: fontSize,
      ),
    );
  }
}
