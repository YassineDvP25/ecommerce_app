import 'package:ecommerce/features/checkout/cubit/checkout_cubit.dart';
import 'package:ecommerce/features/checkout/widgets/credit_card_form.dart';
import 'package:ecommerce/features/checkout/widgets/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

/// Payment method selection and credit card input screen
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  // ==================== Properties ====================
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  final formKey = GlobalKey<FormState>();
  CreditCardBrand creditCardBrand = CreditCardBrand(CardType.visa);

  // ==================== Lifecycle Methods ====================
  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // ==================== Build Method ====================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                return FadeTransition(
                  opacity: fadeAnimation,
                  child: SlideTransition(
                    position: slideAnimation,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: width * .06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),

                          /// Header Section
                          _buildHeader(),

                          const SizedBox(height: 30),

                          /// Progress Steps
                          _buildProgressSteps(),

                          const SizedBox(height: 50),

                          /// Credit Card Widget
                          CreditCardeWidget(
                            onCreditCardWidgetChange: (CreditCardBrand brand) {
                              creditCardBrand = brand;
                            },
                          ),

                          const SizedBox(height: 50),

                          /// Credit Card Form
                          CreditCardeForm(formKey: formKey),
                                                    const SizedBox(height: 100),


                          /// Pay Button
                          _buildPayButton(),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // ==================== Private Methods ====================
  /// Initialize fade and slide animations
  void _initializeAnimations() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOut);

    slideAnimation = Tween(
      begin: const Offset(0, .1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutCubic));

    controller.forward();
  }

  /// Build header with back button, title, and close button
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_back_ios),
        const Text(
          "Payment method",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const Icon(Icons.close),
      ],
    );
  }

  /// Build progress indicator with steps
  Widget _buildProgressSteps() {
    return Row(
      children: [
        _buildStep(active: true),
        _buildProgressLine(),
        _buildStep(active: true),
        _buildProgressLine(),
        _buildStep(active: false),
      ],
    );
  }

  /// Build individual progress step circle
  Widget _buildStep({required bool active}) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: active ? Colors.green : Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child:
          active
              ? const Icon(Icons.check, size: 14, color: Colors.white)
              : null,
    );
  }

  /// Build progress line between steps
  Widget _buildProgressLine() {
    return Expanded(child: Container(height: 3, color: Colors.green));
  }

  /// Build pay button
  Widget _buildPayButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: const Color(0xff4CD964),
        ),
        onPressed: () {
          // TODO: Implement payment processing
        },
        child: const Text(
          "Pay ₹1,129.00",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
