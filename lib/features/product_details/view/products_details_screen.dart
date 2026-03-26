import 'dart:ui';
import 'package:ecommerce/features/product_details/widgets/buy_button.dart';
import 'package:ecommerce/features/product_details/widgets/color_options.dart';
import 'package:ecommerce/features/product_details/widgets/description_widget.dart';
import 'package:ecommerce/features/product_details/widgets/sliver_app_bar_product_image.dart';
import 'package:ecommerce/features/product_details/widgets/sizes_list.dart';
import 'package:ecommerce/features/product_details/widgets/quantity_selector.dart';
import 'package:ecommerce/features/product_details/widgets/floating_particles.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  int selectedSizeIndex = 1;
  int selectedColorIndex = 0;
  int quantity = 1;
  // price shown in the buy button (could come from model in real app)
  double price = 44.5;
  final String description =
      "Premium quality cotton sweater with comfortable fit and breathable fabric. Perfect for casual wear and everyday style. Machine washable and durable.";

  late AnimationController _buttonController;
  late AnimationController _gyroController;
  late Animation<double> _buttonAnimation;

  double tiltX = 0;
  double tiltY = 0;

  double dragX = 0;
  double dragY = 0;

  final List<String> sizes = ["S", "M", "L", "XL", "XXL"];
  final List<Color> colors = [
    Colors.black,
    Colors.white,

    Colors.blue,
    // Colors.deepPurple,
    Colors.yellow,
  ];
  final List<String> imagePaths = [
    'assets/images/ChatGPT Image Mar 2, 2026, 11_54_22 AM.png',
    'assets/images/ChatGPT Image Mar 2, 2026, 12_21_43 PM.png',

    'assets/images/ChatGPT Image Mar 2, 2026, 12_18_03 PM.png',
    'assets/images/ChatGPT Image Mar 2, 2026, 12_28_33 PM.png',
  ];
  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _gyroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _buttonAnimation = CurvedAnimation(
      parent: _buttonController,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _gyroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = colors[selectedColorIndex];

    // determine if product colour is light so we can choose contrasting text
    final bool lightProduct =
        themeColor == Colors.white || themeColor == Colors.yellow;

    return Scaffold(
      backgroundColor: themeColor.withOpacity(0.15),

      body: Stack(
        children: [
          /// 🌫 Gradient Reactive Background
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.2,
                colors: [themeColor.withOpacity(0.4), Colors.white],
              ),
            ),
          ),

          /// ✨ Floating Particles
          const FloatingParticles(),

          /// MAIN CONTENT
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // sliver app bar with 3D product image and parallax effect
              SliverAppBarProduct(selectedColorIndex: selectedColorIndex),

              SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      color: Colors.white.withOpacity(0.7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              // Product Name and Quantity
                              const Text(
                                "Retro Nuptse Jacket",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              QuantitySelector(
                                quantity: quantity,
                                onIncrement: () => setState(() => quantity++),
                                onDecrement: () {
                                  if (quantity > 1) setState(() => quantity--);
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          /// COLOR OPTIONS widget
                          ColorOptions(
                            colors: colors,
                            selectedColorIndex: selectedColorIndex,
                            onColorSelected:
                                (i) => setState(() => selectedColorIndex = i),
                          ),

                          const SizedBox(height: 30),

                          // SIZES LIST widget
                          SizesList(
                            sizes: sizes,
                            selectedIndex: selectedSizeIndex,
                            onSelected:
                                (i) => setState(() => selectedSizeIndex = i),
                            colors: colors,
                            selectedColorIndex: selectedColorIndex,
                          ),

                          const SizedBox(height: 30),

                          /// DESCRIPTION widget
                          DescriptionWidget(description: description),

                          const SizedBox(height: 90),

                          /// BUY BUTTON widget
                          BuyButton(
                            price: price,
                            themeColor: themeColor,
                            lightProduct: lightProduct,
                            buttonController: _buttonController,
                            buttonAnimation: _buttonAnimation,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
