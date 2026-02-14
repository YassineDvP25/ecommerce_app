// import 'package:flutter/material.dart';

// class HomeHeader extends StatelessWidget {
//   final double scale;
//   const HomeHeader({super.key, required this.scale});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: 20 * scale, vertical: 16 * scale),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 22 * scale,
//             backgroundImage:
//                 const NetworkImage("https://i.pravatar.cc/150?img=12"),
//           ),
//           SizedBox(width: 12 * scale),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Billy Hanson",
//                 style: TextStyle(
//                   fontSize: 16 * scale,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(height: 4 * scale),
//               Text(
//                 "Welcome Back",
//                 style: TextStyle(
//                   fontSize: 12 * scale,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//           const Spacer(),
//           _icon(Icons.favorite_border, scale),
//           SizedBox(width: 12 * scale),
//           _icon(Icons.notifications_none, scale),
//         ],
//       ),
//     );
//   }

//   Widget _icon(IconData icon, double scale) {
//     return Container(
//       height: 42 * scale,
//       width: 42 * scale,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14 * scale),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           )
//         ],
//       ),
//       child: Icon(icon, size: 20 * scale),
//     );
//   }
// }
