import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

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
                onTap(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.symmetric(
                  horizontal: currentIndex == index ? 16 * scale : 0,
                  vertical: 12 * scale,
                ),
                decoration: BoxDecoration(
                  color:
                      currentIndex == index
                          ? Colors.white
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      icons[index],
                      color:
                          currentIndex == index ? Colors.black : Colors.white,
                      size: currentIndex == index ? 26 * scale : 24 * scale,
                    ),
                    if (currentIndex == index)
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
