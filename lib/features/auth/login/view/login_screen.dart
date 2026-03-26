import 'dart:ui';
import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/auth/login/widgets/custom_submit_btn.dart';
import 'package:ecommerce/features/auth/login/widgets/social_buttons.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Route route() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, animation, __) => const LoginScreen(),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0, .08),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool obscure = true;
  bool loading = false;
  bool success = false;

  late AnimationController bgController;

  @override
  void initState() {
    super.initState();

    bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND
          Positioned.fill(
            child: Image.asset("assets/images/s.jpeg", fit: BoxFit.cover),
          ),

          /// CONTENT
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),

                child: Form(
                  key: formKey,

                  child: Column(
                    children: [
                      /// HERO LOGO
                      Hero(
                        tag: "appLogo",
                        child: const Icon(
                          Icons.shopping_bag,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Welcome Back 👋",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// GLASS CARD
                      glassCard(
                        child: Column(
                          children: [
                            /// EMAIL
                            customField(
                              controller: emailController,
                              hint: "Email",
                              icon: Icons.email_outlined,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email required";
                                }
                                if (!value.contains("@")) {
                                  return "Invalid email";
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 15),

                            /// PASSWORD
                            customField(
                              controller: passwordController,
                              hint: "Password",
                              icon: Icons.lock_outline,
                              obscureText: obscure,
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return "Min 6 characters";
                                }
                                return null;
                              },
                              suffix: IconButton(
                                icon: Icon(
                                  obscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() => obscure = !obscure);
                                },
                              ),
                            ),

                            const SizedBox(height: 25),

                            /// LOGIN BUTTON
                            CustomSubmitBtn(
                              text: 'Login',
                              onPressed: () async {
                                if (!formKey.currentState!.validate()) return;

                                setState(() {
                                  loading = true;
                                  success = false;
                                });

                                await Future.delayed(
                                  const Duration(seconds: 2),
                                );

                                setState(() {
                                  loading = false;
                                  success = true;
                                });

                                /// 🔥 الانتقال بعد النجاح
                                await Future.delayed(
                                  const Duration(milliseconds: 800),
                                );

                                if (mounted) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 90),
                      SocialButtons(),
                      // you have not an account? sign up
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              // Navigate to sign up screen
                              AppRouter.navigateAndReplace(
                                context,
                                Routes.signup,
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // // SOCIAL BUTTONS
            // Positioned(
            //   bottom: 50,
            //   left: 20,
            //   right: 20,
            //   child: SocialButtons(),
            // ),
          ),
        ],
      ),
    );
  }

  /// GLASS CARD
  Widget glassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.08),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white.withOpacity(.2)),
          ),
          child: child,
        ),
      ),
    );
  }

  /// INPUT FIELD
  Widget customField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    Widget? suffix,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,

      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),

        prefixIcon: Icon(icon, color: Colors.white),

        suffixIcon: suffix,

        filled: true,
        fillColor: Colors.white.withOpacity(.05),

        errorStyle: const TextStyle(color: Colors.redAccent),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// LOGIN BUTTON
  Widget loginButton() {
    return GestureDetector(
      onTap: () async {
        if (!formKey.currentState!.validate()) return;

        setState(() {
          loading = true;
          success = false;
        });

        await Future.delayed(const Duration(seconds: 2));

        setState(() {
          loading = false;
          success = true;
        });

        /// 🔥 الانتقال بعد النجاح
        await Future.delayed(const Duration(milliseconds: 800));

        if (mounted) {
          Navigator.pop(context);
        }
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        height: 55,
        width: double.infinity,

        decoration: BoxDecoration(
          color: success ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),

        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),

            child:
                loading
                    ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black,
                      ),
                    )
                    : success
                    ? const Icon(Icons.check, color: Colors.white)
                    : const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
