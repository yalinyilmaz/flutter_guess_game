import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/core/formatter/number_input_formatter.dart';
import 'package:flutter_guess_game/features/home/manager/home_manager.dart';
import 'package:flutter_guess_game/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberInputField extends ConsumerStatefulWidget {
  const NumberInputField({super.key});

  @override
  ConsumerState<NumberInputField> createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends ConsumerState<NumberInputField> {
  late final FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();

    focusNode.addListener(() {
      if (!focusNode.hasFocus &&
          container.read(numberControllerProvider).text.isEmpty) {
        container.read(numberControllerProvider.notifier).state.text = "1";
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: globalCtx.darkColor.shade900,
      ),
      child: Center(
        child: TextFormField(
            textAlign: TextAlign.center,
            style: context.textTheme.largeTitleEmphasized
                .copyWith(color: context.whiteColor.shade100, fontSize: 40),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              NumberInputFormatter()
            ],
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            controller: ref.watch(numberControllerProvider)),
      ),
    );
  }
}
