// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProductWidget extends StatefulWidget {
//   const ProductWidget({
//     super.key,
//     required this.productId,
//   });

//   final String productId;
//   @override
//   State<ProductWidget> createState() => _ProductWidgetState();
// }

// class _ProductWidgetState extends State<ProductWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // final productModelProvider = Provider.of<ProductModel>(context);
//     // final productProvider = Provider.of<ProductProvider>(context);
//     // final getCurrProduct = productProvider.findByProdId(widget.productId);
//     // final cartProvider = Provider.of<CartProvider>(context);

//     // final viewedProvider = Provider.of<ViewedProdProvider>(context);
//     Size size = MediaQuery.of(context).size;
//     return getCurrProduct == null
//         ? const SizedBox.shrink()
//         : Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: GestureDetector(
//               onTap: () async {
//                 viewedProvider.addProductToHistory(
//                     productId: getCurrProduct.productId);
//                 await Navigator.pushNamed(
//                   context,
//                   ProductDetails.routName,
//                   arguments: getCurrProduct.productId,
//                 );
//               },
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(30.0),
//                     child: FancyShimmerImage(
//                       imageUrl: getCurrProduct.productImage,
//                       width: double.infinity,
//                       height: size.height * 0.22,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                   Row(
//                     children: [
//                       Flexible(
//                         flex: 5,
//                         child: TitlesTextWidget(
//                           label: getCurrProduct.productTitle,
//                           maxLines: 2,
//                           fontSize: 18,
//                         ),
//                       ),
//                       Flexible(
//                         flex: 2,
//                         child: HeartButtonWidget(
//                             productId: getCurrProduct.productId),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Flexible(
//                           flex: 3,
//                           child: SubtitleTextWidget(
//                             label: "${getCurrProduct.productPrice}\$",
//                           ),
//                         ),
//                         Flexible(
//                           child: Material(
//                             borderRadius: BorderRadius.circular(16.0),
//                             color: Colors.lightBlue,
//                             child: InkWell(
//                               splashColor: Colors.red,
//                               borderRadius: BorderRadius.circular(16.0),
//                               onTap: () async {
//                                 if (cartProvider.isProductInCart(
//                                     productId: getCurrProduct.productId)) {
//                                   return;
//                                 }
//                                 // cartProvider.addProductToCart(
//                                 //     productId: getCurrProduct.productId);
//                                 try {
//                                   await cartProvider.addToCartFirebase(
//                                       productId: getCurrProduct.productId,
//                                       qty: 1,
//                                       context: context);
//                                 } catch (error) {
//                                   MyAppMethods.showErrorORWarningDialog(
//                                       context: context,
//                                       subtitle: error.toString(),
//                                       fct: () {});
//                                 }
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Icon(
//                                   cartProvider.isProductInCart(
//                                           productId: getCurrProduct.productId)
//                                       ? Icons.check
//                                       : Icons.add_shopping_cart_rounded,
//                                   size: 20,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         // SizedBox(
//                         //   width: 1,
//                         // ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }
// }

import 'package:e_commerce_shop_smart/Features/home/presentation/views/product_details_veiw.dart';
import 'package:e_commerce_shop_smart/core/constants/app_constants.dart';
import 'package:e_commerce_shop_smart/core/widgets/heart_botton_widget.dart';
import 'package:e_commerce_shop_smart/core/widgets/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/widgets/title_text.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        //  print("object");
        await Navigator.pushNamed(context, ProductDetailsVeiw.routeName);
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => ProductDetailsVeiw(),
        // ));
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: FancyShimmerImage(
                imageUrl: AppConstants.productImageUrl,
                width: double.infinity,
                height: size.height * 0.22,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Row(
              children: [
                Flexible(
                  flex: 6,
                  child: TitlesTextWidget(
                    label: "ewfw",
                    maxLines: 2,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Flexible(
                    flex: 2,
                    child: HeartBottonWidget(
                      size: 18,
                      color: Color.fromARGB(255, 71, 103, 171),
                    )
                    // child: HeartButtonWidget(
                    //     // productId: getCurrProduct.productId,
                    //     ),
                    ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    flex: 2,
                    child: SubtitleTextWidget(
                      label: "fewfewf",
                      // label: "${getCurrProduct.productPrice}\$",
                    ),
                  ),
                  Flexible(
                    child: Material(
                      borderRadius: BorderRadius.circular(16.0),
                      color: const Color.fromARGB(255, 34, 70, 99),
                      child: InkWell(
                        splashColor: const Color.fromARGB(255, 232, 103, 96),
                        borderRadius: BorderRadius.circular(16.0),
                        onTap: () async {
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
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add_shopping_cart_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                          // child: Icon(
                          //   cartProvider.isProductInCart(
                          //           productId: getCurrProduct.productId)
                          //       ? Icons.check
                          //     : Icons.add_shopping_cart_rounded,
                          // size: 20,
                          // color: Colors.white,
                          // ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 1,
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
