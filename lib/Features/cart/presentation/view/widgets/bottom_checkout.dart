import 'package:flutter/material.dart';

import '../../../../../core/widgets/subtitle_text.dart';
import '../../../../../core/widgets/title_text.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key, required this.function});
  final Function function;
  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    // final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        // fit: BoxFit.scaleDown,
                        child: TitlesTextWidget(
                      label: "total 6 products/ 3 Items",

                      // label:
                      //     "Total (${cartProvider.getCartItems.length} products/${cartProvider.getQty()} Items)"
                      //
                    )),
                    SubtitleTextWidget(
                      // label:
                      //     "${cartProvider.getTotal(productProvider: productProvider).toStringAsFixed(2)}\$",
                      label: "efwfwefewf",
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await function();
                },
                child: const Text("Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
