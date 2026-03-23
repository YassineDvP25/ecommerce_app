import 'package:flutter/material.dart';

class PromoSlider extends StatefulWidget {
  final double scale;
  const PromoSlider({super.key, required this.scale});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> promoItems = [
    {
      'image': 'assets/images/products/ChatGPT Image Mar 16, 2026, 10_44_49 AM.png',
      'title': 'Top Trending\nShoes',
    },
    {
      'image': 'assets/images/products/ChatGPT Image Mar 14, 2026, 10_55_05 AM.png',
      'title': 'New Winter\nHoodies',
    },
    {
      'image': 'assets/images/products/ChatGPT Image Mar 11, 2026, 12_44_47 PM.png',
      'title': 'Top Trending\nJackets',
    },
  ];
  late final PageController _controller;
  late final AnimationController _enterController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.959);
    _enterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _enterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fade = CurvedAnimation(
      parent: _enterController,
      curve: Curves.easeOut,
    );
    final slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _enterController,
      curve: Curves.easeOutCubic,
    ));

    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: Column(
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
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (_, child) {
                      double page = 0;
                      if (_controller.hasClients && _controller.page != null) {
                        page = _controller.page!;
                      }
                      final distance =
                          (page - index).abs().clamp(0.0, 1.0); // 0..1
                      final scale = 1 - (distance * 0.08);
                      final vertical = 12 * distance;

                      return Transform.scale(
                        scale: scale,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 320),
                          margin: EdgeInsets.symmetric(
                            horizontal: 10 * widget.scale,
                            vertical: vertical,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              24 * widget.scale,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.06),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: child,
                        ),
                      );
                    },
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
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 245, 246, 247),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Image.asset(
                                promoItems[index]['image']!,
                                width: 100 * widget.scale,
                              ),
                            ),
                          ),
                          SizedBox(width: 20 * widget.scale),
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
                                promoItems[index]['title']!,
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
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF000000),
                                      Color(0xFF606060),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
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
                    color: currentIndex == index
                        ? Colors.black
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
