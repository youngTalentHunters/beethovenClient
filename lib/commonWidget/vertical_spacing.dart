import 'package:beethoven/config/sizeconfig.dart';
import 'package:flutter/material.dart';

// 새로 빈 공간 (기본은 25)
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    Key key,
    this.of = 25,
  }) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(of),
    );
  }
}
