import 'package:flutter/material.dart';
import 'package:quiz_app/database/hive_database.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDatabase.initialize();
  runApp(const App());
}
