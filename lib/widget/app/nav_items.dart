import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String label;
  final Color color;
  final Widget page;

  const NavItem({Key? key, required this.label, required this.color, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 72,
          height: 24,
          decoration: BoxDecoration(
            color: color == AppColors.primary? AppColors.primary: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: color == AppColors.primary ? AppColors.white : AppColors.primary,
              fontWeight: FontWeight.w500,fontSize: 14
            ),
          ),
        ),
      ),
    );
  }
}
