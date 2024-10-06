import 'package:e_commerce_shop_smart/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/empty_bag.dart';
import '../../../core/widgets/title_text.dart';

import 'orders_item.dart';

class OrdersViewFree extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersViewFree({super.key});

  @override
  State<OrdersViewFree> createState() => _OrdersScreenFreeState();
}

class _OrdersScreenFreeState extends State<OrdersViewFree> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    // final ordersProvider = Provider.of<OrdersProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(
            label: 'Placed orders',
          ),
        ),
        body: isEmptyOrders
            ? const EmptyBagWidget(
                imagePath: Assets.imagesBagOrder,
                title: "No orders has been placed yet",
                subtitle: "",
                textBootom: "Shop now")
            : ListView.separated(
                itemCount: 15,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: OrdersItemFree(
                        //  ordersModelAdvanced: ordersProvider.getOrders[index],
                        ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ));
  }
}




// FutureBuilder<List<OrdersModelAdvanced>>(
//         future: ordersProvider.fetchOrder(),
//         builder: ((context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child:
//                   SelectableText("An error has been occured ${snapshot.error}"),
//             );
//           } else if (!snapshot.hasData || ordersProvider.getOrders.isEmpty) {
//             return EmptyBagWidget(
//                 imagePath: AssetsManager.orderBag,
//                 title: "No orders has been placed yet",
//                 subtitle: "",
//                 buttonText: "Shop now");
//           }
          // return ListView.separated(
          //   itemCount: snapshot.data!.length,
          //   itemBuilder: (ctx, index) {
          //     return Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          //       child: OrdersWidgetFree(
          //           ordersModelAdvanced: ordersProvider.getOrders[index]),
          //     );
          //   },
          //   separatorBuilder: (BuildContext context, int index) {
          //     return const Divider();
          //   },
          // );
//         }),
//       ),