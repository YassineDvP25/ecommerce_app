import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
             CircleAvatar(
              radius: 26,
              backgroundImage: Image.asset('assets/images/تنزيل (14).jpeg').image,
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Yassine El Anssari",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _headerIconBtn(Icons.favorite_border),
            const SizedBox(width: 12),
            _headerIconBtn(Icons.notifications_none),
          ],
        ),
      ],
    );
  }

  Widget _headerIconBtn(IconData icon) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Icon(icon, size: 22, color: Colors.black),
    );
  }
}
