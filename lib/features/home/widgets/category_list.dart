import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  // لاحظ: العنصر الأول مميز في التصميم، الباقي دوائر فقط
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.local_fire_department, "label": "Popular"},
    {"icon": Icons.checkroom, "label": "Apparel"}, // لن يظهر النص
    {"icon": Icons.sports_baseball, "label": "Sports"}, // لن يظهر النص
    {"icon": Icons.backpack, "label": "Bag"}, // لن يظهر النص
    {"icon": Icons.videogame_asset, "label": "Games"}, // لن يظهر النص
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, // ارتفاع كافٍ للظلال
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child:
                isSelected
                    ? _buildActivePill(categories[index])
                    : _buildInactiveCircle(categories[index]),
          );
        },
      ),
    );
  }

  // الشكل النشط (كبسولة سوداء مع أيقونة برتقالية)
  Widget _buildActivePill(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 6, 20, 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2024),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(item['icon'], color: Colors.deepOrange, size: 20),
          ),
          const SizedBox(width: 10),
          Text(
            item['label'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  // الشكل غير النشط (دائرة بيضاء فقط)
  Widget _buildInactiveCircle(Map<String, dynamic> item) {
    return Container(
      width: 52,
      height: 52,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(item['icon'], color: Colors.black, size: 24),
    );
  }
}