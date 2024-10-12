import 'package:e_commerce_shop_smart/core/providers/product_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/cart_provider.dart';
import '../../../../../core/providers/viewed_prod_provider.dart';
import '../../../../../core/widgets/heart_botton_widget.dart';
import '../../../../../core/widgets/subtitle_text.dart';
import '../../../../../models/product_model.dart';
import '../product_details_veiw.dart';

class LatestArrivalItem extends StatelessWidget {
  const LatestArrivalItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsModel = Provider.of<ProductModel>(context);
    final viewedProvider = Provider.of<ViewedProdProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    //  final getCurrProduct = productProvider.findByProdId(productId);
    return GestureDetector(
      onTap: () async {
        viewedProvider.addProductToHistory(productId: productsModel.productId);

        await Navigator.pushNamed(
          context,
          ProductDetailsVeiw.routeName,
          arguments: productsModel.productId,
        );
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
                  imageUrl: productsModel.productImage,
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
                  Text(
                    //  "caeedwfewffjkbewjkfbjkwefkjewfhkwehgifuwegifiwegfuiwegfwefwcw",
                    productsModel.productTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      HeartBottonWidget(
                          size: 20,
                          iconColor: const Color.fromARGB(255, 71, 103, 171),
                          productId: productsModel.productId
                          //color: Color.fromARGB(255, 159, 71, 171),
                          ),
                      //  HeartButtonWidget(productId: productsModel.productId,  size: 20,
                      //   iconColor: Color.fromARGB(255, 71, 103, 171),),
                      IconButton(
                        onPressed: () async {
                          if (cartProvider.isProductInCart(
                              productId: productsModel.productId)) {
                            return;
                          }
                          // cartProvider.addProductToCart(
                          //     productId: getCurrProduct.productId);
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
                        // icon: const Icon(
                        //   Icons.add_shopping_cart_rounded,
                        //   size: 18,
                        // ),
                        icon: Icon(
                          cartProvider.isProductInCart(
                                  productId: productsModel.productId)
                              ? Icons.check
                              : Icons.add_shopping_cart_rounded,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  FittedBox(
                    child: SubtitleTextWidget(
                      // label: "rfwfewfjkewhfuigiuwfgyiufyguwefwefwefef",
                      label: "${productsModel.productPrice}\$",
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
