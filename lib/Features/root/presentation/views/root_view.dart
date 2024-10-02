import 'package:e_commerce_shop_smart/Features/home/presentation/views/home_view.dart';
import 'package:e_commerce_shop_smart/Features/root/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../cart/presentation/view/cart_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../search/presentation/views/search_view.dart';

class RootView extends StatefulWidget {
  static const routeName = '/';
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController controller;
  int currentView = 0;
  bool isLoadingProds = true;

  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const ProfileView()
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentView,
    );
  }

  // Future<void> fetchFCT() async {
  //   final productsProvider =
  //       Provider.of<ProductProvider>(context, listen: false);
  //   final cartProvider = Provider.of<CartProvider>(context, listen: false);
  //   final wishlistProvider =
  //       Provider.of<WishlistProvider>(context, listen: false);

  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   try {
  //     Future.wait({
  //       productsProvider.fetchProducts(),
  //       userProvider.fetchUserInfo(),
  //     });
  //     Future.wait({
  //       cartProvider.fetchCart(),
  //       wishlistProvider.fetchWishlist(),
  //     });
  //   } catch (error) {
  //     log(error.toString());
  //   } finally {
  //     setState(() {
  //       isLoadingProds = false;
  //     });
  //   }
  // }

  @override
  // void didChangeDependencies() {
  //   if (isLoadingProds) {
  //     fetchFCT();
  //   }

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: currentView,
          onDestinationSelected: (index) {
            setState(() {
              currentView = index;
            });
            // controller.animateToPage(currentView,
            //     duration: const Duration(milliseconds: 500),
            //     curve: Curves.easeInOut);
            controller.jumpToPage(currentView);
          },
        ));
  }
}
