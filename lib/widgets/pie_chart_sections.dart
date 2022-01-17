import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:signup/models/details.dart';

List<PieChartSectionData> getSections() =>
    PieData.details
        .asMap()
        .map<int, PieChartSectionData>((index,details){
          final value = PieChartSectionData(
            color: details.color,
            value: details.percent.toDouble(),
            title: '${details.percent}',

          );
          return MapEntry(index , value);
    }).values
      .toList();
