import 'package:flutter/material.dart';

class ColorOptions extends StatefulWidget {
  final List<Color> colors;
  final int selectedColorIndex ;
  final ValueChanged<int>? onColorSelected;

  const ColorOptions({
    super.key,
    required this.colors,
    required this.selectedColorIndex,
    this.onColorSelected,
  });

  @override
  State<ColorOptions> createState() => _ColorOptionsState();
}

class _ColorOptionsState extends State<ColorOptions> {
  late int _selectedColorIndex;

  @override
  void initState() {
    super.initState();
    _selectedColorIndex = widget.selectedColorIndex;
  }

  @override
  void didUpdateWidget(covariant ColorOptions oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedColorIndex != widget.selectedColorIndex) {
      _selectedColorIndex = widget.selectedColorIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.colors.length, (i) {
        final selected = _selectedColorIndex == i;

        return GestureDetector(
          onTap: () {
            setState(() => _selectedColorIndex = i);
            if (widget.onColorSelected != null) widget.onColorSelected!(i);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.only(right: 12),
            height: selected ? 40 : 30,
            width: selected ? 40 : 30,
            decoration: BoxDecoration(
              color: widget.colors[i],
              shape: BoxShape.circle,
              // add a faint border so white option is visible on white
              border:
                  widget.colors[i] == Colors.white
                      ? Border.all(color: Colors.grey.shade400)
                      : null,
              boxShadow:
                  selected
                      ? [
                        BoxShadow(
                          color: widget.colors[i].withOpacity(0.6),
                          blurRadius: 20,
                        ),
                      ]
                      : [],
            ),
          ),
        );
      }),
    );
  }
}
