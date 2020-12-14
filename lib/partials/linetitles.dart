import 'package:flutter/material.dart';
import '../common/packages.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTextStyles: (value) =>
              const TextStyle(color: Colors.blue, fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '6:30AM';
              case 1:
                return '7:30AM';
              case 2:
                return '8:30AM';
              case 3:
                return '9:30AM';
              case 4:
                return '10:30AM';
              case 5:
                return '11:30AM';
              case 6:
                return '12:30PM';
              case 7:
                return '1:30PM';
              case 8:
                return '2:30PM';
              case 9:
                return '3:30PM';
              case 10:
                return '4:30PM';
              case 11:
                return '5:30PM';
              case 12:
                return '6:30PM';
              case 13:
                return '7:30PM';
              case 14:
                return '8:30PM';
              case 15:
                return '9:30PM';
            }
            return '';
          }));
}
