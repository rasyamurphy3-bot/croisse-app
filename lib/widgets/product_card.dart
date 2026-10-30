import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/currency.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap, required this.onAdd});
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onAdd;
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    clipBehavior: Clip.antiAlias,
    child: InkWell(onTap: onTap, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Stack(fit: StackFit.expand, children: [
        Image.asset(product.singleImage, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Icon(Icons.bakery_dining, size: 48)),
        Positioned(right: 10, top: 10, child: Container(padding: const EdgeInsets.all(7), decoration: const BoxDecoration(color: AppColors.paper, shape: BoxShape.circle), child: const Icon(Icons.favorite_border, size: 16, color: AppColors.green))),
      ])),
      Padding(padding: const EdgeInsets.fromLTRB(12, 4, 12, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.heading.copyWith(fontSize: 14)),
        const SizedBox(height: 4),
        Row(children: [Expanded(child: Text(formatRupiah(product.price), style: AppTextStyles.price)), InkWell(onTap: onAdd, borderRadius: BorderRadius.circular(20), child: const CircleAvatar(radius: 17, backgroundColor: AppColors.green, child: Icon(Icons.add, color: Colors.white, size: 20))) ]),
      ])),
    ])),
  );
}
