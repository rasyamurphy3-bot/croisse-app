import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/app_config.dart';
import '../models/order_record.dart';
import '../services/shop_store.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/currency.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}
class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _note = TextEditingController();
  String _method = 'Delivery';
  bool _sending = false;
  @override
  void dispose() { _name.dispose(); _phone.dispose(); _address.dispose(); _note.dispose(); super.dispose(); }

  Future<void> _placeOrder() async {
    if (!_formKey.currentState!.validate()) return;
    final store = ShopStore.instance;
    if (store.items.isEmpty) return;
    setState(() => _sending = true);
    final lines = store.items.map((e) => OrderLine(name: e.product.name, quantity: e.quantity, price: e.product.price)).toList();
    final order = OrderRecord(id: DateTime.now().millisecondsSinceEpoch.toString(), createdAt: DateTime.now(), customerName: _name.text.trim(), phone: _phone.text.trim(), address: _method == 'Delivery' ? _address.text.trim() : 'Ambil di toko', method: _method, note: _note.text.trim(), lines: lines, total: store.total);
    final message = StringBuffer('Halo ${AppConfig.storeName}, saya ingin memesan:\n\n');
    for (final line in lines) { message.writeln('${line.name} x${line.quantity} — ${formatRupiah(line.total)}'); }
    message.write('\nTotal: ${formatRupiah(order.total)}\nNama: ${order.customerName}\nWhatsApp: ${order.phone}\nMetode: ${order.method}\nAlamat: ${order.address}\nCatatan: ${order.note.isEmpty ? '-' : order.note}');
    final uri = Uri.parse('https://wa.me/${AppConfig.whatsappNumber}?text=${Uri.encodeComponent(message.toString())}');
    try {
      await store.saveOrder(order);
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!mounted) return;
      Navigator.popUntil(context, (route) => route.isFirst);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            launched
                ? 'Pesanan tersimpan di riwayat. Silakan lanjutkan konfirmasi di WhatsApp.'
                : 'Pesanan tersimpan, tetapi WhatsApp tidak dapat dibuka. Silakan hubungi toko secara manual.',
          ),
        ),
      );
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal membuka WhatsApp: $e')));
    } finally { if (mounted) setState(() => _sending = false); }
  }

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('CHECKOUT')), body: Form(key: _formKey, child: ListView(padding: const EdgeInsets.all(20), children: [
    const Text('Detail pelanggan', style: AppTextStyles.title), const SizedBox(height: 16),
    TextFormField(controller: _name, decoration: const InputDecoration(labelText: 'Nama lengkap'), validator: (v) => v == null || v.trim().isEmpty ? 'Nama wajib diisi' : null),
    const SizedBox(height: 12), TextFormField(controller: _phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Nomor WhatsApp'), validator: (v) => v == null || v.trim().length < 8 ? 'Masukkan nomor WhatsApp yang valid' : null),
    const SizedBox(height: 18), const Text('Metode pesanan', style: AppTextStyles.heading), const SizedBox(height: 8),
    SegmentedButton<String>(segments: const [ButtonSegment(value: 'Delivery', label: Text('Delivery'), icon: Icon(Icons.delivery_dining)), ButtonSegment(value: 'Pickup', label: Text('Pickup'), icon: Icon(Icons.storefront))], selected: {_method}, onSelectionChanged: (v) => setState(() => _method = v.first)),
    if (_method == 'Delivery') ...[const SizedBox(height: 12), TextFormField(controller: _address, maxLines: 2, decoration: const InputDecoration(labelText: 'Alamat pengiriman'), validator: (v) => _method == 'Delivery' && (v == null || v.trim().isEmpty) ? 'Alamat wajib diisi untuk delivery' : null)],
    const SizedBox(height: 12), TextFormField(controller: _note, maxLines: 3, decoration: const InputDecoration(labelText: 'Catatan (opsional)')),
    const SizedBox(height: 24), Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Ringkasan pembayaran', style: AppTextStyles.heading), const SizedBox(height: 10), ...ShopStore.instance.items.map((e) => Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Row(children: [Expanded(child: Text('${e.product.name} × ${e.quantity}')), Text(formatRupiah(e.total))]))), const Divider(), Row(children: [const Expanded(child: Text('Total', style: AppTextStyles.heading)), Text(formatRupiah(ShopStore.instance.total), style: AppTextStyles.price.copyWith(fontSize: 19))])])),
    const SizedBox(height: 20), ElevatedButton.icon(onPressed: _sending ? null : _placeOrder, icon: const Icon(Icons.chat), label: Text(_sending ? 'MEMPROSES...' : 'PESAN VIA WHATSAPP')),
    const SizedBox(height: 12), Text('Pesanan akan dikonfirmasi langsung melalui WhatsApp toko.', textAlign: TextAlign.center, style: AppTextStyles.bodySmall.copyWith(color: AppColors.green)),
  ])));
}
