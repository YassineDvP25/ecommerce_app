// import 'package:flutter/material.dart';

// class CategoryList extends StatefulWidget {
//   final double scale;
//   const CategoryList({super.key, required this.scale});

//   @override
//   State<CategoryList> createState() => _CategoryListState();
// }

// class _CategoryListState extends State<CategoryList> {
//   int selectedIndex = 0;

//   final List<Map<String, dynamic>> categories = [
//     {"icon": Icons.local_fire_department, "label": "Popular"},
//     {"icon": Icons.checkroom, "label": "Apparel"},
//     {"icon": Icons.directions_run, "label": "Shoes"},
//     {"icon": Icons.watch, "label": "Accessories"},
//     {"icon": Icons.sports_esports, "label": "Gaming"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60 * widget.scale,
//       child: ListView.separated(
//         padding:
//             EdgeInsets.symmetric(horizontal: 20 * widget.scale),
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         separatorBuilder: (_, __) =>
//             SizedBox(width: 12 * widget.scale),
//         itemBuilder: (context, index) {
//           final isSelected = selectedIndex == index;

//           return GestureDetector(
//             onTap: () {
//               setState(() => selectedIndex = index);
//             },
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               padding: EdgeInsets.symmetric(
//                 horizontal: 18 * widget.scale,
//               ),
//               decoration: BoxDecoration(
//                 color: isSelected
//                     ? Colors.black
//                     : Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(30),
//                 boxShadow: [
//                   if (!isSelected)
//                     BoxShadow(
//                       color:
//                           Colors.black.withOpacity(.05),
//                       blurRadius: 8,
//                     )
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Icon(
//                     categories[index]["icon"],
//                     size: 18 * widget.scale,
//                     color: isSelected
//                         ? Colors.white
//                         : Colors.black,
//                   ),
//                   SizedBox(width: 8 * widget.scale),
//                   Text(
//                     categories[index]["label"],
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: isSelected
//                           ? Colors.white
//                           : Colors.black,
//                       fontSize: 13 * widget.scale,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
