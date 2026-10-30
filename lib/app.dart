import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'screens/main_shell.dart';
import 'theme/app_theme.dart';

class CroisseApp extends StatelessWidget {
  const CroisseApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: AppConfig.storeName,
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light(),
    home: const MainShell(),
  );
}
