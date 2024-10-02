import 'package:flutter/material.dart';

import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 16,
            itemBuilder: (context, index) {
              return const CartItem();
            },
          ),
        ),
        const SizedBox(
          height: kBottomNavigationBarHeight + 10,
        )
      ],
    );
  }
}
