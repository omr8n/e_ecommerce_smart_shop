import 'package:e_commerce_shop_smart/core/constants/app_constants.dart';
import 'package:e_commerce_shop_smart/core/widgets/heart_botton_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_botton.dart';
import '../../../../core/widgets/subtitle_text.dart';
import '../../../../core/widgets/title_text.dart';
import 'widgets/app_name_text.dart';

class ProductDetailsVeiw extends StatefulWidget {
  const ProductDetailsVeiw({super.key});
  static const routeName = '/ProductDetails';
  @override
  State<ProductDetailsVeiw> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductDetailsVeiw> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: AppConstants.productImageUrl,
              height: size.height * 0.38,
              width: double.infinity,
              boxFit: BoxFit.contain,

              //errorWidget: ,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        // flex: 5,
                        child: Text(
                          // getCurrProduct.productTitle,
                          //  maxLines: 2,
                          "efwgewgwg",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      SubtitleTextWidget(
                        // label: "${getCurrProduct.productPrice}\$",

                        label: "efwfeqwfqewf",
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // HeartButtonWidget(
                        //   productId: getCurrProduct.productId,
                        //   color: Colors.blue.shade300,
                        // ),
                        HeartBottonWidget(
                          size: 18,
                          color: Color.fromARGB(255, 71, 103, 171),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CustomBottom(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitlesTextWidget(label: "About this item"),
                      SubtitleTextWidget(
                        label: "fewewf",
                        // label: getCurrProduct.productDescription,
                      ),
                      // SubtitleTextWidget(
                      //     label: "In ${getCurrProduct.productCategory}")
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SubtitleTextWidget(
                    label: "fewewf",
                    // label: getCurrProduct.productDescription,
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
