import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/features/home/manager/home_manager.dart';
import 'package:flutter_guess_game/features/home/view/components/home_bottom_bar_button.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedHomeFragments,
        builder: (context, a, b) {
          return Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.1),
            width: double.infinity,
            decoration: BoxDecoration(color: globalCtx.yellowColor.shade800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomBarBtn(
                    title: "GamePlay",
                    fragment: HomeFragments.gamePlay,
                    icon: Icons.play_arrow),
                _buildBottomBarBtn(
                    title: "Score Table",
                    fragment: HomeFragments.scoreTable,
                    icon: Icons.scoreboard_outlined),
              ],
            ),
          );
        });
  }

  HomeBottomBarButton _buildBottomBarBtn(
      {required HomeFragments fragment,
      required String title,
      required IconData icon}) {
    return HomeBottomBarButton(
      isActive: selectedHomeFragments.value == fragment,
      title: title,
      icon: Icon(
        icon,
        color: selectedHomeFragments.value == fragment
            ? globalCtx.greenColor.shade900
            : globalCtx.whiteColor.shade500,
      ),
      onTap: () {
        selectedHomeFragments.value = fragment;
      },
    );
  }
}
