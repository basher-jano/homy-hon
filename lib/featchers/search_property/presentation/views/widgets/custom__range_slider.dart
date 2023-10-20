import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../constants.dart';
import 'package:intl/intl.dart';

import '../../../data/models/filter_model.dart';

class CustomRangeSlider extends StatefulWidget {
  CustomRangeSlider({super.key, this.end, this.start, this.filterModel});
  FilterModel? filterModel;
  var end;
  var start;
  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return SfRangeSlider(
      values: SfRangeValues(widget.start, widget.end),
      activeColor: kDarkBlue,
      max: 200,
      min: 0,
      enableTooltip: true,
      stepSize: 10,
      interval: 10,
      minorTicksPerInterval: 1,
      tooltipShape: const SfPaddleTooltipShape(),
      tooltipTextFormatterCallback: (actualValue, formattedText) =>
          NumberFormat('#,##0').format((actualValue.toInt() * 10000000)),
      shouldAlwaysShowTooltip: true,
      onChanged: (value) {
        if (widget.filterModel != null) {
          widget.filterModel!.max = (value.end.toInt() * 10000000).toString();
          widget.filterModel!.min = (value.start.toInt() * 10000000).toString();
          widget.filterModel!.createFilter();
          widget.filterModel!.printFilterMap();
        }
        setState(() {
          widget.end = value.end;
          widget.start = value.start;
        });
      },
    );
  }
}
