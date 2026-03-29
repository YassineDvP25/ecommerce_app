import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

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
      height: 50, // ارتفاع كافٍ للظلال
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          final item = categories[index];
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              padding: EdgeInsets.fromLTRB(
                isSelected ? 6 : 3,
                isSelected ? 6 : 3,
                isSelected ? 20 : 3,
                isSelected ? 6 : 3,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      isSelected
                          ? [AppColors2.black, AppColors2.darkBorder]
                          : [AppColors2.white, AppColors2.white],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(isSelected ? 40 : 26),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors2.white : AppColors2.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item['icon'],
                      color: isSelected ? AppColors2.peach : AppColors2.black,
                      size: 22,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child:
                        isSelected
                            ? Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                item['label'],
                                style: const TextStyle(
                                  color: AppColors2.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            )
                            : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
