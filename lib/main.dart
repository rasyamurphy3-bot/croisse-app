import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Aplikasi hanya dipakai dalam mode tegak (portrait).
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  runApp(const CroisseApp());
}
