import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
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
                ),          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  horizontal: selectedIndex == index
                      ? 16 * scale
                      : 0,
                  vertical: 14 * scale,
                ),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      icons[index],
                      color: selectedIndex == index
                          ? Colors.black
                          : Colors.white,
                      size: 24 * scale,
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
                      )
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
