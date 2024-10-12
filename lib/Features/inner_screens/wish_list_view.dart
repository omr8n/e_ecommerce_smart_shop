// import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce_shop_smart/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helper/my_app_method.dart';
import '../../core/providers/wishlist_provider.dart';
import '../../core/widgets/empty_bag.dart';
import '../../core/widgets/title_text.dart';
import '../search/presentation/views/widgets/product_item.dart';

class WishlistView extends StatefulWidget {
  static const routeName = '/WishlistScreen';
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  bool isEmbty = true;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlistItems.isEmpty
        ? const Scaffold(
            body: EmptyBagWidget(
              imagePath: Assets.imagesBagBagWish,
              title: "Your wishlist is empty",
              subtitle:
                  'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
              textBootom: "Shop Now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: TitlesTextWidget(
                  label:
                      "Wishlist (${wishlistProvider.getWishlistItems.length})"),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.imagesBagShoppingCart),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppMethods.showErrorORWarningDialog(
                        isError: false,
                        context: context,
                        subtitle: "Remove items",
                        fct: () async {
                          // await wishlistProvider.clearWishlistFromFirebase();
                          wishlistProvider.clearLocalWishlist();
                        });
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
              itemCount: wishlistProvider.getWishlistItems.length,
              builder: ((context, index) {
                return ProductItem(
                  productId: wishlistProvider.getWishlistItems.values
                      .toList()[index]
                      .productId,
                );
              }),
              crossAxisCount: 2,
            ),
          );
  }
}

// import 'package:flutter/material.dart';

// import '../../../../core/utils/app_images.dart';
// import '../../../../core/widgets/empty_bag.dart';
// import '../../../../core/widgets/title_text.dart';

// import '../cart/presentation/view/widgets/bottom_checkout.dart';
// import '../cart/presentation/view/widgets/cart_view_body.dart';

// class Wishlist extends StatefulWidget {
//   const Wishlist({super.key});

//   @override
//   State<Wishlist> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<Wishlist> {
//   bool isLoading = false;
//   bool isEmbty = false;
//   @override
//   Widget build(BuildContext context) {
//     return isEmbty
//         ? const Scaffold(
//             body: EmptyBagWidget(
//               imagePath: Assets.imagesBagShoppingBasket,
//               title: "Your cart is empty",
//               subtitle:
//                   'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
//               textBootom: "Shop Now",
//             ),
//           )
//         : Scaffold(
//             bottomSheet: CartBottomCheckout(function: () async {}),
//             appBar: AppBar(
//               title: const TitlesTextWidget(
//                 label: "",
//                 // label: "Cart (${cartProvider.getCartItems.length})"
//               ),
//               leading: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.asset(Assets.imagesBagShoppingCart),
//               ),
//               actions: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.delete_forever_rounded,
//                       color: Colors.red,
//                     )),
//               ],
//             ),
//             body: const CartViewBody(),
//           );
//   }

//   //
// }
