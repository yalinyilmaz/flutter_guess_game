import 'package:flutter/material.dart';

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
            border: TableBorder.all(color: Colors.white),
            children: [
              _buildTableRow(['Games', '1st', '2nd', '3rd', '4th', '5th'],
                  isHeader: true),
              _buildTableRow(['Score', "6", "12", "32", "4", "3"]),
              _buildTableRow(['Tries', "6", "12", "32", "4", "1"]),
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
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.transparent,
                  child: Text(
                    cell,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          isHeader ? FontWeight.bold : FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
