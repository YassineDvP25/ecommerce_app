import 'package:ecommerce/features/home/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoHome UI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2F2F2), // لون خلفية رمادي فاتح جداً مطابق للصورة
        fontFamily: 'Poppins', // تأكد من إضافة الخط في pubspec.yaml للحصول على التطابق 100%
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // 1. Header
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  sliver: SliverToBoxAdapter(child: CustomHeader()),
                ),

                // 2. Banner
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  sliver: SliverToBoxAdapter(child: PromoSlider(scale: 1.02)),
                ),

                // 3. Search Bar & Filter
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  sliver: SliverToBoxAdapter(child: SearchSection()),
                ),

                // 4. Categories (Mixed Layout: Text Pill vs Icon Circle)
                const SliverToBoxAdapter(child: CategorySelector()),

                // 5. Section Title
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  sliver: SliverToBoxAdapter(child: SectionHeader(title: "Top Picks Nearby")),
                ),

                // 6. Products Grid
                const ProductGridSliver(),

                // مسافة إضافية في الأسفل للبار العائم
                const SliverToBoxAdapter(child: SizedBox(height: 120)),
              ],
            ),
          ),

          // 7. Floating Bottom Navigation
          const Positioned(
            bottom: 35,
            left: 24,
            right: 24,
            child: CustomBottomNav(),
          ),
        ],
      ),
    );
  }
}

// --- 1. HEADER WIDGET ---
class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300?img=11'),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Billy Hanson", 
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black)),
                Text("Welcome Back", 
                  style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _headerIconBtn(Icons.favorite_border),
            const SizedBox(width: 12),
            _headerIconBtn(Icons.notifications_none),
          ],
        )
      ],
    );
  }

  Widget _headerIconBtn(IconData icon) {
    return Container(
      width: 45, height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Icon(icon, size: 22, color: Colors.black),
    );
  }
}

// --- 2. BANNER WIDGET ---

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
                    horizontal: 6 * widget.scale,
                    vertical: currentIndex == index ? 0 : 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(24 * widget.scale),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16 * widget.scale),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Introducing",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13 * widget.scale),
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
                                  vertical: 8 * widget.scale),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Shop Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12 * widget.scale,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/apparel.jpeg",
                        width: 90 * widget.scale,
                      )
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
        )
      ],
    );
  }
}


// --- 3. SEARCH SECTION ---
class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey, size: 26),
                const SizedBox(width: 12),
                Text("Search...", style: TextStyle(color: Colors.grey.shade400, fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // زر الفلتر الأسود المربع (Rounded)
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF1F2024), // أسود فحمي قليلاً
            borderRadius: BorderRadius.circular(20), // زوايا دائرية لكن ليست دائرة كاملة
          ),
          child: const Icon(Icons.tune, color: Colors.white, size: 24),
        )
      ],
    );
  }
}

// --- 4. CATEGORIES (EXACT MATCH LOGIC) ---
class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  // لاحظ: العنصر الأول مميز في التصميم، الباقي دوائر فقط
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.local_fire_department, "label": "Popular"},
    {"icon": Icons.checkroom, "label": "Apparel"}, // لن يظهر النص
    {"icon": Icons.sports_baseball, "label": "Sports"}, // لن يظهر النص
    {"icon": Icons.backpack, "label": "Bag"}, // لن يظهر النص
    {"icon": Icons.videogame_asset, "label": "Games"}, // لن يظهر النص
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, // ارتفاع كافٍ للظلال
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: isSelected 
              ? _buildActivePill(categories[index])
              : _buildInactiveCircle(categories[index]),
          );
        },
      ),
    );
  }

  // الشكل النشط (كبسولة سوداء مع أيقونة برتقالية)
  Widget _buildActivePill(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 6, 20, 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2024),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(item['icon'], color: Colors.deepOrange, size: 20),
          ),
          const SizedBox(width: 10),
          Text(
            item['label'],
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }

  // الشكل غير النشط (دائرة بيضاء فقط)
  Widget _buildInactiveCircle(Map<String, dynamic> item) {
    return Container(
      width: 52,
      height: 52,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(item['icon'], color: Colors.black, size: 24),
    );
  }
}

// --- 5. SECTION HEADER ---
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        const Text("See All", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

// --- 6. PRODUCTS GRID ---
class ProductGridSliver extends StatelessWidget {
  const ProductGridSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {"name": "Nike Kobe 5 Pro...", "price": "\$120", "img": "https://freepngimg.com/thumb/shoes/28530-3-nike-shoes-transparent.png", "rating": 5},
      {"name": "Nick Hoops Elite", "price": "\$40", "img": "https://freepngimg.com/thumb/backpack/5-2-backpack-png.png", "rating": 5},
      {"name": "Essentials Hood...", "price": "\$45", "img": "https://freepngimg.com/thumb/hoodie/3-2-hoodie-png-hd.png", "rating": 5}, // صورة مكررة للتجربة
      {"name": "Chest Logo Hoo...", "price": "\$55", "img": "https://freepngimg.com/thumb/hoodie/7-2-hoodie-png-picture.png", "rating": 5},
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.62, // نسبة الطول للعرض (تم تعديلها لتطابق الصورة الطويلة)
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final p = products[index % products.length];
            return ProductCard(product: p);
          },
          childCount: products.length,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // تدوير الحواف بشكل كبير
        boxShadow: [
           BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // أيقونة القلب
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.favorite_border, size: 22, color: Colors.grey),
            ),
            
            // الصورة
            Expanded(
              child: Center(
                child: Image.network(product['img'], fit: BoxFit.contain),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // الاسم
            Text(product['name'], 
              maxLines: 1, 
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            
            const SizedBox(height: 4),
            
            // التقييم (برتقالي)
            Row(
              children: List.generate(5, (index) => 
                const Icon(Icons.star, color: Color(0xFFFF7043), size: 14)), // لون برتقالي مطابق
            ),
            
            const SizedBox(height: 8),
            
            // السعر وزر الإضافة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(product['price'], 
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black)),
                
                // زر السلة الأسود
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.shopping_bag, color: Colors.white, size: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// --- 7. CUSTOM FLOATING NAV BAR ---
// class CustomBottomNavBar extends StatelessWidget {
//   const CustomBottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 76,
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//       decoration: BoxDecoration(
//         color: const Color(0xFF0D0D0D), // أسود غامق جداً
//         borderRadius: BorderRadius.circular(40),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 25, offset: const Offset(0, 10)),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Home Active Item
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Row(
//               children: const [
//                 Icon(Icons.home_filled, color: Colors.black, size: 24),
//                 SizedBox(width: 8),
//                 Text("Home", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
//               ],
//             ),
//           ),
          
//           // Other Icons
//           _navIcon(Icons.search),
//           _navIcon(Icons.shopping_bag_outlined),
//           _navIcon(Icons.person_outline),
//           const SizedBox(width: 10), // توازن المسافات
//         ],
//       ),
//     );
//   }

//   Widget _navIcon(IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: Icon(icon, color: Colors.white.withOpacity(0.8), size: 28),
//     );
//   }
// }