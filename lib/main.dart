import 'package:flutter/material.dart';
import 'package:m_one/core/app.dart';
import 'package:m_one/core/preference_service/preference_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.instance.initialize();
  runApp(const App());
}
