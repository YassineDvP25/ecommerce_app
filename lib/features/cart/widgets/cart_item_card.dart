import 'package:flutter/material.dart';
import 'package:ecommerce/features/cart/models/cart_item.dart';
import 'package:ecommerce/features/cart/widgets/bounce_button.dart';
import 'package:ecommerce/core/theme/colors.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors2.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors2.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item.imageUrl,
              width: 90,
              height: 90,
              fit: BoxFit.fitHeight,
            ),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Size : XL',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${item.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              BounceButton(icon: Icons.remove, onTap: onRemove),
              const SizedBox(width: 8),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  '${item.quantity}',
                  key: ValueKey(item.quantity),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 8),
              BounceButton(icon: Icons.add, onTap: onAdd),
            ],
          ),
        ],
      ),
    );
  }
}
