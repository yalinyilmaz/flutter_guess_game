import 'package:flutter/material.dart';
import 'package:flutter_guess_game/features/home/view/components/game_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum HomeFragments {
  gamePlay,
  scoreTable,

}

final Map<HomeFragments, Widget> selectedHomeFragMap = {
  HomeFragments.gamePlay: const GameBody(),
  HomeFragments.scoreTable: const SizedBox(),

};

final selectedHomeFragments =
    ValueNotifier<HomeFragments>(HomeFragments.gamePlay);

final homeManagerProvider = Provider<HomeManager>((ref) {
  return HomeManager(ref);
});

class HomeManager {
  HomeManager(this.ref);
  final Ref ref;

}