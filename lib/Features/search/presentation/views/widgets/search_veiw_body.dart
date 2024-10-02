import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce_shop_smart/Features/search/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
// import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import '../../../../../core/widgets/custom_text_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextField(
            controller: searchController,
            hint: "search",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DynamicHeightGridView(
                itemCount: 20,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                builder: (ctx, index) {
                  /// return your widget here.
                  return const ProductItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
