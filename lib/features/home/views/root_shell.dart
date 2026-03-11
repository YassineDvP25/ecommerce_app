import 'package:ecommerce/features/cart/views/cart_screen.dart';
import 'package:ecommerce/features/home/views/home_screen.dart';
import 'package:ecommerce/features/home/widgets/bottom_nav_bar.dart';
import 'package:ecommerce/features/profile/views/profile_screen.dart';
import 'package:ecommerce/features/search/views/search_screen.dart';
import 'package:flutter/material.dart';

/// Root shell that keeps the bottom nav visible across main tabs
class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _currentIndex = 0;
  int _previousIndex = 0;

  late final List<Widget> _pages = [
    const HomeScreen(onSearchTap: null), // onSearchTap injected in initState
    const SearchScreen(onClose: null),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // Inject callback into HomeScreen to switch to Search tab
    _pages[0] = HomeScreen(
      onSearchTap: () => _setIndex(1),
      key: const PageStorageKey('home'),
    );
    _pages[1] = SearchScreen(
      onClose: () => _setIndex(0),
      key: const PageStorageKey('search'),
    );
    _pages[2] = const CartScreen(key: PageStorageKey('cart'));
    _pages[3] = const ProfileScreen(key: PageStorageKey('profile'));
  }

  void _setIndex(int index) {
    setState(() {
      _previousIndex = _currentIndex;
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 520),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeOutCubic,
        transitionBuilder: (child, animation) {
          final forward = _currentIndex >= _previousIndex;
          final slideTween = Tween<Offset>(
            begin: Offset(forward ? 0.12 : -0.12, 0.02),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic));

          final fade = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          );

          final scaleTween = Tween<double>(begin: 0.98, end: 1.0)
              .chain(CurveTween(curve: Curves.easeOut));

          return FadeTransition(
            opacity: fade,
            child: SlideTransition(
              position: animation.drive(slideTween),
              child: ScaleTransition(
                scale: animation.drive(scaleTween),
                child: child,
              ),
            ),
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_currentIndex),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
        child: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _setIndex,
        ),
      ),
    );
  }
}
