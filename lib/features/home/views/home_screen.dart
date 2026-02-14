// import 'package:ecommerce/features/home/widgets/bottom_nav_bar.dart';
// import 'package:ecommerce/features/home/widgets/category_list.dart';
// import 'package:ecommerce/features/home/widgets/home_header.dart';
// import 'package:ecommerce/features/home/widgets/product_grid.dart';
// import 'package:ecommerce/features/home/widgets/promo_slider.dart';
// import 'package:flutter/material.dart';


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     // scale factor based on design width 375 (iPhone base)
//     final scale = width / 375;

//     return Scaffold(
//       backgroundColor: const Color(0xffF3F4F6),
//       bottomNavigationBar: const CustomBottomNav(),
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return CustomScrollView(
//               physics: const BouncingScrollPhysics(),
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: HomeHeader(scale: scale),
//                 ),
//                 SliverToBoxAdapter(
//                   child: PromoSlider(scale: scale),
//                 ),
//                 SliverToBoxAdapter(
//                   child: CategoryList(scale: scale),
//                 ),
//                 ProductGrid(scale: scale),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
