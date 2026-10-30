import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_config.dart';
import '../models/cart_item.dart';
import '../models/order_record.dart';
import '../models/product.dart';

class ShopStore extends ChangeNotifier {
  ShopStore._();
  static final ShopStore instance = ShopStore._();
  final List<CartItem> _items = [];
  final List<OrderRecord> _orders = [];
  List<CartItem> get items => List.unmodifiable(_items);
  List<OrderRecord> get orders => List.unmodifiable(_orders);
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  int get total => _items.fold(0, (sum, item) => sum + item.total);

  void add(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);
    if (index >= 0) { _items[index].quantity++; } else { _items.add(CartItem(product: product)); }
    notifyListeners();
  }
  void increase(Product product) => add(product);
  void decrease(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);
    if (index < 0) return;
    if (_items[index].quantity > 1) { _items[index].quantity--; } else { _items.removeAt(index); }
    notifyListeners();
  }
  void remove(Product product) { _items.removeWhere((e) => e.product.id == product.id); notifyListeners(); }
  void clearCart() { _items.clear(); notifyListeners(); }

  Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(AppConfig.historyStorageKey);
    if (raw != null) {
      try {
        final list = jsonDecode(raw) as List<dynamic>;
        _orders..clear()..addAll(list.map((e) => OrderRecord.fromJson(Map<String, dynamic>.from(e as Map))));
      } catch (_) { _orders.clear(); }
    }
    notifyListeners();
  }
  Future<void> saveOrder(OrderRecord order) async {
    _orders.insert(0, order);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConfig.historyStorageKey, jsonEncode(_orders.map((e) => e.toJson()).toList()));
    clearCart();
    notifyListeners();
  }
}
