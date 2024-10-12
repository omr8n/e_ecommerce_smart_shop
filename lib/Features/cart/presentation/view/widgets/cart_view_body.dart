import 'package:e_commerce_shop_smart/core/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartProvider.getCartItems.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: cartProvider.getCartItems.values
                      .toList()
                      .reversed
                      .toList()[index],
                  child: const CartItem());
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
