import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.20,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                AppConstants.bannersImages[index],
                fit: BoxFit.fill,
              );
            },
            // duration: DateTime.august,
            viewportFraction: 0.8,
            autoplay: true,
            itemCount: AppConstants.bannersImages.length,
            pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  color: Colors.grey,
                  activeColor: Colors.white,
                )),
            // viewportFraction: 0.8,
            // pagination: const SwiperPagination(),
            // control: const SwiperControl(),
            // scale: 0.9,
          ),
        ));
  }
}
