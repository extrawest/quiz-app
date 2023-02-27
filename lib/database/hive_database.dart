import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/data/models/quiz_result_model.dart';
import '../data/models/quiz_history_model.dart';

// ignore: avoid_classes_with_only_static_members
abstract class HiveDatabase {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(QuizHistoryModelAdapter());
    Hive.registerAdapter(QuizResultModelAdapter());

    await Hive.openBox<QuizHistoryModel>(QuizHistoryModel.boxName);
  }
}
