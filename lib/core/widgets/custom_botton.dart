import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            // if (cartProvider.isProductInCart(
            //     productId: getCurrProduct.productId)) {
            //   return;
            // }
            // // cartProvider.addProductToCart(
            // //     productId: getCurrProduct.productId);
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
            // if (cartProvider.isProductInCart(
            //     productId:
            //         getCurrProduct.productId)) {
            //   return;
            // }
            // cartProvider.addProductToCart(
            //     productId: getCurrProduct.productId);
          },
          icon: const Icon(
            Icons.add_shopping_cart_rounded,
          ),
          // icon: Icon(
          //   cartProvider.isProductInCart(
          //           productId: getCurrProduct.productId)
          //       ? Icons.check
          //       : Icons.add_shopping_cart_rounded,
          // ),
          // label: Text(
          //   cartProvider.isProductInCart(
          //           productId: getCurrProduct.productId)
          //       ? "In cart"
          //       : "Add to cart",
          // ),
          label: const Text("Add to cart"),
        ),
      ),
    );
  }
}
