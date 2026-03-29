import 'dart:ui';
import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/theme/typography.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool obscure = true;
  bool obscureConfirm = true;

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
                          color: AppColors2.white,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Create Account 🚀",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors2.white,
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// CARD
                      glassCard(
                        child: Column(
                          children: [
                            /// NAME
                            customField(
                              controller: nameController,
                              hint: "Full Name",
                              icon: Icons.person_outline,
                              validator:
                                  (v) => v!.isEmpty ? "Name required" : null,
                            ),

                            const SizedBox(height: 15),

                            /// EMAIL
                            customField(
                              controller: emailController,
                              hint: "Email",
                              icon: Icons.email_outlined,
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Email required";
                                }
                                if (!v.contains("@")) {
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
                              validator: (v) {
                                if (v == null || v.length < 6) {
                                  return "Min 6 characters";
                                }
                                return null;
                              },
                              suffix: togglePass(() {
                                setState(() => obscure = !obscure);
                              }, obscure),
                            ),

                            const SizedBox(height: 15),

                            /// CONFIRM
                            customField(
                              controller: confirmController,
                              hint: "Confirm Password",
                              icon: Icons.lock_outline,
                              obscureText: obscureConfirm,
                              validator: (v) {
                                if (v != passwordController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                              suffix: togglePass(() {
                                setState(
                                  () => obscureConfirm = !obscureConfirm,
                                );
                              }, obscureConfirm),
                            ),

                            const SizedBox(height: 25),

                            /// BUTTON
                            signupButton(),

                            const SizedBox(height: 15),

                            /// BACK TO LOGIN
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account ? ",
                                  style: TextStyle(color: AppColors2.white70),
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    // Navigate to sign up screen
                                    AppRouter.navigateAndReplace(
                                      context,
                                      Routes.login,
                                    );
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: AppColors2.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    );
  }

  /// BUTTON
  Widget signupButton() {
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

        await Future.delayed(const Duration(milliseconds: 800));

        if (mounted) Navigator.pop(context);
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        height: 55,
        width: double.infinity,

        decoration: BoxDecoration(
          color: success ? AppColors2.green : AppColors2.white,
          borderRadius: BorderRadius.circular(18),
        ),

        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child:
                loading
                    ? const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors2.black,
                    )
                    : success
                    ? const Icon(Icons.check, color: AppColors2.white)
                    : const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors2.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          ),
        ),
      ),
    );
  }

  /// FIELD
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

      style: AppTypography.input,

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTypography.hint,
        prefixIcon: Icon(icon, color: AppColors2.white),
        suffixIcon: suffix,
        filled: true,
        fillColor: AppColors2.white.withOpacity(.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget togglePass(VoidCallback onTap, bool obscure) {
    return IconButton(
      icon: Icon(
        obscure ? Icons.visibility_off : Icons.visibility,
        color: AppColors2.white,
      ),
      onPressed: onTap,
    );
  }

  Widget glassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors2.white.withOpacity(.08),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors2.white.withOpacity(.2)),
          ),
          child: child,
        ),
      ),
    );
  }
}
