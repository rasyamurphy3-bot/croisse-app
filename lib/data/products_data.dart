import '../models/product.dart';
import '../theme/app_colors.dart';

/// Daftar menu CROISSE. Untuk mengubah harga atau deskripsi, edit di sini.
class ProductsData {
  ProductsData._();

  static const List<Product> all = <Product>[
    Product(
      id: 'matcha',
      name: 'Matcha Croissant',
      price: 40000,
      category: ProductCategory.sweet,
      shortDescription:
          'Berbalut bubuk matcha dengan isian krim teh hijau yang melimpah.',
      description:
          'Wangi dan khas, berbalut bubuk matcha dengan isian krim teh hijau yang melimpah.',
      ingredients: 'Pastry mentega, bubuk matcha, krim teh hijau.',
      heroImage: 'assets/images/products/matcha_hero.webp',
      singleImage: 'assets/images/products/matcha_single.webp',
      tileImage: 'assets/images/products/matcha_tile.jpg',
      accent: AppColors.green,
    ),
    Product(
      id: 'chocolate',
      name: 'Chocolate Croissant',
      price: 40000,
      category: ProductCategory.sweet,
      shortDescription: 'Bertabur kakao dengan isian cokelat yang lumer.',
      description:
          'Manis dan kaya rasa, bertabur bubuk kakao dengan isian lelehan cokelat yang lumer.',
      ingredients: 'Pastry mentega, bubuk kakao, lelehan cokelat.',
      heroImage: 'assets/images/products/chocolate_hero.webp',
      singleImage: 'assets/images/products/chocolate_single.webp',
      tileImage: 'assets/images/products/chocolate_tile.jpg',
      accent: AppColors.red,
    ),
    Product(
      id: 'butter',
      name: 'Butter Croissant',
      price: 35000,
      category: ProductCategory.savory,
      shortDescription: 'Klasik dan gurih, renyah di luar, lembut di dalam.',
      description:
          'Klasik dan gurih, dengan lapisan pastry mentega yang renyah di luar dan lembut di dalam.',
      ingredients: 'Mentega asli, tepung pilihan, lapisan pastry.',
      heroImage: 'assets/images/products/butter_hero.webp',
      singleImage: 'assets/images/products/butter_single.webp',
      tileImage: 'assets/images/products/butter_tile.jpg',
      accent: AppColors.yellow,
    ),
    Product(
      id: 'almond',
      name: 'Almond Croissant',
      price: 35000,
      category: ProductCategory.savory,
      shortDescription: 'Irisan almond panggang dengan isian krim manis.',
      description:
          'Gurih dan bertekstur, bertabur irisan kacang almond panggang dengan isian krim manis.',
      ingredients: 'Pastry mentega, almond panggang, krim manis.',
      heroImage: 'assets/images/products/almond_hero.webp',
      singleImage: 'assets/images/products/almond_single.webp',
      tileImage: 'assets/images/products/almond_tile.jpg',
      accent: AppColors.brown,
    ),
  ];

  static Product byId(String id) =>
      all.firstWhere((Product p) => p.id == id);
}
