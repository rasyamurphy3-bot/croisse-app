import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import '../services/shop_store.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onMenu});
  final VoidCallback onMenu;
  @override
  Widget build(BuildContext context) {
    final featured = ProductsData.all;
    return Scaffold(body: SafeArea(child: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(20, 16, 20, 14), child: Row(children: [const Text('croisse', style: TextStyle(fontFamily: 'TitanOne', fontSize: 27, color: AppColors.green)), const Spacer(), IconButton(onPressed: onMenu, icon: const Icon(Icons.grid_view_rounded, color: AppColors.green))]))),
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18), child: ClipRRect(borderRadius: BorderRadius.circular(26), child: Container(height: 230, color: AppColors.green, child: Stack(fit: StackFit.expand, children: [
        Image.asset('assets/images/brand/four_flavors.webp', fit: BoxFit.cover, errorBuilder: (_, __, ___) => const SizedBox()),
        Container(color: AppColors.dark.withOpacity(.38)),
        Padding(padding: const EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
          Text('FRESHLY BAKED', style: AppTextStyles.label.copyWith(color: AppColors.cream, letterSpacing: 2)),
          const SizedBox(height: 8), const Text('A little joy\nin every layer.', style: AppTextStyles.display.copyWith(fontSize: 31)),
          const SizedBox(height: 13), OutlinedButton(onPressed: onMenu, style: OutlinedButton.styleFrom(foregroundColor: AppColors.cream, side: const BorderSide(color: AppColors.cream)), child: const Text('EXPLORE MENU')),
        ])),
      ]))))),
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(20, 27, 20, 12), child: Row(children: [const Expanded(child: Text('Our favourites', style: AppTextStyles.title)), TextButton(onPressed: onMenu, child: const Text('Lihat semua'))]))),
      SliverPadding(padding: const EdgeInsets.fromLTRB(18, 0, 18, 24), sliver: SliverGrid(delegate: SliverChildBuilderDelegate((context, index) {
        final Product product = featured[index];
        return ProductCard(product: product, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product))), onAdd: () { ShopStore.instance.add(product); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${product.name} ditambahkan'))); });
      }, childCount: featured.length), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: .76))),
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 28), child: Text('${AppConfig.storeName}  •  ${AppConfig.tagline}', textAlign: TextAlign.center, style: AppTextStyles.bodySmall))),
    ])));
  }
}
