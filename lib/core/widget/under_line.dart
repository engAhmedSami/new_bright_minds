import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';

class UnderLine extends StatelessWidget {
  const UnderLine({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.darkPrimaryColor,
            ),
          ),
        ),
        child: child);
  }
}
