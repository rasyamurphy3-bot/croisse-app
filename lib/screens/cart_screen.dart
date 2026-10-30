import 'package:flutter/material.dart';
import '../services/shop_store.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/currency.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) => AnimatedBuilder(animation: ShopStore.instance, builder: (context, _) {
    final store = ShopStore.instance;
    return Scaffold(appBar: AppBar(title: const Text('YOUR CART')),
      body: store.items.isEmpty ? const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.shopping_bag_outlined, size: 58, color: AppColors.green), SizedBox(height: 12), Text('Keranjang masih kosong', style: AppTextStyles.heading), Text('Yuk pilih croissant favoritmu!')])) :
      Column(children: [Expanded(child: ListView.separated(padding: const EdgeInsets.all(16), itemCount: store.items.length, separatorBuilder: (_, __) => const SizedBox(height: 12), itemBuilder: (context, i) {
        final item = store.items[i];
        return Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Row(children: [
          ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(item.product.tileImage, width: 76, height: 76, fit: BoxFit.cover)),
          const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item.product.name, style: AppTextStyles.heading), const SizedBox(height: 5), Text(formatRupiah(item.product.price), style: AppTextStyles.price), const SizedBox(height: 8), Row(children: [IconButton(onPressed: () => store.decrease(item.product), icon: const Icon(Icons.remove_circle_outline), visualDensity: VisualDensity.compact), Text('${item.quantity}', style: AppTextStyles.heading), IconButton(onPressed: () => store.increase(item.product), icon: const Icon(Icons.add_circle_outline), visualDensity: VisualDensity.compact), const Spacer(), IconButton(onPressed: () => store.remove(item.product), icon: const Icon(Icons.delete_outline, color: AppColors.red))])])),
        ]));
      })), Container(padding: const EdgeInsets.fromLTRB(20, 16, 20, 22), decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))), child: SafeArea(top: false, child: Column(children: [Row(children: [const Expanded(child: Text('Total', style: AppTextStyles.heading)), Text(formatRupiah(store.total), style: AppTextStyles.price.copyWith(fontSize: 20))]), const SizedBox(height: 14), SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen())), child: const Text('LANJUT CHECKOUT'))]))))]),
    );
  });
}
