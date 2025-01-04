import 'package:flutter/material.dart';

import '../Utils/Const/assets_string.dart';

class ApnaWashLogo extends StatelessWidget {
  const ApnaWashLogo({
    super.key,
    required this.size,
    this.showName = false,
    this.color,
  });

  final double size;
  final bool showName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: size,
      child: Image.asset(
        AssetsString.kLongLogo,
        height: size * 2.5 / 7,
      ),
    );
  }
}
