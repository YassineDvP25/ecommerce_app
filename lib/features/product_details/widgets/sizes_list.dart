import 'package:flutter/material.dart';

class SizesList extends StatelessWidget {
  final List<String> sizes;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<Color> colors;
  final int selectedColorIndex;

  const SizesList({
    super.key,
    required this.sizes,
    required this.selectedIndex,
    required this.onSelected,
    required this.colors,
    required this.selectedColorIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(sizes.length, (i) {
          final selected = selectedIndex == i;

          final bool lightProduct =
              colors[selectedColorIndex] == Colors.white ||
              colors[selectedColorIndex] == Colors.yellow;

          return GestureDetector(
            onTap: () => onSelected(i),
            child: AnimatedScale(
              scale: selected ? 1.2 : 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.elasticOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      selected ? colors[selectedColorIndex] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  sizes[i],
                  style: TextStyle(
                    color:
                        selected
                            ? (lightProduct ? Colors.black : Colors.white)
                            : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
