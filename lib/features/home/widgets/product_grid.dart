// import 'package:flutter/material.dart';

// class ProductGrid extends StatelessWidget {
//   final double scale;
//   const ProductGrid({super.key, required this.scale});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     int crossAxisCount = width < 400
//         ? 2
//         : width < 600
//             ? 3
//             : 4;

//     return SliverPadding(
//       padding: EdgeInsets.all(20 * scale),
//       sliver: SliverGrid(
//         delegate: SliverChildBuilderDelegate(
//           (context, index) => const ProductCard(),
//           childCount: 8,
//         ),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: crossAxisCount,
//           mainAxisSpacing: 16 * scale,
//           crossAxisSpacing: 16 * scale,
//           childAspectRatio: .72,
//         ),
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   const ProductCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.04),
//             blurRadius: 12,
//           )
//         ],
//       ),
//       padding: const EdgeInsets.all(14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Expanded(child: Placeholder()),
//           SizedBox(height: 10),
//           Text("Pullover Hoodie",
//               style: TextStyle(fontWeight: FontWeight.w600)),
//           SizedBox(height: 5),
//           Text("\$55",
//               style:
//                   TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
