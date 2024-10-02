import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/features/home/manager/home_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryLine extends StatelessWidget {
  const HistoryLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "History",
            style: context.textTheme.bodyEmphasized
                .copyWith(color: globalCtx.whiteColor.shade100),
          ),
        ),
        _buildDivider(),
        Consumer(builder: (context, ref, _) {
          final predictions = ref.watch(historyListProvider);
          return SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  final prediction = predictions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: context.whiteColor.shade100, width: 2),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "$prediction",
                            style: context.textTheme.bodyEmphasized
                                .copyWith(color: globalCtx.whiteColor.shade100),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }),
        _buildDivider(),
      ],
    );
  }

  Divider _buildDivider() {
    return Divider(
        endIndent: 20,
        indent: 20,
        thickness: 4,
        color: globalCtx.whiteColor.shade100);
  }
}
