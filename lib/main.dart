import 'package:e_commerce_shop_smart/Features/root/presentation/views/root_view.dart';
import 'package:e_commerce_shop_smart/core/helper/on_generate_routes.dart';
import 'package:e_commerce_shop_smart/core/providers/cart_provider.dart';
import 'package:e_commerce_shop_smart/core/providers/product_provider.dart';
import 'package:e_commerce_shop_smart/core/providers/theme_provider.dart';
import 'package:e_commerce_shop_smart/core/providers/viewed_prod_provider.dart';
import 'package:e_commerce_shop_smart/core/providers/wishlist_provider.dart';
import 'package:e_commerce_shop_smart/core/utils/theme_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Features/inner_screens/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeProvider themeProvider =
    //     Provider.of<ThemeProvider>(context, listen: true);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ThemeProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return ProductProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return CartProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return WishlistProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return ViewedProdProvider();
          },
        )
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          // home: const RootView(),
          initialRoute: DashboardScreen.routeName,
          onGenerateRoute: onGenerateRoute,
        );
      }),
    );
  }
}
