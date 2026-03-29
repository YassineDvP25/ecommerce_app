import 'package:ecommerce/features/home/widgets/category_list.dart';
import 'package:ecommerce/features/home/widgets/product_grid.dart';
import 'package:ecommerce/features/home/widgets/section_header.dart';
import 'package:ecommerce/features/search/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, this.onClose});

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors2.scaffoldBackground,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    /// 🔥 Hero Search Bar
                    CustomSearchBar(),

                    /// 🔥 Close Button
                    GestureDetector(
                      onTap: () {
                        if (onClose != null) {
                          onClose!();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            ),

            ///  Categories
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 5),
              sliver: SliverToBoxAdapter(child: CategorySelector()),
            ),

            ///  Section Header
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(title: "Top Picks Nearby"),
              ),
            ),

            ///  Products Grid
            const ProductGridSliver(),
          ],
        ),
      ),
    );
  }
}
