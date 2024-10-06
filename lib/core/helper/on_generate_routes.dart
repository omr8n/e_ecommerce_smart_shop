import 'package:e_commerce_shop_smart/Features/auth/presentation/views/login_view.dart';
import 'package:e_commerce_shop_smart/Features/auth/presentation/views/register_view.dart';
import 'package:e_commerce_shop_smart/Features/inner_screens/orders/orders_view.dart';
import 'package:e_commerce_shop_smart/Features/inner_screens/wish_list_view.dart';
import 'package:flutter/material.dart';

import '../../Features/auth/presentation/views/forgot_password_view.dart';
import '../../Features/home/presentation/views/product_details_veiw.dart';
import '../../Features/inner_screens/viewed_recently.dart';
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
    case WishlistView.routeName:
      return MaterialPageRoute(builder: (context) => const WishlistView());
    case ViewedRecentlyVeiw.routeName:
      return MaterialPageRoute(
          builder: (context) => const ViewedRecentlyVeiw());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case OrdersViewFree.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersViewFree());
    case ForgotPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
