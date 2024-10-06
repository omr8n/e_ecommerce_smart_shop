import 'package:e_commerce_shop_smart/core/constants/app_constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/subtitle_text.dart';
import '../../../core/widgets/title_text.dart';

class OrdersItemFree extends StatefulWidget {
  const OrdersItemFree({
    super.key,
    //required this.ordersModelAdvanced
  });
  // final OrdersModelAdvanced ordersModelAdvanced;
  @override
  State<OrdersItemFree> createState() => _OrdersItemFreeState();
}

class _OrdersItemFreeState extends State<OrdersItemFree> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.25,
              width: size.width * 0.25,
              imageUrl: AppConstants.productImageUrl,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: TitlesTextWidget(
                          label: "omran abo ali",
                          //  label: widget.ordersModelAdvanced.productTitle,
                          maxLines: 2,
                          fontSize: 15,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: 22,
                          )),
                    ],
                  ),
                  const Row(
                    children: [
                      TitlesTextWidget(
                        label: 'Price:  ',
                        fontSize: 15,
                      ),
                      Flexible(
                        child: SubtitleTextWidget(
                          label: r"$200",
                          //  label: "${widget.ordersModelAdvanced.price} \$",
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SubtitleTextWidget(
                    label: "Qty: ",
                    //label: "Qty: ${widget.ordersModelAdvanced.quantity}",
                    fontSize: 15,
                  ),
                  // const Row(
                  //   children: [
                  //     Flexible(
                  //       child: TitlesTextWidget(
                  //         label: 'Qty:  ',
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //     Flexible(
                  //       child: SubtitleTextWidget(
                  //         label: "10",
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
