import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_guess_game/features/home/view/components/game_body.dart';
import 'package:flutter_guess_game/features/home/view/components/scoreboard_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supercharged/supercharged.dart';

enum HomeFragments {
  gamePlay,
  scoreTable,
}

final Map<HomeFragments, Widget> selectedHomeFragMap = {
  HomeFragments.gamePlay: const GameBody(),
  HomeFragments.scoreTable: const ScoreboardBody(),
};

final selectedHomeFragments =
    ValueNotifier<HomeFragments>(HomeFragments.gamePlay);

final numberControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController(text: "50");
});

final winnerNumberProvider = StateProvider<int>((ref) {
  return Random().nextInt(100) + 1;
});

final triesProvider = StateProvider<int>((ref) {
  return 0;
});

final eachGameTriesProvider = StateProvider<List<String>>((ref) {
  return [];
});

final allTimeScoresListProvider = StateProvider<List<dynamic>>((ref) {
  return [];
});

final homeManagerProvider = Provider<HomeManager>((ref) {
  return HomeManager(ref);
});

class HomeManager {
  HomeManager(this.ref);
  final Ref ref;

  void increaseNumber() {
    if ((ref.read(numberControllerProvider).text).toInt() != 100) {
      ref.read(numberControllerProvider.notifier).state.text =
          ((ref.read(numberControllerProvider.notifier).state.text).toInt()! +
                  1)
              .toString();
    }
  }

  void decreaseNumber() {
    if ((ref.read(numberControllerProvider).text).toInt() != 1) {
      ref.read(numberControllerProvider.notifier).state.text =
          ((ref.read(numberControllerProvider.notifier).state.text).toInt()! -
                  1)
              .toString();
    }
  }
}
