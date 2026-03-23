import 'package:flutter/material.dart';
import 'action_item.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({super.key, required this.item, required this.scale});

  final ActionItem item;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16 * scale, vertical: 14 * scale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18 * scale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 44 * scale,
            width: 44 * scale,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.icon,
              color: Colors.black87,
              size: 22 * scale,
            ),
          ),
          SizedBox(width: 14 * scale),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 15 * scale,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 4 * scale),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 12.5 * scale,
                    color: Colors.black.withOpacity(0.55),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.black.withOpacity(0.4),
            size: 22 * scale,
          ),
        ],
      ),
    );
  }
}
