import 'package:ecommerce/features/profile/widgets/actions_list.dart';
import 'package:ecommerce/features/profile/widgets/profile_card.dart';
import 'package:ecommerce/features/profile/widgets/profile_header.dart';
import 'package:ecommerce/features/profile/widgets/top_curve.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 650),
      vsync: this,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = size.width / 375; // Responsive scale based on iPhone X width

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: Stack(
        children: [
          TopCurve(scale: scale),
          SafeArea(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) => FadeTransition(
                opacity: _fade,
                child: SlideTransition(position: _slide, child: child),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * scale,
                  vertical: 18 * scale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ProfileHeader(scale: scale),
                    SizedBox(height: 24 * scale),
                    ProfileCard(scale: scale),
                    SizedBox(height: 18 * scale),
                    ActionsList(scale: scale),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

