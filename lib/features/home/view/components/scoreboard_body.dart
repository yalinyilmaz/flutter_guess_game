import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/features/home/manager/home_manager.dart';
import 'package:flutter_guess_game/main.dart';

class ScoreboardBody extends StatelessWidget {
  const ScoreboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final tries = container.read(historyListProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border:
                TableBorder.all(color: globalCtx.whiteColor.shade100, width: 2),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(3),
            },
            children: [
              _buildTableRow(
                cells: ['Games', 'Scores', 'Tries'],
                isHeader: true,
              ),
              _buildTableRow(
                  cells: ['1st', tries.length.toString()], tries: tries),
              _buildTableRow(
                cells: ['2nd', "66"],tries: tries
              ),
              _buildTableRow(
                cells: ['3rd', "24"],tries: tries
              ),
              _buildTableRow(
                cells: ['4th', "13"],tries: tries
              ),
              _buildTableRow(
                cells: ['5th', "45"],tries: tries
              ),
            ],
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow({
    required List<String> cells,
    List<int>? tries,
    bool isHeader = false,
  }) {
    return TableRow(
      children: [
        ...cells.map((cell) => TableCell(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20),
                color: Colors.transparent,
                child: Text(
                  cell,
                  style: globalCtx.textTheme.bodyEmphasized.copyWith(
                      color: isHeader
                          ? globalCtx.whiteColor.shade100
                          : globalCtx.whiteColor.shade500),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
        if (tries != null)
          TableCell(
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tries.length, // Örnek
                itemBuilder: (context, index) {
                  final prediction = tries[index];
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
                  ;
                },
              ),
            ),
          ),
      ],
    );
  }
}
