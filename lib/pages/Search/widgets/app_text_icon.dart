import 'package:flutter/material.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';

class AppTextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const AppTextIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppStyles.planeColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: AppStyles.textStyle,
          ),
        ],
      ),
    );
  }
}
