import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.onDone});
  final VoidCallback onDone;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() { super.initState(); Timer(const Duration(milliseconds: 1300), widget.onDone); }
  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: AppColors.green, body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
    const Text('croisse', style: AppTextStyles.display), const SizedBox(height: 12),
    Text('F R E S H   C R O I S S A N T S', style: AppTextStyles.label.copyWith(color: AppColors.cream)),
    const SizedBox(height: 28), const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(color: AppColors.yellow, strokeWidth: 2)),
  ])));
}
