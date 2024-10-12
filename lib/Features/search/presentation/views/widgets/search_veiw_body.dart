import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce_shop_smart/Features/search/presentation/views/widgets/product_item.dart';
import 'package:e_commerce_shop_smart/core/providers/product_provider.dart';
import 'package:e_commerce_shop_smart/core/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../models/product_model.dart';

class SearchVeiwBody extends StatefulWidget {
  const SearchVeiwBody({super.key});

  @override
  State<SearchVeiwBody> createState() => _SearchVeiwBodyState();
}

class _SearchVeiwBodyState extends State<SearchVeiwBody> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<ProductModel> productListSearch = [];
  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);
    final String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;

    List<ProductModel> productList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(ctgName: passedCategory);

    // return passedCategory == null
    //     ? const Center(
    //         child: TitlesTextWidget(label: "No Products Found"),
    //       )
    //     :
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextField(
            controller: searchController,
            hint: "search",
            onSubmitted: (value) {
              setState(() {
                productListSearch = productProvider.searchQuery(
                    searchText: searchController.text, passedList: productList);
              });
            },
            onChanged: (value) {
              // setState(() {
              //   productListSearch = productProvider.searchQuery(
              //       searchText: searchController.text, passedList: []);
              // });
            },
            onTapSuffixIcon: () {
              // setState(() {
              searchController.clear();
              FocusScope.of(context).unfocus();
              // });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          if (searchController.text.isNotEmpty &&
              productListSearch.isEmpty) ...[
            const Center(
                child: TitlesTextWidget(
              label: "No results found",
              fontSize: 40,
            ))
          ],
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DynamicHeightGridView(
                itemCount: searchController.text.isNotEmpty
                    ? productListSearch.length
                    : productList.length,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                builder: (ctx, index) {
                  /// return your widget here.
                  return ProductItem(
                    productId: searchController.text.isNotEmpty
                        ? productListSearch[index].productId
                        : productList[index].productId,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
