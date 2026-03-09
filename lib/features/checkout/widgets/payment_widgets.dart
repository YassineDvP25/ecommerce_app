import 'package:flutter/material.dart';

/// يعرض حقل الإدخال مع أيقونة اختيارية
class PaymentInputField extends StatelessWidget {
  final String? hint;
  final IconData? icon;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;

  const PaymentInputField({
    super.key,
    this.hint,
    this.icon,
    this.controller,
    this.onTap,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

/// خطوة في شريط التقدم
class ProgressStep extends StatelessWidget {
  final bool active;

  const ProgressStep({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
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
}

/// خط في شريط التقدم
class ProgressLine extends StatelessWidget {
  const ProgressLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(height: 3, color: Colors.green));
  }
}

/// مؤشر نقطة لتغيير البطاقة
class DotIndicator extends StatelessWidget {
  final bool active;

  const DotIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? 10 : 6,
      height: active ? 10 : 6,
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

/// تزيين بطاقة الائتمان
BoxDecoration cardDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF0F2A75), Color(0xFF2D8C9F)],
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 25,
        offset: const Offset(0, 12),
      ),
    ],
  );
}

Widget cardLightEffect() {
  return Positioned.fill(
    child: IgnorePointer(
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.15),
              Colors.transparent,
              Colors.transparent,
            ],
          ),
        ),
      ),
    ),
  );
}

/// بطاقة الدفع في الشاشة الرئيسية
class CardFront extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController nameController;
  final TextEditingController expiryController;

  const CardFront({
    super.key,
    required this.cardNumberController,
    required this.nameController,
    required this.expiryController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey(true),
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameController.text.isEmpty ? "Card Holder" : nameController.text,
            style: const TextStyle(color: Colors.white),
          ),

          const Spacer(),

          Text(
            cardNumberController.text.isEmpty
                ? "XXXX XXXX XXXX XXXX"
                : cardNumberController.text,
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            expiryController.text.isEmpty ? "MM/YY" : expiryController.text,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class CardBack extends StatelessWidget {
  final TextEditingController cvvController;

  const CardBack({super.key, required this.cvvController});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey(false),
      height: 200,
      decoration: cardDecoration(),
      child: Column(
        children: [
          Container(height: 50, color: Colors.black),

          const SizedBox(height: 20),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                cvvController.text.isEmpty ? "***" : cvvController.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final double width;

  const PaymentCard({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      height: width * .5,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xff0F2A75), Color(0xff2D8C9F)],
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 15),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Reshma Uday", style: TextStyle(color: Colors.white)),
          Spacer(),
          Text(
            "35-070-0003-3256-2022",
            style: TextStyle(color: Colors.white, letterSpacing: 2),
          ),
          SizedBox(height: 10),
          Text("Exp. 12/26", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
