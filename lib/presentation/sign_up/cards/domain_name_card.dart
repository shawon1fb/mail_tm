import 'package:flutter/material.dart';

import '../../../values/values.dart';

class DomainNameCard extends StatelessWidget {
  const DomainNameCard({
    Key? key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String name;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightGreenShade1 : Colors.black26,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
          //  style: theme.textTheme.headline1,
        ),
      ),
    );
  }
}
