import 'package:eran_by_saving/model/operation_model.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/utils/to_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PieChartWidget extends StatelessWidget {
  final List<Operation> operations;
  final List<Map<String, dynamic>> dataChart;
  const PieChartWidget(
      {Key? key, required this.operations, required this.dataChart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(PieChartData(
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 1.5,
            centerSpaceRadius: 50,
            sections: showingSections(
                operations,
                dataChart,
                operations
                    .map((e) => e.mount)
                    .reduce((value, element) => value + element)))),
        Center(
          child: Text(
            "\$ ${(operations.map((e) => e.mount).reduce((value, element) => value + element).toStringAsFixed(2))}",
            style: const TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.3,
          ),
        )
      ],
    );
  }
}
