import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.onDestinationSelected, this.selectedIndex = 0});
  final int selectedIndex;
  final void Function(int index)? onDestinationSelected;
  @override
  Widget build(BuildContext context) {
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
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(IconlyBold.home),
          icon: Icon(IconlyLight.home),
          label: "Home",
        ),
        NavigationDestination(
          selectedIcon: Icon(IconlyBold.search),
          icon: Icon(IconlyLight.search),
          label: "Search",
        ),
        NavigationDestination(
          selectedIcon: Icon(IconlyBold.bag2),
          icon: Badge(
              backgroundColor: Color.fromARGB(255, 20, 78, 126),
              label: Text("6"),
              child: Icon(IconlyLight.bag2)),
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
        NavigationDestination(
          selectedIcon: Icon(IconlyBold.profile),
          icon: Icon(IconlyLight.profile),
          label: "Profile",
        ),
      ],
    );
  }
}
