import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/product_provider.dart';
import 'latest_arrival_item.dart';

class LatestArrivalListView extends StatelessWidget {
  const LatestArrivalListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);
    // final String? passedCategory =
    //     ModalRoute.of(context)!.settings.arguments as String?;
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: productProvider.getProducts.isNotEmpty,
      child: SizedBox(
        height: size.height * 0.2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productProvider.getProducts.length < 10
                ? productProvider.getProducts.length
                : 10,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: productProvider.getProducts[index],
                  child: const LatestArrivalItem());
            }),
      ),
    );
  }
}
