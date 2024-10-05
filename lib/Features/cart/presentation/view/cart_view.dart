import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/empty_bag.dart';
import '../../../../core/widgets/title_text.dart';

import 'widgets/bottom_checkout.dart';

import 'widgets/cart_view_body.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartView> {
  bool isLoading = false;
  bool isEmbty = false;
  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    // final productProvider =
    //     Provider.of<ProductProvider>(context, listen: false);

    return isEmbty
        ? const Scaffold(
            body: EmptyBagWidget(
              imagePath: Assets.imagesBagShoppingBasket,
              title: "Your cart is empty",
              subtitle:
                  'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
              textBootom: "Shop Now",
            ),
          )
        : Scaffold(
            bottomSheet: CartBottomCheckout(function: () async {
              // await placeOrder(
              //   cartProvider: cartProvider,
              //   productProvider: productProvider,
              //   userProvider: userProvider,
              // );
            }),
            appBar: AppBar(
              title: const TitlesTextWidget(
                label: "",
                // label: "Cart (${cartProvider.getCartItems.length})"
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.imagesBagShoppingCart),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      // MyAppMethods.showErrorORWarningDialog(
                      //     isError: false,
                      //     context: context,
                      //     subtitle: "Remove items",
                      //     fct: () async {
                      //       // cartProvider.clearLocalCart();
                      //       await cartProvider.clearCartFromFirebase();
                      //     });
                    },
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      color: Colors.red,
                    )),
              ],
            ),
            body: const CartViewBody(),

            // body: LoadingManager(
            //   isLoading: isLoading,
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: ListView.builder(
            //           itemCount: cartProvider.getCartItems.length,
            //           itemBuilder: (context, index) {
            //             return ChangeNotifierProvider.value(
            //               value: cartProvider.getCartItems.values
            //                   .toList()
            //                   .reversed
            //                   .toList()[index],
            //               child: const CartWidget(),
            //             );
            //           },
            //         ),
            //       ),
            //       const SizedBox(
            //         height: kBottomNavigationBarHeight + 10,
            //       )
            //     ],
            //   ),
            // ),
          );
  }

  // Future<void> placeOrder({
  //   required CartProvider cartProvider,
  //   required ProductProvider productProvider,
  //   required UserProvider userProvider,
  // }) async {
  //   final auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;
  //   if (user == null) {
  //     return;
  //   }
  //   final uid = user.uid;
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     cartProvider.getCartItems.forEach((key, value) async {
  //       final getCurrProduct = productProvider.findByProdId(value.productId);
  //       final orderId = const Uuid().v4();
  //       await FirebaseFirestore.instance
  //           .collection("ordersAdvanced")
  //           .doc(orderId)
  //           .set({
  //         'orderId': orderId,
  //         'userId': uid,
  //         'productId': value.productId,
  //         "productTitle": getCurrProduct!.productTitle,
  //         'price': double.parse(getCurrProduct.productPrice) * value.quantity,
  //         'totalPrice': cartProvider.getTotal(productProvider: productProvider),
  //         'quantity': value.quantity,
  //         'imageUrl': getCurrProduct.productImage,
  //         'userName': userProvider.getUserModel!.userName,
  //         'orderDate': Timestamp.now(),
  //       });
  //     });
  //     await cartProvider.clearCartFromFirebase();
  //     cartProvider.clearLocalCart();
  //   } catch (e) {
  //     MyAppMethods.showErrorORWarningDialog(
  //       context: context,
  //       subtitle: e.toString(),
  //       fct: () {},
  //     );
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }
}
