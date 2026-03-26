import 'package:ecommerce/features/auth/signup/view/signup_screen.dart';
import 'package:ecommerce/features/cart/views/cart_screen.dart';
import 'package:ecommerce/features/checkout/cubit/checkout_cubit.dart';
import 'package:ecommerce/features/checkout/views/checkout_screen.dart';
import 'package:ecommerce/features/profile/views/profile_screen.dart';
import 'package:ecommerce/features/home/views/root_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';
import 'package:ecommerce/features/auth/login/view/login_screen.dart';



/// Application Router
class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _buildRoute(const RootShell(), settings);
      case Routes.cart:
        return _buildRoute(CartScreen(), settings);
      case Routes.profile:
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 550),
          pageBuilder: (_, animation, __) => const ProfileScreen(),
          transitionsBuilder: (_, animation, __, child) {
            final fade = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            );
            final slide = Tween(
              begin: const Offset(0, 0.08),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );
            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
            );
          },
        );
      case Routes.checkout:
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder:
              (_, animation, __) => BlocProvider(
                create: (context) => CheckoutCubit(),
                child: const CheckoutScreen(),
              ),
          transitionsBuilder: (_, animation, __, child) {
            final slide = Tween(
              begin: const Offset(0, 0.15),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: slide, child: child),
            );
          },
        );
      case Routes.login:
      return _buildRoute(const LoginScreen(), settings);
        
      case Routes.signup:
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => const SignUpScreen(),
          transitionsBuilder: (_, animation, __, child) {
            final fade = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            );
            final slide = Tween(
              begin: const Offset(0.0, 0.3),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
            );
          },
        );
      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          settings,
        );

    }
  }

  static PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static void navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateAndReplace(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigateAndRemoveUntil(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
