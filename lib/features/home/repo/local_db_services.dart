import 'package:flutter_guess_game/features/home/manager/home_manager.dart';
import 'package:flutter_guess_game/main.dart';
import 'package:hive/hive.dart';

class LocalDBService {
  // bu sınıfı singleton yap!
  LocalDBService._();

  static final LocalDBService instance = LocalDBService._();

  void setTries(List<List<String>> allTries) async {
    var box = await Hive.openBox<List<List<String>>>('Scores');
    await box.clear();
    await box.put('AllScores', allTries);
  }

  void getTries() async {
    var box = await Hive.openBox<List<List<String>>>('Scores');
    container.read(allTimeScoresListProvider.notifier).state =
        box.get('AllScores', defaultValue: []) ?? [];
  }
}
