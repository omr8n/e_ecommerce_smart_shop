// import 'dart:developer';

// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:provider/provider.dart';
// import 'package:shopsmart_users_ar/screens/cart/quantity_btm_sheet.dart';
// import 'package:shopsmart_users_ar/widgets/subtitle_text.dart';
// import 'package:shopsmart_users_ar/widgets/title_text.dart';

// import '../../models/cart_model.dart';
// import '../../providers/cart_provider.dart';
// import '../../providers/product_provider.dart';
// import '../../widgets/products/heart_btn.dart';

// class CartWidget extends StatelessWidget {
//   const CartWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final cartModelProvider = Provider.of<CartModel>(context);
//     // final productProvider = Provider.of<ProductProvider>(context);
//     // final getCurrProduct =
//     //     productProvider.findByProdId(cartModelProvider.productId);
//     // Size size = MediaQuery.of(context).size;
//     // final cartProvider = Provider.of<CartProvider>(context);
//     return getCurrProduct == null
//         ? const SizedBox.shrink()
//         : FittedBox(
//             child: IntrinsicWidth(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: FancyShimmerImage(
//                         imageUrl: getCurrProduct.productImage,
//                         height: size.height * 0.2,
//                         width: size.height * 0.2,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10.0,
//                     ),
//                     IntrinsicWidth(
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: size.width * 0.6,
//                                 child: TitlesTextWidget(
//                                   label: getCurrProduct.productTitle,
//                                   maxLines: 2,
//                                 ),
//                               ),
//                               Column(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () async {
//                                       try {
//                                         await cartProvider
//                                             .removeCartItemFromFirebase(
//                                           cartId: cartModelProvider.cartId,
//                                           productId: getCurrProduct.productId,
//                                           qty: cartModelProvider.quantity,
//                                         );
//                                       } catch (error) {
//                                         log(error.toString());
//                                       }
//                                       // cartProvider.removeOneItem(
//                                       //   productId: getCurrProduct.productId,
//                                       // );
//                                     },
//                                     icon: const Icon(
//                                       Icons.clear,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                   HeartButtonWidget(
//                                     productId: getCurrProduct.productId,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SubtitleTextWidget(
//                                 label: "${getCurrProduct.productPrice}\$",
//                                 fontSize: 20,
//                                 color: Colors.blue,
//                               ),
//                               const Spacer(),
//                               OutlinedButton.icon(
//                                 style: OutlinedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   side: const BorderSide(
//                                     width: 2,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                                 onPressed: () async {
//                                   await showModalBottomSheet(
//                                     backgroundColor: Theme.of(context)
//                                         .scaffoldBackgroundColor,
//                                     shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(16.0),
//                                         topRight: Radius.circular(16.0),
//                                       ),
//                                     ),
//                                     context: context,
//                                     builder: (context) {
//                                       return QuantityBottomSheetWidget(
//                                         cartModel: cartModelProvider,
//                                       );
//                                     },
//                                   );
//                                 },
//                                 icon: const Icon(IconlyLight.arrowDown2),
//                                 label:
//                                     Text("Qty: ${cartModelProvider.quantity} "),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//   }
// }

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/widgets/subtitle_text.dart';
import '../../../../../core/widgets/title_text.dart';
import 'quantity_btm_sheet.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    // final cartModelProvider = Provider.of<CartModel>(context);
    // final productProvider = Provider.of<ProductProvider>(context);
    // final getCurrProduct =
    //     productProvider.findByProdId(cartModelProvider.productId);
    Size size = MediaQuery.of(context).size;
    // final cartProvider = Provider.of<CartProvider>(context);
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl:
                      'https://static.businessinsider.sg/2018/12/12/5c1c90f8e04d6243c7019cf6.png',
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: const TitlesTextWidget(
                            label: "fewfew",
                            maxLines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () async {
                                // try {
                                //   await cartProvider
                                //       .removeCartItemFromFirebase(
                                //     cartId: cartModelProvider.cartId,
                                //     productId: getCurrProduct.productId,
                                //     qty: cartModelProvider.quantity,
                                //   );
                                // } catch (error) {
                                //   log(error.toString());
                                // }
                                // cartProvider.removeOneItem(
                                //   productId: getCurrProduct.productId,
                                // );
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  IconlyLight.heart,
                                  color: Colors.red,
                                )),
                            //   HeartButtonWidget(

                            //     productId: ,
                            //  //   productId: getCurrProduct.productId,
                            //   ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SubtitleTextWidget(
                          label: "${"26"}\$",
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                        // const Spacer(),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: BorderSide(
                              width: 2,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return const QuantityBottomSheetWidget(
                                    // cartModel: cartModelProvider,
                                    );
                              },
                            );
                          },
                          icon: const Icon(IconlyLight.arrowDown2),
                          label: const Text("Qty : 6"),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
