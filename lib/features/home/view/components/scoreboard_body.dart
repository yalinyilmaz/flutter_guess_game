import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';

class ScoreboardBody extends StatelessWidget {
  const ScoreboardBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              _buildTableRow(['Games', 'Scores', 'Tries'], isHeader: true),
              _buildTableRow(['1st', "72", "liste gelecek"]),
              _buildTableRow(['2nd', "66", "liste gelecek"]),
              _buildTableRow(['3rd', "24", "liste gelecek"]),
              _buildTableRow(['4th', "13", "liste gelecek"]),
              _buildTableRow(['5th', "45", "liste gelecek"]),
            ],
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells
          .map((cell) => TableCell(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20),
                  color: Colors.transparent,
                  child: Text(
                    cell,
                    style: globalCtx.textTheme.bodyEmphasized.copyWith(
                        color: isHeader
                            ? globalCtx.yellowColor.shade900
                            : globalCtx.whiteColor.shade500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
