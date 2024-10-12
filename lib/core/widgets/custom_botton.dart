import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final getCurrProduct = productProvider.findByProdId(productId);
    return Expanded(
      child: SizedBox(
        height: kBottomNavigationBarHeight - 10,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
          ),
          onPressed: () async {
            if (cartProvider.isProductInCart(
                productId: getCurrProduct.productId)) {
              return;
            }

            // try {
            //   await cartProvider.addToCartFirebase(
            //       productId: getCurrProduct.productId,
            //       qty: 1,
            //       context: context);
            // } catch (error) {
            //   MyAppMethods.showErrorORWarningDialog(
            //       context: context,
            //       subtitle: error.toString(),
            //       fct: () {});
            // }

            cartProvider.addProductToCart(productId: getCurrProduct.productId);
          },

          icon: Icon(
            cartProvider.isProductInCart(productId: getCurrProduct!.productId)
                ? Icons.check
                : Icons.add_shopping_cart_rounded,
          ),
          label: Text(
            cartProvider.isProductInCart(productId: getCurrProduct.productId)
                ? "In cart"
                : "Add to cart",
          ),
          //label: const Text("Add to cart"),
        ),
      ),
    );
  }
}
