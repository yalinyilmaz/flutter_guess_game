import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/core/button_animation/new_animated_fade_button.dart';

typedef OnButtonPressed = void Function(BuildContext);

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final OnButtonPressed? onButtonPressed;
  final Color? customColor;
  final bool enabled;
  final VisualDensity visualDensity;
  final double? height;
  final double? buttonWidth;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;

  final bool isPrimary;
  final ButtonSize buttonSize;

  bool get hasText => text != null;
  bool get hasIcon => icon != null;
  bool get needUseRow => hasIcon && hasText;

  double get buttonHeight => height ?? buttonSize.height;

  bool get isAsyncButton => (onButtonPressed is Future Function(BuildContext));

  // ignore: use_key_in_widget_constructors
  CustomElevatedButton({
    this.text,
    this.icon,
    this.height,
    this.buttonWidth,
    this.onButtonPressed,
    this.buttonSize = ButtonSize.large,
    this.customColor,
    this.isPrimary = true,
    this.enabled = true,
    this.visualDensity = VisualDensity.standard,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.textStyle,
  });

  Future cbAsAsyncFuture(BuildContext context) =>
      (onButtonPressed as Future Function(BuildContext)).call(context);
  var busy = false;

  handleButtonPressed(BuildContext context) async {
    if (busy) return;
    if (onButtonPressed != null && enabled) {
      if (isAsyncButton) {
        try {
          busy = true;
          await cbAsAsyncFuture(context);
        } finally {
          busy = false;
        }
      } else {
        onButtonPressed!(context);
      }
    }
  }

  BoxDecoration getButtonStyle(BuildContext context) {
    if (!enabled) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.greenColor.shade200,
        border: Border.all(color: context.greenColor.shade200),
      );
    }

    if (isPrimary) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: customColor ?? globalCtx.greenColor.shade700,
      );
    }

    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: context.whiteColor.shade50,
      border: Border.all(color: customColor ?? context.darkColor.shade500),
    );
  }

  TextStyle getButtonTextStyle(BuildContext context) {
    if (textStyle != null) {
      return textStyle!;
    }

    if (!enabled) {
      return buttonHeight > 55
          ? context.textTheme.title2Medium
              .copyWith(color: context.whiteColor.shade400)
          : context.textTheme.calloutEmphasized
              .copyWith(color: context.whiteColor.shade400);
    }

    if (isPrimary) {
      return buttonHeight > 55
          ? context.textTheme.title2Medium
              .copyWith(color: context.whiteColor.shade50)
          : context.textTheme.calloutEmphasized
              .copyWith(color: context.whiteColor.shade50);
    }

    return buttonHeight > 55
        ? context.textTheme.title2Medium
            .copyWith(color: customColor ?? context.darkColor.shade900)
        : context.textTheme.calloutEmphasized
            .copyWith(color: customColor ?? context.darkColor.shade900);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: AnimatedFadeButton(
        onTap: () async {
          await handleButtonPressed(context);
        },
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          padding: padding,
          decoration: getButtonStyle(context),
          child: needUseRow
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text!, style: getButtonTextStyle(context)),
                    const SizedBox(width: 10),
                    icon!,
                  ],
                )
              : hasIcon
                  ? icon
                  : hasText
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              text!,
                              style: getButtonTextStyle(context),
                            ),
                          ],
                        )
                      : const SizedBox(),
        ),
      ),
    );
  }
}

enum ButtonSize {
  large,
  medium,
  small;

  double get height {
    switch (this) {
      case ButtonSize.large:
        return 60;
      case ButtonSize.medium:
        return 55;
      case ButtonSize.small:
        return 45;
    }
  }
}
