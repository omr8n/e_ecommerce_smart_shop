import 'package:flutter/material.dart';

import '../../../../../core/widgets/auth/google_btn.dart';
import '../../../../root/presentation/views/root_view.dart';

class OrConnectUsing extends StatelessWidget {
  const OrConnectUsing({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: FittedBox(
                  child: GoogleButton(),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    // backgroundColor:
                    // Theme.of(context).colorScheme.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Guest",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, RootView.routeName);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
