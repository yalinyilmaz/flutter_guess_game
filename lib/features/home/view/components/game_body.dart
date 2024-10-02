import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_guess_game/features/home/manager/home_manager.dart';
import 'package:flutter_guess_game/features/home/view/components/number_input_field.dart';
import 'package:flutter_guess_game/main.dart';

class GameBody extends StatelessWidget {
  const GameBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border:
                    Border.all(color: globalCtx.yellowColor.shade900, width: 3),
                color: context.greenColor.shade900),
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedFadeButton(
                      onTap: () {
                        container.read(homeManagerProvider).decreaseNumber();
                      },
                      child: Icon(
                        Icons.arrow_left,
                        color: globalCtx.yellowColor.shade500,
                        size: 100,
                      ),
                    ),
                    const NumberInputField(),
                    AnimatedFadeButton(
                      onTap: () {
                        container.read(homeManagerProvider).increaseNumber();
                      },
                      child: Icon(
                        Icons.arrow_right,
                        color: globalCtx.yellowColor.shade500,
                        size: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          customColor: context.yellowColor.shade500,
                          textStyle: context.textTheme.title2Emphasized
                              .copyWith(color: context.greenColor.shade900),
                          buttonSize: ButtonSize.large,
                          text: "GO",
                          onButtonPressed: (p0) {
                            // MessageDialog.twoButtons(
                            //   textColor: context.blueColor.shade600,
                            //   caption: "Correct!",
                            //   content:
                            //       "You guessed correctly the number 54 in 12 tries ",
                            //   backButtonText: "Play Again",
                            //   forwardButtonText: "See Score Table",
                            //   onBackButtonPressed: () {
                            //     globalCtx.pop();
                            //   },
                            //   purpose: MessageDialogPurpose.warning,
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
