import 'package:ecommerce/features/home/widgets/bottom_nav_bar.dart';
import 'package:ecommerce/features/home/widgets/category_list.dart';
import 'package:ecommerce/features/home/widgets/hero_black_container.dart';
import 'package:ecommerce/features/home/widgets/home_header.dart';
import 'package:ecommerce/features/home/widgets/product_grid.dart';
import 'package:ecommerce/features/home/widgets/promo_slider.dart';
import 'package:ecommerce/features/home/widgets/search_section.dart';
import 'package:ecommerce/features/home/widgets/section_header.dart';
import 'package:ecommerce/features/product_details/view/products_details_screen.dart';
import 'package:ecommerce/features/search/views/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onSearchTap});

  final VoidCallback? onSearchTap;

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

  Route _createSearchRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      pageBuilder:
          (context, animation, secondaryAnimation) => const SearchScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fade = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

        final slide = Tween(
          begin: const Offset(0, 0.05),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        );

        return FadeTransition(
          opacity: fade,
          child: SlideTransition(position: slide, child: child),
        );
      },
    );
  }

  Route _createProductRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 450),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      pageBuilder:
          (context, animation, secondaryAnimation) =>
              const ProductDetailsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fade = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

        final slide = Tween(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        );

        return FadeTransition(
          opacity: fade,
          child: SlideTransition(position: slide, child: child),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔥 Black Header (Fade + Slide)
          HeroBlackContainer(opacityNotifier: headerOpacity),

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
                    horizontal: 24,
                    vertical: 10,
                  ),
                  sliver: const SliverToBoxAdapter(child: CustomHeader()),
                ),

                /// 2 Promo Slider
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                  sliver: SliverToBoxAdapter(child: PromoSlider(scale: 1.02)),
                ),

                ///  Search Section
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  sliver: SliverToBoxAdapter(
                    child: Hero(
                      tag: "searchBar",
                      child: GestureDetector(
                        onTap: () {
                          if (widget.onSearchTap != null) {
                            widget.onSearchTap!();
                          } else {
                            Navigator.push(context, _createSearchRoute());
                          }
                        },
                        child: SearchSection(),
                      ),
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
                ProductGridSliver(
                  onTap: () {
                    Navigator.push(context, _createProductRoute());
                  },
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 120)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
