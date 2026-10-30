import 'package:flutter/material.dart';
import '../services/shop_store.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/currency.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) => AnimatedBuilder(animation: ShopStore.instance, builder: (context, _) {
    final orders = ShopStore.instance.orders;
    return Scaffold(appBar: AppBar(title: const Text('ORDER HISTORY')), body: orders.isEmpty
      ? const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.receipt_long_outlined, size: 58, color: AppColors.green), SizedBox(height: 12), Text('Belum ada riwayat pesanan', style: AppTextStyles.heading)]))
      : ListView.separated(padding: const EdgeInsets.all(16), itemCount: orders.length, separatorBuilder: (_, __) => const SizedBox(height: 12), itemBuilder: (context, i) {
        final order = orders[i];
        return Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Expanded(child: Text('Pesanan #${order.id.substring(order.id.length > 6 ? order.id.length - 6 : 0)}', style: AppTextStyles.heading)), Text('${order.createdAt.day.toString().padLeft(2, '0')}/${order.createdAt.month.toString().padLeft(2, '0')}/${order.createdAt.year}', style: AppTextStyles.bodySmall)]),
          const SizedBox(height: 8), ...order.lines.map((line) => Padding(padding: const EdgeInsets.symmetric(vertical: 2), child: Text('${line.name} × ${line.quantity}', style: AppTextStyles.body))),
          const Divider(), Row(children: [Expanded(child: Text('${order.method} • ${order.customerName}', style: AppTextStyles.bodySmall)), Text(formatRupiah(order.total), style: AppTextStyles.price)]),
        ]));
      }));
  });
}
