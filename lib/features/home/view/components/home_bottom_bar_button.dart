import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/core/button_animation/new_animated_fade_button.dart';

class HomeBottomBarButton extends StatelessWidget {
  HomeBottomBarButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.isActive});

  String title;
  Widget icon;
  Function onTap;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeButton(
      onTap: () {
        onTap.call();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: isActive ? globalCtx.greenColor.shade900 : null,
            height: 5,
            width: MediaQuery.sizeOf(context).width * .5,
          ),
          icon,
          Text(
            title,
            style: context.textTheme.subheadlineEmphasized.copyWith(
                color: isActive
                    ? globalCtx.greenColor.shade900
                    : globalCtx.whiteColor.shade500),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
