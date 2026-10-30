import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../utils/currency.dart';

/// LAYAR SEMENTARA untuk memastikan tema, font, foto, dan data berfungsi.
/// File ini akan dihapus/diganti di tahap berikutnya.
class SetupCheckScreen extends StatelessWidget {
  const SetupCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: AppColors.green,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('croisse', style: AppTextStyles.logo),
                  const SizedBox(height: 14),
                  const Text('Fresh\nCroissants', style: AppTextStyles.display),
                  const SizedBox(height: 10),
                  Text(
                    'Pemeriksaan Tahap 2 & 3 berhasil jika semua foto tampil.',
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.cream),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: ProductsData.all.length + 1,
                separatorBuilder: (BuildContext _, int __) =>
                    const SizedBox(height: 14),
                itemBuilder: (BuildContext context, int index) {
                  if (index == ProductsData.all.length) {
                    return Text(
                      'Nomor WhatsApp toko: ${AppConfig.whatsappNumber}',
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.center,
                    );
                  }
                  return _ProductRow(product: ProductsData.all[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  const _ProductRow({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            child: SizedBox(
              width: 76,
              height: 76,
              child: _SafeImage(path: product.tileImage, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 72,
            height: 72,
            child: _SafeImage(path: product.singleImage, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.name.toUpperCase(),
                    style: AppTextStyles.heading.copyWith(fontSize: 13)),
                const SizedBox(height: 4),
                Text(formatRupiah(product.price), style: AppTextStyles.price),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Menampilkan foto; jika file tidak ditemukan, tampil ikon pengganti
/// (supaya mudah diketahui jika ada aset yang salah letak).
class _SafeImage extends StatelessWidget {
  const _SafeImage({required this.path, required this.fit});

  final String path;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      errorBuilder: (BuildContext context, Object error, StackTrace? stack) {
        return const Center(
          child: Icon(Icons.broken_image_outlined, color: AppColors.red),
        );
      },
    );
  }
}
