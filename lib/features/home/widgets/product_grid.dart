import 'package:ecommerce/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductGridSliver extends StatelessWidget {
  final VoidCallback? onTap;
  const ProductGridSliver({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final products = [
      ProductModel(
        name: 'Retro Nuptse Jacket',
        price: 120,
        rating: 5.0,
        imageUrl: 'assets/images/products/ChatGPT Image Mar 2, 2026, 11_54_22 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Sport Bag Elite ',
        price: 85,
        rating: 4.8,
        imageUrl: 'assets/images/ChatGPT Image Mar 14, 2026, 10_56_35 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Glasses Court Shatter Mid ',
        price: 75,
        rating: 4.9,
        imageUrl: 'assets/images/products/ChatGPT Image Mar 16, 2026, 09_41_19 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Adidas Ultra Boost Shoes',
        price: 160,
        rating: 4.9,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__10_27_25_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Nike Air Max Runner',
        price: 110,
        rating: 5.0,
        imageUrl: 'assets/images/products/ChatGPT Image Mar 16, 2026, 09_50_47 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Jordan Retro High Tops',
        price: 180,
        rating: 4.8,
        imageUrl: 'assets/images/ChatGPT Image 11 مارس 2026، 12_50_09 م.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Under Armour Curry Flow',
        price: 130,
        rating: 4.7,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_50_56_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'New Balance Fresh Foam',
        price: 95,
        rating: 4.9,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_51_08_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Asics Gel-Kayano Runner',
        price: 140,
        rating: 5.0,
        imageUrl: 'assets/images/products/ChatGPT Image Mar 16, 2026, 09_54_52 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Vans Old Skool Classic',
        price: 65,
        rating: 4.8,
        imageUrl: 'assets/images/ChatGPT Image 11 مارس 2026، 12_50_12 م.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Champion Reverse Weave ',
        price: 55,
        rating: 4.9,
        imageUrl: 'assets/images/vecteezy_blank-yellow-hoodie-mockup-front-view-isolated-on_72881527.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Supreme Box Logo ',
        price: 220,
        rating: 4.9,
        imageUrl: 'assets/images/ChatGPT Image Mar 14, 2026, 10_55_05 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Nike Sportswear Tech ',
        price: 90,
        rating: 4.8,
        imageUrl: 'assets/images/vecteezy_white-hoodie-isolated-on-transparent-background_45857884.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Adidas Essentials Hoodie',
        price: 45,
        rating: 4.7,
        imageUrl: 'assets/images/products/ChatGPT Image Mar 16, 2026, 09_57_05 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Puma Iconic Hoodie',
        price: 70,
        rating: 4.9,
        imageUrl: 'assets/images/products/ChatGPT Image Mar 16, 2026, 10_24_08 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Adidas Adistar XLG 2.0 ',
        price: 90,
        rating: 5.0,
        imageUrl: 'assets/images/products/ChatGPT Image Mar 16, 2026, 10_24_33 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Adidas Adistar 4.0 Shoes',
        price: 100,
        rating: 4.9,
        imageUrl: 'assets/images/products/ChatGPT Image Mar 16, 2026, 10_44_49 AM.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Gucci Cruiser Chunky ',
        price: 300,
        rating: 4.8,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_41_09_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Timberland Boot Elite',
        price: 150,
        rating: 4.9,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_41_15_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Reebok Nano Gym Shoes',
        price: 80,
        rating: 4.7,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_41_22_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Converse Chuck 70 High',
        price: 75,
        rating: 4.8,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_41_25_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'On Cloud Running Shoes',
        price: 140,
        rating: 5.0,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_50_38_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Hoka One One Carbon X',
        price: 175,
        rating: 4.9,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_50_58_AM-removebg-preview.png',
        isFavorite: false,
      ),
      ProductModel(
        name: 'Saucony Endorphin Speed',
        price: 160,
        rating: 5.0,
        imageUrl: 'assets/images/products/ChatGPT_Image_Mar_16__2026__09_51_01_AM-removebg-preview.png',
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
          childAspectRatio: 0.62, // نسبة الطول للعرض (تم تعديلها لتطابق الصورة الطويلة)
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final p = products[index % products.length];
          return ProductCard(p, onTap: onTap);
        }, childCount: products.length),
      ),
    );
  }
}

