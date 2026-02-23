import 'dart:ui';
import 'package:ecommerce/features/home/widgets/bottom_nav_bar.dart';
import 'package:ecommerce/features/home/widgets/category_list.dart';
import 'package:ecommerce/features/home/widgets/hero_black_container.dart';
import 'package:ecommerce/features/home/widgets/home_header.dart';
import 'package:ecommerce/features/home/widgets/product_grid.dart';
import 'package:ecommerce/features/home/widgets/promo_slider.dart';
import 'package:ecommerce/features/home/widgets/search_section.dart';
import 'package:ecommerce/features/home/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> headerOpacity = ValueNotifier(1.0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final offset = _scrollController.offset;

    double value = (200 - offset) / 200;

    if (value < 0) value = 0;
    if (value > 1) value = 1;

    headerOpacity.value = value;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    headerOpacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// 🔥 Black Header (Fade + Slide)
          HeroBlackContainer(
            opacityNotifier: headerOpacity,
          ),

          /// 🔥 Main Scroll Content
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [

                ///  Header
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 10),
                  sliver:
                      const SliverToBoxAdapter(child: CustomHeader()),
                ),

                /// 2 Promo Slider
                const SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                  sliver:
                      SliverToBoxAdapter(child: PromoSlider(scale: 1.02)),
                ),

                ///  Search Section
                const SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  sliver:
                      SliverToBoxAdapter(child: SearchSection()),
                ),

                ///  Categories
                const SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  sliver:
                      SliverToBoxAdapter(child: CategorySelector()),
                ),

                ///  Section Header
                const SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  sliver: SliverToBoxAdapter(
                    child: SectionHeader(
                      title: "Top Picks Nearby",
                    ),
                  ),
                ),

                ///  Products Grid
                const ProductGridSliver(),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),
          ),

          /// 🔥 Floating Bottom Nav
          const Positioned(
            bottom: 1,
            left: 24,
            right: 24,
            child: CustomBottomNav(),
          ),
        ],
      ),
    );
  }
}

