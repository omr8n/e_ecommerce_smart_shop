// // import 'package:flutter/material.dart';
// // import 'package:flutter_iconly/flutter_iconly.dart';
// // import 'package:provider/provider.dart';

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:provider/provider.dart';

// import '../providers/wishlist_provider.dart';

// class HeartButtonWidget extends StatefulWidget {
//   const HeartButtonWidget({
//     super.key,
//     this.size = 22,
//     this.color = Colors.transparent,
//     required this.productId,
//   });
//   final double size;
//   final Color color;
//   final String productId;
//   @override
//   State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
// }

// class _HeartButtonWidgetState extends State<HeartButtonWidget> {
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     final wishlistProvider = Provider.of<WishlistProvider>(context);
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: widget.color,
//       ),
//       child: IconButton(
//         style: IconButton.styleFrom(
//           shape: const CircleBorder(),
//         ),
//         onPressed: () async {
//           wishlistProvider.addOrRemoveFromWishlist(productId: widget.productId);
//           log("wishlist Map is: ${wishlistProvider.getWishlistItems} ");
//           setState(() {
//             isLoading = true;
//           });
//           // try {
//           //   if (wishlistProvider.getWishlistItems
//           //       .containsKey(widget.productId)) {
//           //     wishlistProvider.removeWishlistItemFromFirebase(
//           //       wishlistId:
//           //           wishlistProvider.getWishlistItems[widget.productId]!.id,
//           //       productId: widget.productId,
//           //     );
//           //   } else {
//           //     wishlistProvider.addToWishlistFirebase(
//           //         productId: widget.productId, context: context);
//           //   }
//           //   await wishlistProvider.fetchWishlist();
//           // } catch (e) {
//             // MyAppMethods.showErrorORWarningDialog(
//             //   context: context,
//             //   subtitle: e.toString(),
//             //   fct: () {},
//           //   );
//           // } finally {
//           //   setState(() {
//           //     isLoading = false;
//           //   });
//           // }
//         },
//         //icon: Icon(Icons.heart_broken),
//         icon: isLoading
//             ? const CircularProgressIndicator()
//             : Icon(
//                 wishlistProvider.isProductInWishlist(
//                         productId: widget.productId)
//                     ? IconlyBold.heart
//                     : IconlyLight.heart,
//                 size: widget.size,
//                 color: wishlistProvider.isProductInWishlist(
//                         productId: widget.productId)
//                     ? Colors.red
//                     : Colors.grey,
//               ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../providers/wishlist_provider.dart';

class HeartBottonWidget extends StatefulWidget {
  const HeartBottonWidget(
      {super.key,
      required this.size,
      this.color = Colors.transparent,
      this.iconColor = Colors.white,
      required this.productId});
  final double size;
  final Color color;
  final Color iconColor;
  final String productId;
  @override
  State<HeartBottonWidget> createState() => _HeartBottonWidgetState();
}

class _HeartBottonWidgetState extends State<HeartBottonWidget> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.color,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            wishlistProvider.addOrRemoveFromWishlist(
                productId: widget.productId);
            log("wishlist Map is: ${wishlistProvider.getWishlistItems} ");
          },
          icon: isLoading
              ? const CircularProgressIndicator()
              : Icon(
                  wishlistProvider.isProductInWishlist(
                          productId: widget.productId)
                      ? IconlyBold.heart
                      : IconlyLight.heart,
                  size: widget.size,
                  color: wishlistProvider.isProductInWishlist(
                          productId: widget.productId)
                      ? Colors.red
                      : Colors.grey,
                ),
        ),
      ),
    );
  }
}
