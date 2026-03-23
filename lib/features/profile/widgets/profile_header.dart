import 'package:ecommerce/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CircleIcon(
          icon: Icons.tune_rounded,
          scale: scale,
          onTap: () => AppRouter.goBack(context),
        ),
        Text(
          "Profile",
          style: TextStyle(
            fontSize: 20 * scale,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.3,
          ),
        ),
        _CircleIcon(
          icon: Icons.edit_outlined,
          scale: scale,
          onTap: () {},
        ),
      ],
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({
    required this.icon,
    required this.scale,
    this.onTap,
  });

  final IconData icon;
  final double scale;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44 * scale,
        width: 44 * scale,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.12),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: 22 * scale),
      ),
    );
  }
}
