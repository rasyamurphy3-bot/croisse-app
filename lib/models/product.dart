import 'package:flutter/material.dart';

/// Kategori produk untuk filter di halaman Menu.
enum ProductCategory { sweet, savory }

extension ProductCategoryLabel on ProductCategory {
  String get label {
    switch (this) {
      case ProductCategory.sweet:
        return 'Manis & Kaya';
      case ProductCategory.savory:
        return 'Gurih & Renyah';
    }
  }
}

/// Satu produk croissant.
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.shortDescription,
    required this.description,
    required this.ingredients,
    required this.heroImage,
    required this.singleImage,
    required this.tileImage,
    required this.accent,
  });

  final String id;
  final String name;
  final int price; // dalam Rupiah
  final ProductCategory category;
  final String shortDescription;
  final String description;
  final String ingredients;
  final String heroImage; // foto dengan isian (halaman detail)
  final String singleImage; // croissant utuh (kartu produk)
  final String tileImage; // thumbnail kotak-kotak (keranjang/riwayat)
  final Color accent;
}
