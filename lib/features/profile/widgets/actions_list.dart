import 'package:flutter/material.dart';
import 'action_item.dart';
import 'action_tile.dart';

class ActionsList extends StatelessWidget {
  const ActionsList({super.key, required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    final items = [
      ActionItem(
        icon: Icons.person_outline,
        title: "Profile",
        subtitle: "Shopping, Email, Password, Shoe Size",
      ),
      ActionItem(
        icon: Icons.shopping_bag_outlined,
        title: "Buying",
        subtitle: "Active Bids, In Progress, Orders",
      ),
      ActionItem(
        icon: Icons.sell_outlined,
        title: "Selling",
        subtitle: "Active Asks, Sales, Seller Profile",
      ),
      ActionItem(
        icon: Icons.favorite_border,
        title: "Favorites",
        subtitle: "Items and Lists You've Saved",
      ),
      ActionItem(
        icon: Icons.pie_chart_outline,
        title: "Portfolio",
        subtitle: "See The Value of Your Items",
      ),
      ActionItem(
        icon: Icons.account_balance_wallet_outlined,
        title: "Wallet",
        subtitle: "Payments, Payout, Gift Cards, Credits",
      ),
      ActionItem(
        icon: Icons.settings_outlined,
        title: "Settings",
        subtitle: "Security And Notifications",
      ),
    ];

    return Column(
      children: List.generate(
        items.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            bottom: index == items.length - 1 ? 0 : 12 * scale,
          ),
          child: ActionTile(item: items[index], scale: scale),
        ),
      ),
    );
  }
}
