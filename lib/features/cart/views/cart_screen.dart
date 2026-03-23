import 'package:flutter/material.dart';
import 'package:ecommerce/features/cart/models/cart_item.dart';
import 'package:ecommerce/features/cart/widgets/cart_item_card.dart';
import 'package:ecommerce/features/cart/widgets/summary_section.dart';

// CartItem model moved to models/cart_item.dart

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  final List<CartItem> items = [
    CartItem(
      title: 'Top Picks Nearby',
      price: 120,
      imageUrl: 'assets/images/ChatGPT Image Mar 2, 2026, 12_28_33 PM.png',
    ),
    CartItem(
      title: 'Top Picks Nearby',
      price: 120,
      imageUrl: 'assets/images/ChatGPT Image Mar 2, 2026, 11_54_22 AM.png',
    ),
    CartItem(
      title: 'Top Picks Nearby',
      price: 120,
      imageUrl:
          'assets/images/vecteezy_white-hoodie-isolated-on-transparent-background_45857884.png',
    ),
  ];

  double get subtotal =>
      items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  double get tax => subtotal * 0.07;

  double get total => subtotal + tax;

  late final AnimationController _controller;

  void _increment(int index) {
    setState(() => items[index].quantity++);
  }

  void _decrement(int index) {
    if (items[index].quantity > 1) {
      setState(() => items[index].quantity--);
    }
  }

  void _remove(int index) {
    setState(() => items.removeAt(index));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      
      
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            final fade = CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOut,
            );
            final slide = Tween<Offset>(
              begin: const Offset(0, 0.06),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
            );

            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
            );
          },
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isTablet ? 700 : double.infinity,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];

                          final itemAnimation = CurvedAnimation(
                            parent: _controller,
                            curve: Interval(
                              0.1 + (index * 0.08),
                              0.6 + (index * 0.08),
                              curve: Curves.easeOutCubic,
                            ),
                          );

                          return FadeTransition(
                            opacity: itemAnimation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.08),
                                end: Offset.zero,
                              ).animate(itemAnimation),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Dismissible(
                                  key: ValueKey(item),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (_) => _remove(index),
                                  background: Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: CartItemCard(
                                    item: item,
                                    onAdd: () => _increment(index),
                                    onRemove: () => _decrement(index),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SummarySection(subtotal: subtotal, tax: tax, total: total),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

