import 'package:e_commerce_shop_smart/core/widgets/heart_botton_widget.dart';
import 'package:e_commerce_shop_smart/models/product_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/cart_provider.dart';
import '../../../../core/providers/product_provider.dart';
import '../../../../core/widgets/custom_botton.dart';
import '../../../../core/widgets/subtitle_text.dart';
import '../../../../core/widgets/title_text.dart';
import 'widgets/app_name_text.dart';

class ProductDetailsVeiw extends StatefulWidget {
  const ProductDetailsVeiw({super.key});
  static const routeName = 'ProductDetails';

  @override
  State<ProductDetailsVeiw> createState() => _ProductDetailsVeiwState();
}

class _ProductDetailsVeiwState extends State<ProductDetailsVeiw> {
  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    String productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrProduct = productProvider.findByProdId(productId);

    print("vewwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
    // final String productId =
    //     ModalRoute.of(context)!.settings.arguments as String;

    print("===========================================  $productId");
    final cartProvider = Provider.of<CartProvider>(context);
    // final ProductModel? getCurrProduct =
    //     productProvider.findByProdId(productId);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(fontSize: 20),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            )),
        // automaticallyImplyLeading: false,
      ),
      body: getCurrProduct == null
          ? const SizedBox()
          : SingleChildScrollView(
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: getCurrProduct.productImage,
                    height: size.height * 0.38,
                    width: double.infinity,
                    boxFit: BoxFit.contain,

                    //errorWidget: ,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              // flex: 5,
                              child: Text(
                                getCurrProduct.productTitle,
                                //  maxLines: 2,
                                //  "efwgewgwg",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            SubtitleTextWidget(
                              label: "${getCurrProduct.productPrice}\$",

                              //  label: "efwfeqwfqewf",
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // HeartButtonWidget(
                              //   productId: getCurrProduct.productId,
                              //   color: Colors.blue.shade300,
                              // ),
                              HeartBottonWidget(
                                size: 18,
                                color: const Color.fromARGB(255, 71, 103, 171),
                                productId: productId,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const CustomBottom(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TitlesTextWidget(label: "About this item"),
                            // SubtitleTextWidget(
                            //   label: "fewewf",
                            //   // label: getCurrProduct.productDescription,
                            // ),
                            SubtitleTextWidget(
                                label: "In ${getCurrProduct.productCategory}")
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SubtitleTextWidget(
                          // label: "fewewf",
                          label: getCurrProduct.productDescription,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
