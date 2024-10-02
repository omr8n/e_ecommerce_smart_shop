import 'package:flutter/material.dart';

import '../../Features/home/presentation/views/product_details_veiw.dart';
import '../../Features/root/presentation/views/root_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // switch (settings.name) {
  // case SplashView.routeName:
  //   return MaterialPageRoute(builder: (context) => const SplashView());
  //   case BestSellingView.routeName:
  //     return MaterialPageRoute(builder: (context) => const BestSellingView());
  //   case SigninView.routeName:
  //     return MaterialPageRoute(builder: (context) => const SigninView());
  //   case SignupView.routeName:
  //     return MaterialPageRoute(builder: (context) => const SignupView());

  // default:
  //   return MaterialPageRoute(builder: (context) => const Scaffold());
  // }
  switch (settings.name) {
    case ProductDetailsVeiw.routeName:
      return MaterialPageRoute(
          builder: (context) => const ProductDetailsVeiw());
    case RootView.routeName:
      return MaterialPageRoute(builder: (context) => const RootView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
