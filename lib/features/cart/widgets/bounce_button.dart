import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const BounceButton({required this.icon, required this.onTap, super.key});

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.9,
      upperBound: 1.0,
    )..value = 1.0;
  }

  void _animate() async {
    await _controller.reverse();
    await _controller.forward();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _controller,
      child: GestureDetector(
        onTap: _animate,
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Icon(widget.icon, size: 16),
        ),
      ),
    );
  }
}
