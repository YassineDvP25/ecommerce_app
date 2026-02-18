import 'package:flutter/material.dart';

class PromoSlider extends StatefulWidget {
  final double scale;
  const PromoSlider({super.key, required this.scale});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final PageController _controller = PageController(viewportFraction: .9);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170 * widget.scale,
          child: PageView.builder(
            controller: _controller,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: EdgeInsets.symmetric(
                  horizontal: 10 * widget.scale,
                  vertical: currentIndex == index ? 0 : 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24 * widget.scale),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16 * widget.scale),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Introducing",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13 * widget.scale,
                              ),
                            ),
                            SizedBox(height: 6 * widget.scale),
                            Text(
                              "Top Trending\nHoodies",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18 * widget.scale,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16 * widget.scale,
                                vertical: 8 * widget.scale,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Shop Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12 * widget.scale,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/apparel.jpeg",
                        width: 90 * widget.scale,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12 * widget.scale),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: currentIndex == index ? 20 : 6,
              decoration: BoxDecoration(
                color:
                    currentIndex == index ? Colors.black : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
