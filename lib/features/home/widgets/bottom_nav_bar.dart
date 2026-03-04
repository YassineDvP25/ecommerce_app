import 'package:ecommerce/features/cart/views/cart_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  final icons = const [
    Icons.home_outlined,
    Icons.search,
    Icons.shopping_bag_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scale = width / 375;

    return Padding(
      padding: EdgeInsets.only(
        left: 10 * scale,
        right: 10 * scale,
        bottom: 20 * scale,
      ),
      child: Container(
        height: 65 * scale,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000), // لون رمادي أغمق

              Color(0xFF606060), // لون رمادي أغمق
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
                // 🔥 Handle navigation logic here based on the selected index
                // Example: Navigate to different screens based on index
                switch (index) {
                  case 0:
                    // Navigate to Home Screen

                    break;
                  case 1:
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CartScreen()),
                    );

                    // Navigate to Cart Screen
                    break;
                  case 3:
                    // Navigate to Profile Screen
                    break;
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.symmetric(
                  horizontal: selectedIndex == index ? 16 * scale : 0,
                  vertical: 12 * scale,
                ),
                decoration: BoxDecoration(
                  color:
                      selectedIndex == index
                          ? Colors.white
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      icons[index],
                      color:
                          selectedIndex == index ? Colors.black : Colors.white,
                      size: selectedIndex == index ? 26 * scale : 24 * scale,
                    ),
                    if (selectedIndex == index)
                      Padding(
                        padding: EdgeInsets.only(left: 4 * scale),
                        child: Text(
                          _label(index),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13 * scale,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _label(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Search";
      case 2:
        return "Cart";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
