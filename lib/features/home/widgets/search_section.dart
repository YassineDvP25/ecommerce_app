import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: AppColors2.white,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey, size: 26),
                const SizedBox(width: 12),
                Text(
                  "Search...",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // زر الفلتر الأسود المربع (Rounded)
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: AppColors2.darkGrey, // أسود فحمي قليلاً
            borderRadius: BorderRadius.circular(
              20,
            ), // زوايا دائرية لكن ليست دائرة كاملة
          ),
          child: const Icon(Icons.tune, color: AppColors2.white, size: 24),
        ),
      ],
    );
  }
}
