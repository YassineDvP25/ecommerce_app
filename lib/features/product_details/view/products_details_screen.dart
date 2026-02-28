import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as v;

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
    const Color(0xFF1C2238),
    Colors.black,
    Colors.blue,
    Colors.deepPurple,
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
          const _FloatingParticles(),

          /// MAIN CONTENT
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 420,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: GestureDetector(
                    onPanUpdate: (d) {
                      setState(() {
                        tiltX += d.delta.dx * 0.01;
                        tiltY += d.delta.dy * 0.01;
                      });
                    },
                    onPanEnd: (_) {
                      setState(() {
                        tiltX = 0;
                        tiltY = 0;
                      });
                    },
                    child: Center(
                      child: Transform(
                        alignment: Alignment.center,
                        transform:
                            Matrix4.identity()
                              ..rotateX(dragY)
                              ..rotateY(dragX),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          child: Hero(
                            key: ValueKey(selectedColorIndex),
                            tag: "product",
                            child: Image.asset(
                              "assets/images/black_hodie.png",
                              height: 300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

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
                              const Text(
                                "Cotton Sweater",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                          _quantity(),
                            ],
                          ),

                          const SizedBox(height: 25),

                          /// COLOR
                          Row(
                            children: List.generate(colors.length, (i) {
                              final selected = selectedColorIndex == i;

                              return GestureDetector(
                                onTap: () {
                                  setState(() => selectedColorIndex = i);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  margin: const EdgeInsets.only(right: 12),
                                  height: selected ? 40 : 30,
                                  width: selected ? 40 : 30,
                                  decoration: BoxDecoration(
                                    color: colors[i],
                                    shape: BoxShape.circle,
                                    boxShadow:
                                        selected
                                            ? [
                                              BoxShadow(
                                                color: colors[i].withOpacity(
                                                  0.6,
                                                ),
                                                blurRadius: 20,
                                              ),
                                            ]
                                            : [],
                                  ),
                                ),
                              );
                            }),
                          ),

                          const SizedBox(height: 30),
// SIZES LIST
                          Wrap(
                            spacing: 12,
                            children: List.generate(
                              sizes.length,
                              (i) => _size(i),
                            ),
                          ),

                          const SizedBox(height: 30),

                          /// DESCRIPTION
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          const SizedBox(height: 60),
                          Center(
                            child: Container(
                              width: 400,
                              height: 70,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: AnimatedBuilder(
                                animation: _buttonAnimation,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: 1 - (_buttonController.value * 0.05),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// Price
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Text(
                                            "\$${price.toStringAsFixed(1)}",
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),

                                        /// Buy Button
                                        GestureDetector(
                                          onTap: () async {
                                            await _buttonController.forward();
                                            await _buttonController.reverse();

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(
                                                  "Ultra Added To Cart 🚀",
                                                ),
                                              ),
                                            );
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 200,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 28,
                                              vertical: 14,
                                            ),
                                            decoration: BoxDecoration(
                                              color: themeColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    40 -
                                                        (_buttonController
                                                                .value *
                                                            10),
                                                  ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  Icons.shopping_bag_outlined,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  "Buy Now",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
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

      /// 💎 LIQUID MORPH BUTTON
    );
  }

  Widget _size(int i) {
    final selected = selectedSizeIndex == i;

    return GestureDetector(
      onTap: () {
        setState(() => selectedSizeIndex = i);
      },
      child: AnimatedScale(
        scale: selected ? 1.2 : 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: selected ? colors[selectedColorIndex] : Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            sizes[i],
            style: TextStyle(color: selected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _quantity() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (quantity > 1) {
              setState(() => quantity--);
            }
          },
          icon: const Icon(Icons.remove_circle_outline),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            "$quantity",
            key: ValueKey(quantity),
            style: const TextStyle(fontSize: 18),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() => quantity++);
          },
          icon: const Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}

/// ✨ FLOATING PARTICLES SYSTEM
class _FloatingParticles extends StatelessWidget {
  const _FloatingParticles();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: List.generate(
          15,
          (index) => Positioned(
            top: Random().nextDouble() * 800,
            left: Random().nextDouble() * 400,
            child: AnimatedOpacity(
              opacity: 0.2,
              duration: const Duration(seconds: 2),
              child: Container(
                height: Random().nextDouble() * 6 + 2,
                width: Random().nextDouble() * 6 + 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
