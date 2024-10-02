import '../../models/categories_model.dart';
import '../utils/app_images.dart';

class AppConstants {
  static const String productImageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';
  static List<String> bannersImages = [
    Assets.imagesBannersBanner1,
    Assets.imagesBannersBanner2,
  ];
  static List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "Phones",
      image: Assets.imagesCategoriesMobiles,
      name: "Phones",
    ),
    CategoryModel(
      id: "Laptops",
      image: Assets.imagesCategoriesPc,
      name: "Laptops",
    ),
    CategoryModel(
      id: "Electronics",
      image: Assets.imagesCategoriesElectronics,
      name: "Electronics",
    ),
    CategoryModel(
      id: "Watches",
      image: Assets.imagesCategoriesWatch,
      name: "Watches",
    ),
    CategoryModel(
      id: "Clothes",
      image: Assets.imagesCategoriesFashion,
      name: "Clothes",
    ),
    CategoryModel(
      id: "Shoes",
      image: Assets.imagesCategoriesShoes,
      name: "Shoes",
    ),
    CategoryModel(
      id: "",
      image: Assets.imagesCategoriesBookImg,
      name: "Books",
    ),
    CategoryModel(
      id: "Cosmetics",
      image: Assets.imagesCategoriesCosmetics,
      name: "Cosmetics",
    ),
  ];
}
