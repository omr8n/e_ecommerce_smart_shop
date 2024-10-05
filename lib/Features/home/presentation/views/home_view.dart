import 'package:e_commerce_shop_smart/Features/home/presentation/views/widgets/category_item.dart';

import 'package:e_commerce_shop_smart/Features/home/presentation/views/widgets/latest_arrival_list_view.dart';
import 'package:e_commerce_shop_smart/core/constants/app_constants.dart';

import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';

import '../../../../core/widgets/title_text.dart';
import 'widgets/app_name_text.dart';
import 'widgets/custom_swiper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeProvider themeProvider =
    //     Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      // backgroundColor: themeProvider.getIsDarkTheme
      //     ? AppColors.darkScaffoldColor
      //     : AppColors.lightScaffoldColor,
      appBar: AppBar(
        title: const AppNameTextWidget(fontSize: 20),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.imagesBagShoppingCart),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSwiper(),

                  SizedBox(
                    height: 18,
                  ),
                  TitlesTextWidget(
                    label: "Latest arrival",
                    fontSize: 22,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  LatestArrivalListView(),

                  // Visibility(
                  //   visible: productProvider.getProducts.isNotEmpty,
                  //   child: SizedBox(
                  //     height: size.height * 0.2,
                  //     child: ListView.builder(
                  //         scrollDirection: Axis.horizontal,
                  //         itemCount: productProvider.getProducts.length < 10
                  //             ? productProvider.getProducts.length
                  //             : 10,
                  //         itemBuilder: (context, index) {
                  //           return ChangeNotifierProvider.value(
                  //               value: productProvider.getProducts[index],
                  //               child: const LatestArrivalProductsWidget());
                  //         }),
                  //   ),
                  // ),

                  TitlesTextWidget(
                    label: "Categories",
                    fontSize: 22,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: GridView.count(
                  // shrinkWrap: true,
                  //  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: List.generate(AppConstants.categoriesList.length,
                      (index) {
                    return CategoryItem(
                      image: AppConstants.categoriesList[index].image,
                      name: AppConstants.categoriesList[index].name,
                    );
                  })),
            )
          ],
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8),
      //   child: Column(
      //     children: [
      //       // const TitlesTextWidget(label: "hello world"),
      //       // ElevatedButton(
      //       //   onPressed: () {},
      //       //   child: Text("click"),
      //       // ),
      //       // SwitchListTile(
      //       //   title:
      //       //       Text(themeProvider.getIsDarkTheme ? "Dark mode" : "light mode"),
      //       //   value: themeProvider.getIsDarkTheme,
      //       //   onChanged: (value) {
      //       //     themeProvider.setDarkTheme(themeValue: value);
      //       //   },
      //       // ),

      //   ],
      // ),
    );
  }
}

// import 'package:e_commerce_shop_smart/Features/home/presentation/views/widgets/category_item.dart';

// import 'package:e_commerce_shop_smart/Features/home/presentation/views/widgets/latest_arrival_list_view.dart';
// import 'package:e_commerce_shop_smart/core/constants/app_constants.dart';

// import 'package:flutter/material.dart';

// import '../../../../core/utils/app_images.dart';

// import '../../../../core/widgets/title_text.dart';
// import 'widgets/app_name_text.dart';
// import 'widgets/custom_swiper.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final ThemeProvider themeProvider =
//     //     Provider.of<ThemeProvider>(context, listen: true);
//     return Scaffold(
//       // backgroundColor: themeProvider.getIsDarkTheme
//       //     ? AppColors.darkScaffoldColor
//       //     : AppColors.lightScaffoldColor,
//       appBar: AppBar(
//         title: const AppNameTextWidget(fontSize: 20),
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(Assets.imagesBagShoppingCart),
//         ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const CustomSwiper(),

//               const SizedBox(
//                 height: 18,
//               ),
//               const Visibility(
//                 visible: true,
//                 child: TitlesTextWidget(
//                   label: "Latest arrival",
//                   fontSize: 22,
//                 ),
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               const LatestArrivalListView(),

//               // Visibility(
//               //   visible: productProvider.getProducts.isNotEmpty,
//               //   child: SizedBox(
//               //     height: size.height * 0.2,
//               //     child: ListView.builder(
//               //         scrollDirection: Axis.horizontal,
//               //         itemCount: productProvider.getProducts.length < 10
//               //             ? productProvider.getProducts.length
//               //             : 10,
//               //         itemBuilder: (context, index) {
//               //           return ChangeNotifierProvider.value(
//               //               value: productProvider.getProducts[index],
//               //               child: const LatestArrivalProductsWidget());
//               //         }),
//               //   ),
//               // ),

//               const TitlesTextWidget(
//                 label: "Categories",
//                 fontSize: 22,
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               GridView.count(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   crossAxisCount: 4,
//                   children: List.generate(AppConstants.categoriesList.length,
//                       (index) {
//                     return CategoryItem(
//                       image: AppConstants.categoriesList[index].image,
//                       name: AppConstants.categoriesList[index].name,
//                     );
//                   }))
//             ],
//           ),
//         ),
//       ),
//       // body: Padding(
//       //   padding: const EdgeInsets.symmetric(horizontal: 8),
//       //   child: Column(
//       //     children: [
//       //       // const TitlesTextWidget(label: "hello world"),
//       //       // ElevatedButton(
//       //       //   onPressed: () {},
//       //       //   child: Text("click"),
//       //       // ),
//       //       // SwitchListTile(
//       //       //   title:
//       //       //       Text(themeProvider.getIsDarkTheme ? "Dark mode" : "light mode"),
//       //       //   value: themeProvider.getIsDarkTheme,
//       //       //   onChanged: (value) {
//       //       //     themeProvider.setDarkTheme(themeValue: value);
//       //       //   },
//       //       // ),

//       //   ],
//       // ),
//     );
//   }
// }
