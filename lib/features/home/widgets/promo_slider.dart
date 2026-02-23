import 'package:flutter/material.dart';

class PromoSlider extends StatefulWidget {
  final double scale;
  const PromoSlider({super.key, required this.scale});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final PageController _controller = PageController(viewportFraction: 0.959);
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 25 * widget.scale,
                    vertical: 13 * widget.scale,
                  ),
                  child: Row(
                    children: [
                      Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Container(
                          height: 143 * widget.scale,
                          width: 170 * widget.scale,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 246, 247),

                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Image.asset(
                            "assets/images/black_hodie.png",
                            width: 100 * widget.scale,
                          ),
                        ),
                      ),
                      SizedBox(width: 40 * widget.scale),

                      Column(
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
                              fontSize: 21 * widget.scale,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20 * widget.scale,
                              vertical: 12 * widget.scale,
                            ),
                            decoration: BoxDecoration(
                              // gradient
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF000000), // لون رمادي أغمق

                                  Color(0xFF606060), // لون رمادي أغمق
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Text(
                              "Shop Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14 * widget.scale,
                              ),
                            ),
                          ),
                        ],
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
