import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/viewed_prod_provider.dart';
import '../../core/utils/app_images.dart';
import '../../core/widgets/empty_bag.dart';
import '../../core/widgets/title_text.dart';
import '../search/presentation/views/widgets/product_item.dart';

class ViewedRecentlyVeiw extends StatefulWidget {
  static const routeName = '/ViewedRecentlyScreen';
  const ViewedRecentlyVeiw({super.key});

  @override
  State<ViewedRecentlyVeiw> createState() => _ViewedRecentlyVeiwState();
}

class _ViewedRecentlyVeiwState extends State<ViewedRecentlyVeiw> {
  bool isEmbty = false;
  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProdProvider>(context);
    return viewedProvider.getviewedProdItems.isEmpty
        ? const Scaffold(
            body: EmptyBagWidget(
              imagePath: Assets.imagesBagShoppingBasket,
              title: "Your Viewed recently is empty",
              subtitle:
                  'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
              textBootom: "Shop Now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: TitlesTextWidget(
                  label:
                      "Viewed recently ${viewedProvider.getviewedProdItems.length}"),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.imagesBagShoppingCart),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
              itemCount: viewedProvider.getviewedProdItems.length,
              //   itemCount: 5,
              builder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductItem(
                    productId: viewedProvider.getviewedProdItems.values
                        .toList()[index]
                        .productId,
                  ),
                );
              }),
              crossAxisCount: 2,
            ),
          );
  }
}
