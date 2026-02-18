import 'package:ecommerce/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductGridSliver extends StatelessWidget {
  const ProductGridSliver({super.key});

  @override
  Widget build(BuildContext context) {
     final products = [
      ProductModel(
        name: 'Nike Kobe 5 Pro...',
        price: 120,
        rating: 5.0,
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Nick Hoops Elite',
        price: 40,
        rating: 5.0,
        imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
        isFavorite: false,
      ),
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio:
              0.62, // نسبة الطول للعرض (تم تعديلها لتطابق الصورة الطويلة)
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final p = products[index % products.length];
          return ProductCard(p);
        }, childCount: products.length),
      ),
    );
  }
}
