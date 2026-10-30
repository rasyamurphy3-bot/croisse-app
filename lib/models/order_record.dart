class OrderLine {
  const OrderLine({required this.name, required this.quantity, required this.price});
  final String name;
  final int quantity;
  final int price;
  int get total => quantity * price;
  Map<String, dynamic> toJson() => {'name': name, 'quantity': quantity, 'price': price};
  factory OrderLine.fromJson(Map<String, dynamic> json) => OrderLine(
    name: json['name'] as String? ?? '',
    quantity: (json['quantity'] as num?)?.toInt() ?? 0,
    price: (json['price'] as num?)?.toInt() ?? 0,
  );
}

class OrderRecord {
  const OrderRecord({required this.id, required this.createdAt, required this.customerName,
    required this.phone, required this.address, required this.method, required this.note,
    required this.lines, required this.total});
  final String id;
  final DateTime createdAt;
  final String customerName;
  final String phone;
  final String address;
  final String method;
  final String note;
  final List<OrderLine> lines;
  final int total;

  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': createdAt.toIso8601String(), 'customerName': customerName,
    'phone': phone, 'address': address, 'method': method, 'note': note,
    'lines': lines.map((e) => e.toJson()).toList(), 'total': total,
  };
  factory OrderRecord.fromJson(Map<String, dynamic> json) => OrderRecord(
    id: json['id'] as String? ?? '',
    createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
    customerName: json['customerName'] as String? ?? '', phone: json['phone'] as String? ?? '',
    address: json['address'] as String? ?? '', method: json['method'] as String? ?? 'Pickup',
    note: json['note'] as String? ?? '',
    lines: ((json['lines'] as List<dynamic>?) ?? []).map((e) => OrderLine.fromJson(Map<String, dynamic>.from(e as Map))).toList(),
    total: (json['total'] as num?)?.toInt() ?? 0,
  );
}
