import 'package:e_commerce_shop_smart/core/constants/app_constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/heart_botton_widget.dart';
import '../../../../../core/widgets/subtitle_text.dart';
import '../product_details_veiw.dart';

class LatestArrivalItem extends StatelessWidget {
  const LatestArrivalItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final productsModel = Provider.of<ProductModel>(context);
    // final viewedProvider = Provider.of<ViewedProdProvider>(context);
    // final cartProvider = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(
          context,
          ProductDetailsVeiw.routeName,
        );
        // viewedProvider.addProductToHistory(
        //     productId: productsModel.productId);
        // await Navigator.pushNamed(
        //   context,
        //   ProductDetails.routName,
        //   arguments: productsModel.productId,
        // );
      },
      child: SizedBox(
        width: size.width * 0.6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FancyShimmerImage(
                  imageUrl: AppConstants.productImageUrl,
                  width: size.width * 0.28,
                  height: size.width * 0.28,
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Flexible(
              child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "caeedwfewffjkbewjkfbjkwefkjewfhkwehgifuwegifiwegfuiwegfwefwcw",
                    //productsModel.productTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const HeartBottonWidget(
                        size: 20,
                        iconColor: Color.fromARGB(255, 71, 103, 171),
                        //color: Color.fromARGB(255, 159, 71, 171),
                      ),
                      // HeartButtonWidget(productId: productsModel.productId),
                      IconButton(
                        onPressed: () async {
                          // if (cartProvider.isProductInCart(
                          //     productId: productsModel.productId)) {
                          //   return;
                          // }
                          // // cartProvider.addProductToCart(
                          // //     productId: getCurrProduct.productId);
                          // try {
                          //   await cartProvider.addToCartFirebase(
                          //       productId: productsModel.productId,
                          //       qty: 1,
                          //       context: context);
                          // } catch (error) {
                          //   MyAppMethods.showErrorORWarningDialog(
                          //       context: context,
                          //       subtitle: error.toString(),
                          //       fct: () {});
                          // }
                        },
                        icon: const Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 18,
                        ),
                        // icon: Icon(
                        //   cartProvider.isProductInCart(
                        //           productId: productsModel.productId)
                        //       ? Icons.check
                        //       : Icons.add_shopping_cart_rounded,
                        //   size: 18,
                        // ),
                      ),
                    ],
                  ),
                  const FittedBox(
                    child: SubtitleTextWidget(
                      label: "rfwfewfjkewhfuigiuwfgyiufyguwefwefwefef",
                      // label: "${productsModel.productPrice}\$",
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
