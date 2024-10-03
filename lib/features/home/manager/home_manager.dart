import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/dialogs/new_message_dialog.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/features/home/repo/local_db_services.dart';
import 'package:flutter_guess_game/features/home/view/components/game_body.dart';
import 'package:flutter_guess_game/features/home/view/components/scoreboard_body.dart';
import 'package:flutter_guess_game/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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

  void checkEnteredNumber() {
    ref.read(triesProvider.notifier).state += 1;
    _saveCurrentGameTries();

    final isCorrect = ref.read(numberControllerProvider).text.toInt() ==
        ref.read(winnerNumberProvider);
    final isLower = ref.read(numberControllerProvider).text.toInt()! <
        ref.read(winnerNumberProvider);

    if (isCorrect) {
      _saveAllPastGamesTries();
      MessageDialog.twoButtons(
        textColor: globalCtx.greenColor.shade600,
        caption: "Correct!",
        content:
            "You guessed correctly the number ${ref.read(winnerNumberProvider)} in ${ref.read(triesProvider)} tries ",
        backButtonText: "Play Again",
        onBackButtonPressed: () {
          ref.invalidate(eachGameTriesProvider);
          globalCtx.pop();
        },
        forwardButtonText: "See Score Table",
        onForwardButtonPressed: () {
          ref.invalidate(eachGameTriesProvider);
          globalCtx.pop();
          selectedHomeFragments.value = HomeFragments.scoreTable;
        },
        purpose: MessageDialogPurpose.success,
      );
      ref.invalidate(winnerNumberProvider);
      ref.invalidate(triesProvider);
    } else {
      MessageDialog.singleButton(
        textColor: globalCtx.blueColor.shade600,
        caption: "Try Again!",
        content:
            "You are very close, try a ${isLower ? "higher " : "lower "}number!",
        buttonText: "Try Again",
        onButtonPressed: () {
          globalCtx.pop();
        },
        purpose: MessageDialogPurpose.warning,
      );
    }
  }

  void _saveAllPastGamesTries() {
    // en iyi 5 oyunun deneme listesini set et
    final pastGamesTries = ref.read(allTimeScoresListProvider);
    ref.read(allTimeScoresListProvider.notifier).state =
        pastGamesTries + [ref.read(eachGameTriesProvider)];

    if (ref.read(allTimeScoresListProvider).length > 5) {
      final allTimeScores = ref.read(allTimeScoresListProvider);

      final sortedAllTimeScores = List<List<String>>.from(allTimeScores)
        ..sort((a, b) => a.length.compareTo(b.length));

      sortedAllTimeScores.removeLast();
      print("eklenecek liste :" + sortedAllTimeScores.toString());
      ref.read(allTimeScoresListProvider.notifier).state = sortedAllTimeScores;
    }

    LocalDBService.instance.setTries(ref.read(allTimeScoresListProvider));
  }

  void _saveCurrentGameTries() {
    // son oyunun deneme listesini set et
    final newGuess = [ref.read(numberControllerProvider).text];
    final currentHistory = ref.read(eachGameTriesProvider);

    ref.read(eachGameTriesProvider.notifier).state = newGuess + currentHistory;
  }
}
