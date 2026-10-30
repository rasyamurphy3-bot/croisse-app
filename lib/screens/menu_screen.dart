import 'package:flutter/material.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import '../services/shop_store.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('OUR MENU')),
    body: GridView.builder(padding: const EdgeInsets.all(16), itemCount: ProductsData.all.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: .76),
      itemBuilder: (context, index) { final Product p = ProductsData.all[index]; return ProductCard(product: p,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
        onAdd: () { ShopStore.instance.add(p); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${p.name} ditambahkan'))); }); },
    ),
  );
}
