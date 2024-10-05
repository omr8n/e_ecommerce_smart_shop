// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:provider/provider.dart';
// import 'package:shopsmart_users_ar/screens/auth/login.dart';
// import 'package:shopsmart_users_ar/screens/inner_screens/orders/orders_screen.dart';
// import 'package:shopsmart_users_ar/screens/inner_screens/viewed_recently.dart';
// import 'package:shopsmart_users_ar/screens/inner_screens/wishlist.dart';
// import 'package:shopsmart_users_ar/screens/loading_manager.dart';
// import 'package:shopsmart_users_ar/widgets/app_name_text.dart';
// import 'package:shopsmart_users_ar/widgets/subtitle_text.dart';
// import 'package:shopsmart_users_ar/widgets/title_text.dart';

// import '../../../../models/user_model.dart';
// import '../../../../providers/theme_provider.dart';
// import '../../../../providers/user_provider.dart';
// import '../../../../services/assets_manager.dart';
// import '../../../../services/my_app_method.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;
//   User? user = FirebaseAuth.instance.currentUser;
//   bool _isLoading = true;
//   UserModel? userModel;

//   Future<void> fetchUserInfo() async {
//     if (user == null) {
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     try {
//       userModel = await userProvider.fetchUserInfo();
//     } catch (error) {
//       await MyAppMethods.showErrorORWarningDialog(
//         context: context,
//         subtitle: "An error has been occured $error",
//         fct: () {},
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     fetchUserInfo();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: const AppNameTextWidget(fontSize: 20),
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(AssetsManager.shoppingCart),
//           ),
//         ),
//         body: LoadingManager(
//           isLoading: _isLoading,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Visibility(
//                   visible: user == null ? true : false,
//                   child: const Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: TitlesTextWidget(
//                         label: "Please login to have ultimate access"),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 userModel == null
//                     ? const SizedBox.shrink()
//                     : Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Theme.of(context).cardColor,
//                                 border: Border.all(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .background,
//                                     width: 3),
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                     userModel!.userImage,
//                                   ),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 TitlesTextWidget(label: userModel!.userName),
//                                 SubtitleTextWidget(
//                                   label: userModel!.userEmail,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12.0,
//                     vertical: 24,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const TitlesTextWidget(label: "General"),
//                       user == null
//                           ? const SizedBox.shrink()
//                           : CustomListTile(
//                               imagePath: AssetsManager.orderSvg,
//                               text: "All orders",
//                               function: () async {
//                                 await Navigator.pushNamed(
//                                   context,
//                                   OrdersScreenFree.routeName,
//                                 );
//                               },
//                             ),
//                       user == null
//                           ? const SizedBox.shrink()
//                           : CustomListTile(
//                               imagePath: AssetsManager.wishlistSvg,
//                               text: "Wishlist",
//                               function: () async {
//                                 await Navigator.pushNamed(
//                                   context,
//                                   WishlistScreen.routName,
//                                 );
//                               },
//                             ),
//                       CustomListTile(
//                         imagePath: AssetsManager.recent,
//                         text: "Viewed recently",
//                         function: () async {
//                           await Navigator.pushNamed(
//                             context,
//                             ViewedRecentlyScreen.routName,
//                           );
//                         },
//                       ),
//                       CustomListTile(
//                         imagePath: AssetsManager.address,
//                         text: "Address",
//                         function: () {},
//                       ),
//                       const Divider(
//                         thickness: 1,
//                       ),
//                       const SizedBox(
//                         height: 7,
//                       ),
//                       const TitlesTextWidget(label: "Settings"),
//                       const SizedBox(
//                         height: 7,
//                       ),
//                       SwitchListTile(
//                         secondary: Image.asset(
//                           AssetsManager.theme,
//                           height: 30,
//                         ),
//                         title: Text(themeProvider.getIsDarkTheme
//                             ? "Dark mode"
//                             : "Light mode"),
//                         value: themeProvider.getIsDarkTheme,
//                         onChanged: (value) {
//                           themeProvider.setDarkTheme(themeValue: value);
//                         },
//                       ),
//                       const Divider(
//                         thickness: 1,
//                       ),
//                     ],
//                   ),
//                 ),
// Center(
//   child: ElevatedButton.icon(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.red,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(
//           30,
//         ),
//       ),
//     ),
//     icon: Icon(user == null ? Icons.login : Icons.logout),
//     label: Text(
//       user == null ? "Login" : "Logout",
//     ),
//     onPressed: () async {
//       if (user == null) {
//         await Navigator.pushNamed(
//           context,
//           LoginScreen.routName,
//         );
//       } else {
//         await MyAppMethods.showErrorORWarningDialog(
//           context: context,
//           subtitle: "Are you sure?",
//           fct: () async {
//             await FirebaseAuth.instance.signOut();
//             if (!mounted) return;
//             await Navigator.pushReplacementNamed(
//               context,
//               LoginScreen.routName,
//             );
//           },
//           isError: false,
//         );
//       }
//     },
//   ),
// ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class CustomListTile extends StatelessWidget {
//   const CustomListTile(
//       {super.key,
//       required this.imagePath,
//       required this.text,
//       required this.function});
//   final String imagePath, text;
//   final Function function;
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         function();
//       },
//       leading: Image.asset(
//         imagePath,
//         height: 30,
//       ),
//       title: SubtitleTextWidget(label: text),
//       trailing: const Icon(IconlyLight.arrowRight2),
//     );
//   }
// }

import 'package:e_commerce_shop_smart/Features/auth/presentation/views/login_view.dart';
import 'package:e_commerce_shop_smart/Features/inner_screens/viewed_recently.dart';
import 'package:e_commerce_shop_smart/Features/profile/presentation/views/widgets/custom_list_tile.dart';
import 'package:e_commerce_shop_smart/core/widgets/subtitle_text.dart';
import 'package:e_commerce_shop_smart/core/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper/my_app_method.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/utils/app_images.dart';
import '../../../home/presentation/views/widgets/app_name_text.dart';
import '../../../inner_screens/wish_list_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(fontSize: 20),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.imagesBagShoppingCart),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: true,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlesTextWidget(label: "omran abo ali "),
                      SubtitleTextWidget(
                        label: "omran.aboali@gmail.com",
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitlesTextWidget(
                  label: "General",
                ),
                CustomListTile(
                  imagePath: Assets.imagesBagOrderSvg,
                  text: "All order",
                  onTap: () {},
                ),
                CustomListTile(
                  imagePath: Assets.imagesBagWishlistSvg,
                  text: "Wishlist",
                  onTap: () async {
                    await Navigator.pushNamed(context, WishlistView.routeName);
                  },
                ),
                CustomListTile(
                  imagePath: Assets.imagesProfileRecent,
                  text: "Viewed recently",
                  onTap: () async {
                    await Navigator.pushNamed(
                        context, ViewedRecentlyVeiw.routeName);
                  },
                ),
                CustomListTile(
                  imagePath: Assets.imagesProfileAddress,
                  text: "Address",
                  onTap: () {},
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitlesTextWidget(label: "Settings"),
                const SizedBox(
                  height: 7,
                ),
                SwitchListTile(
                  secondary: Image.asset(Assets.imagesProfileTheme),
                  title: Text(themeProvider.getIsDarkTheme
                      ? "Dark mode"
                      : "light mode"),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value) {
                    themeProvider.setDarkTheme(themeValue: value);
                  },
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),

                icon: const Icon(Icons.logout),
                // icon: Icon(user == null ? Icons.login : Icons.logout),
                label: const Text("Logout"
                    //  user == null ? "Login" : "Logout",
                    ),
                onPressed: () async {
                  // if (user == null) {
                  await Navigator.pushNamed(
                    context,
                    LoginView.routeName,
                  );
                  // } else {
                  await MyAppMethods.showErrorORWarningDialog(
                    context: context,
                    subtitle: "Are you sure?",
                    fct: () async {
                      // await FirebaseAuth.instance.signOut();
                      // if (!mounted) return;
                      // await Navigator.pushReplacementNamed(
                      //   context,
                      //   LoginScreen.routName,
                      // );
                    },
                    isError: false,
                  );
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
