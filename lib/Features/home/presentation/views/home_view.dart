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
    return Scaffold(
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
    );
  }
}
