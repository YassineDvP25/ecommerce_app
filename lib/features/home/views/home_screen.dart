import 'dart:ui';

import 'package:ecommerce/features/home/widgets/bottom_nav_bar.dart';
import 'package:ecommerce/features/home/widgets/category_list.dart';
import 'package:ecommerce/features/home/widgets/home_header.dart';
import 'package:ecommerce/features/home/widgets/product_grid.dart';
import 'package:ecommerce/features/home/widgets/promo_slider.dart';
import 'package:ecommerce/features/home/widgets/search_section.dart';
import 'package:ecommerce/features/home/widgets/section_header.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // 1. Header
                 SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  sliver: SliverToBoxAdapter(child: CustomHeader()),
                ),

                // 2. Banner
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  sliver: SliverToBoxAdapter(child: PromoSlider(scale: 1.02)),
                ),

                // 3. Search Bar & Filter
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  sliver: SliverToBoxAdapter(child: SearchSection()),
                ),

                // 4. Categories (Mixed Layout: Text Pill vs Icon Circle)
                const SliverToBoxAdapter(child: CategorySelector()),

                // 5. Section Title
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  sliver: SliverToBoxAdapter(
                    child: SectionHeader(title: "Top Picks Nearby"),
                  ),
                ),

                // 6. Products Grid
                const ProductGridSliver(),

                // مسافة إضافية في الأسفل للبار العائم
              ],
            ),
          ),

          // 7. Floating Bottom Navigation
          const Positioned(
            bottom: 5,
            left: 24,
            right: 24,
            child: CustomBottomNav(),
          ),
        ],
      ),
    );
  }
}




class TestHeader extends StatelessWidget {
  const TestHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C), // لون رمادي داكن
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Status Bar Space & User Info
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: Row(
              children: [
                // User Avatar
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      image: NetworkImage('https://i.pravatar.cc/150?img=12'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Billy Hanson',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // Action Icons
                _buildDarkHeaderIcon(Icons.favorite_border),
                const SizedBox(width: 8),
                _buildDarkHeaderIcon(Icons.notifications_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

  Widget _buildDarkHeaderIcon(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3A),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: 20, color: Colors.white),
    );
  }


class AdvancedHeader extends StatelessWidget {
  final double scale;
  const AdvancedHeader({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 330 * scale,
      pinned: false,
      floating: false,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final percent =
              (constraints.maxHeight - kToolbarHeight) /
                  (330 * scale);

          return Stack(
            clipBehavior: Clip.none,
            children: [

              /// 🔥 Animated Gradient Background
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: percent > 0.5
                        ? const [
                            Color(0xff2B2B2B),
                            Color(0xff111111),
                          ]
                        : const [
                            Color(0xff1A1A1A),
                            Color(0xff000000),
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50 * scale),
                    bottomRight: Radius.circular(50 * scale),
                  ),
                ),
              ),

              /// 🔥 Blur Effect
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10 * (1 - percent),
                  sigmaY: 10 * (1 - percent),
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),

              /// 🔥 Header Content
              Positioned(
                top: 50 * scale,
                left: 0,
                right: 0,
                child: CustomHeader(),
              ),

              /// 🔥 Promo Card (يخرج نصفه)
              Positioned(
                bottom: -40 * scale,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: percent.clamp(0, 1),
                  child: PromoSlider(scale: scale),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
