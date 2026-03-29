import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/theme/typography.dart';

class SummarySection extends StatefulWidget {
  final double subtotal;
  final double tax;
  final double total;

  const SummarySection({
    super.key,
    required this.subtotal,
    required this.tax,
    required this.total,
  });

  @override
  State<SummarySection> createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  final TextEditingController _promoController = TextEditingController();
  bool _applied = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        children: [
          // promo code row
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _promoController,
                  decoration: InputDecoration(
                    hintText: 'Promo Code',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed:
                      _applied
                          ? null
                          : () {
                            setState(() {
                              _applied = true;
                            });
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors2.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Text(
                    _applied ? 'Applied' : 'Apply',
                    style: TextStyle(
                      color: _applied ? Colors.grey : AppColors2.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _priceRow('Order Amount', widget.subtotal),
          const SizedBox(height: 6),
          _priceRow('Tax (7%)', widget.tax),
          const Divider(height: 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _priceRow(
              'Total Payment',
              widget.total,
              isBold: true,
              key: ValueKey(widget.total),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors2.black, AppColors2.darkBorder],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.checkout);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,

                  backgroundColor: AppColors2.white,
                  shadowColor: AppColors2.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors2.black, width: 0.9),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Proceed To Checkout',
                  style: AppTypography.bodyLargeBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
    String title,
    double value, {
    bool isBold = false,
    Key? key,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
