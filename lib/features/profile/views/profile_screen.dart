import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 650),
      vsync: this,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = size.width / 375; // Responsive scale based on iPhone X width

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: Stack(
        children: [
          _TopCurve(scale: scale),
          SafeArea(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) => FadeTransition(
                opacity: _fade,
                child: SlideTransition(position: _slide, child: child),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * scale,
                  vertical: 18 * scale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Header(scale: scale),
                    SizedBox(height: 24 * scale),
                    _ProfileCard(scale: scale),
                    SizedBox(height: 18 * scale),
                    _QuickActions(scale: scale),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopCurve extends StatelessWidget {
  const _TopCurve({required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220 * scale,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E1E1E), Color(0xFF3F3F3F)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 26 * scale,
          decoration: const BoxDecoration(
            color: Color(0xFFF3F3F3),
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CircleIcon(
          icon: Icons.tune_rounded,
          scale: scale,
          onTap: () => AppRouter.goBack(context),
        ),
        Text(
          "Profile",
          style: TextStyle(
            fontSize: 20 * scale,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.3,
          ),
        ),
        _CircleIcon(
          icon: Icons.edit_outlined,
          scale: scale,
          onTap: () {},
        ),
      ],
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({
    required this.icon,
    required this.scale,
    this.onTap,
  });

  final IconData icon;
  final double scale;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44 * scale,
        width: 44 * scale,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.12),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: 22 * scale),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 * scale, vertical: 18 * scale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22 * scale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 42 * scale,
            backgroundImage: const NetworkImage(
              "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80",
            ),
          ),
          SizedBox(height: 12 * scale),
          Text(
            "Billy Hanson",
            style: TextStyle(
              fontSize: 20 * scale,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 6 * scale),
          Text(
            "terri_greene@gmail.com",
            style: TextStyle(
              fontSize: 14 * scale,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions({required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    final items = [
      _ActionItem(
        icon: Icons.person_outline,
        title: "Profile",
        subtitle: "Shopping, Email, Password, Shoe Size",
      ),
      _ActionItem(
        icon: Icons.shopping_bag_outlined,
        title: "Buying",
        subtitle: "Active Bids, In Progress, Orders",
      ),
      _ActionItem(
        icon: Icons.sell_outlined,
        title: "Selling",
        subtitle: "Active Asks, Sales, Seller Profile",
      ),
      _ActionItem(
        icon: Icons.favorite_border,
        title: "Favorites",
        subtitle: "Items and Lists You've Saved",
      ),
      _ActionItem(
        icon: Icons.pie_chart_outline,
        title: "Portfolio",
        subtitle: "See The Value of Your Items",
      ),
      _ActionItem(
        icon: Icons.account_balance_wallet_outlined,
        title: "Wallet",
        subtitle: "Payments, Payout, Gift Cards, Credits",
      ),
      _ActionItem(
        icon: Icons.settings_outlined,
        title: "Settings",
        subtitle: "Security And Notifications",
      ),
    ];

    return Column(
      children: List.generate(
        items.length,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: index == items.length - 1 ? 0 : 12 * scale),
          child: _ActionTile(
            item: items[index],
            scale: scale,
          ),
        ),
      ),
    );
  }
}

class _ActionItem {
  _ActionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.item, required this.scale});

  final _ActionItem item;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16 * scale, vertical: 14 * scale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18 * scale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 44 * scale,
            width: 44 * scale,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.icon,
              color: Colors.black87,
              size: 22 * scale,
            ),
          ),
          SizedBox(width: 14 * scale),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 15 * scale,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 4 * scale),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 12.5 * scale,
                    color: Colors.black.withOpacity(0.55),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.black.withOpacity(0.4),
            size: 22 * scale,
          ),
        ],
      ),
    );
  }
}
