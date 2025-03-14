import 'package:flutter/material.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';

class TicketPositionedCircle extends StatelessWidget {
  final bool? isLeft;
  const TicketPositionedCircle({super.key, this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: isLeft == true ? 22 : null,
        right: isLeft == true ? null : 22,
        top: 250,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: AppStyles.textColor),
          ),
          child: CircleAvatar(
            maxRadius: 4,
            backgroundColor: AppStyles.textColor,
          ),
        ));
  }
}
