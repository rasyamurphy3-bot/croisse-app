import 'package:flutter/material.dart';
import '../services/shop_store.dart';
import '../theme/app_colors.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'menu_screen.dart';
import 'order_history_screen.dart';
import 'splash_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}
class _MainShellState extends State<MainShell> {
  int _index = 0;
  bool _showSplash = true;
  @override
  void initState() { super.initState(); ShopStore.instance.loadHistory(); }
  @override
  Widget build(BuildContext context) {
    if (_showSplash) return SplashScreen(onDone: () { if (mounted) setState(() => _showSplash = false); });
    final pages = [HomeScreen(onMenu: () => setState(() => _index = 1)), const MenuScreen(), const CartScreen(), const OrderHistoryScreen()];
    return Scaffold(body: IndexedStack(index: _index, children: pages), bottomNavigationBar: AnimatedBuilder(animation: ShopStore.instance, builder: (context, _) => NavigationBar(
      selectedIndex: _index, onDestinationSelected: (i) => setState(() => _index = i), backgroundColor: Colors.white, indicatorColor: AppColors.cream,
      destinations: [
        const NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        const NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view), label: 'Menu'),
        NavigationDestination(icon: Badge(isLabelVisible: ShopStore.instance.itemCount > 0, label: Text('${ShopStore.instance.itemCount}'), child: const Icon(Icons.shopping_bag_outlined)), selectedIcon: const Icon(Icons.shopping_bag), label: 'Cart'),
        const NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'History'),
      ],
    )));
  }
}
