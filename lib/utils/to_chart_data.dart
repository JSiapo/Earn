import 'package:eran_by_saving/model/operation_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

List<PieChartSectionData> showingSections(
    List<Operation> operations, List<Map<String, dynamic>> data, double total) {
  return operations
      .map((e) => PieChartSectionData(
            // color: e.isExpense ? Colors.red : Colors.green,
            color: data.firstWhere((element) => element["id"] == e.id)["color"],
            value: e.mount / total,
            // title: data.firstWhere((element) => element["id"] == e.id)["label"],
            title: "${(e.mount).toStringAsFixed(2)}%",
            showTitle: false,
            radius: 25,
            titlePositionPercentageOffset: 1.5,
            badgeWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 10,
                  width: 10,
                  color: data
                      .firstWhere((element) => element["id"] == e.id)["color"],
                ),
                Text(
                  data.firstWhere((element) => element["id"] == e.id)["label"],
                  // style: TextStyle(
                  //     color: data.firstWhere(
                  //         (element) => element["id"] == e.id)["textColor"]),
                )
              ],
            ),
            badgePositionPercentageOffset: 2.9,
          ))
      .toList();
}
