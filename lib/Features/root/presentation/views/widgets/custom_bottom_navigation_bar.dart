import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/cart_provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.onDestinationSelected, this.selectedIndex = 0});
  final int selectedIndex;
  final void Function(int index)? onDestinationSelected;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return NavigationBar(
      selectedIndex: selectedIndex,
      //selectedIndex: currentView,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      height: kBottomNavigationBarHeight,
      onDestinationSelected: onDestinationSelected,
      // onDestinationSelected: (index) {
      //   setState(() {
      //    currentView = index;
      //   });
      //    controller.jumpToPage(currentView);
      // },
      destinations: [
        const NavigationDestination(
          selectedIcon: Icon(IconlyBold.home),
          icon: Icon(IconlyLight.home),
          label: "Home",
        ),
        const NavigationDestination(
          selectedIcon: Icon(IconlyBold.search),
          icon: Icon(IconlyLight.search),
          label: "Search",
        ),
        NavigationDestination(
          selectedIcon: const Icon(IconlyBold.bag2),
          icon: Consumer<CartProvider>(builder: (context, cartProvider, child) {
            return Badge(
                backgroundColor: const Color.fromARGB(255, 20, 78, 126),
                label: Text(cartProvider.getCartItems.length.toString()),
                child: const Icon(IconlyLight.bag2));
          }),
          // icon: Consumer<CartProvider>(
          //   builder: (context, cartProvider, child) {
          //     return Badge(
          //       backgroundColor: Colors.blue,
          //       label: Text(cartProvider.getCartItems.length.toString()),
          //       child: const Icon(IconlyLight.bag2),
          //     );
          //   },
          // ),
          label: "Cart",
        ),
        const NavigationDestination(
          selectedIcon: Icon(IconlyBold.profile),
          icon: Icon(IconlyLight.profile),
          label: "Profile",
        ),
      ],
    );
  }
}
