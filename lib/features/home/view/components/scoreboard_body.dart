import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/navigation/router.dart';
import 'package:flutter_guess_game/app/theme/new_theme.dart';
import 'package:flutter_guess_game/features/home/manager/home_manager.dart';
import 'package:flutter_guess_game/main.dart';

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
              _buildTableRow([
                '1st',
                container.read(historyListProvider).length.toString()
              ], withListView: true),
              _buildTableRow(['2nd', "66"], withListView: true),
              _buildTableRow(['3rd', "24"], withListView: true),
              _buildTableRow(['4th', "13"], withListView: true),
              _buildTableRow(['5th', "45"], withListView: true),
            ],
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells,
      {bool isHeader = false, bool withListView = false}) {
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
        if (withListView)
          TableCell(
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: container
                    .read(historyListProvider)
                    .length, // Örnek olarak 5 öğe
                itemBuilder: (context, index) {
                  final prediction = container.read(historyListProvider)[index];
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
