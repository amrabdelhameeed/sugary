import 'package:flutter/material.dart';
import 'package:sugar/core/constants/app_colors.dart';

class ItemWidget extends StatelessWidget {
  final Widget child;
  final bool? isSelected;
  final void Function()? onTap;
  const ItemWidget({required this.child, this.isSelected = false, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.purplecolor,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsetsDirectional.all(12),
          margin: const EdgeInsetsDirectional.all(12),
          decoration: BoxDecoration(
            border: isSelected!
                ? Border.all(
                    color: Colors.pink,
                  )
                : null,
            shape: BoxShape.rectangle,
          ),
          child: child,
        ),
      ),
    );
  }
}
