import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/shop_store.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/currency.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.paper,
    appBar: AppBar(title: const Text('DETAIL PRODUK')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      ClipRRect(borderRadius: BorderRadius.circular(24), child: Container(color: Colors.white, height: 300, child: Image.asset(product.heroImage, fit: BoxFit.contain, errorBuilder: (_, __, ___) => Image.asset(product.singleImage, fit: BoxFit.contain)))),
      const SizedBox(height: 22), Text(product.name, style: AppTextStyles.title),
      const SizedBox(height: 8), Text(formatRupiah(product.price), style: AppTextStyles.price.copyWith(fontSize: 20)),
      const SizedBox(height: 16), Text(product.description, style: AppTextStyles.body),
      const SizedBox(height: 12), Text('BAHAN PILIHAN', style: AppTextStyles.label),
      const SizedBox(height: 5), Text(product.ingredients, style: AppTextStyles.body),
      const SizedBox(height: 28), ElevatedButton.icon(onPressed: () { ShopStore.instance.add(product); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ditambahkan ke keranjang'))); }, icon: const Icon(Icons.add_shopping_cart), label: const Text('TAMBAH KE KERANJANG')),
    ]),
  );
}
