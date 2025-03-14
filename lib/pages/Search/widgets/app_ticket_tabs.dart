import 'package:flutter/material.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs(
      {super.key, required this.firstTab, required this.secondTab});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFF4F6FD),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            AppTabs(
              tabText: firstTab,
            ),
            AppTabs(
              tabText: secondTab,
              tabBorder: true,
              tabColor: true,
            ),
          ],
        ),
      ),
    );
  }
}

class AppTabs extends StatelessWidget {
  final String tabText;
  final bool tabBorder;
  final bool tabColor;
  const AppTabs(
      {super.key,
      this.tabText = '',
      this.tabBorder = false,
      this.tabColor = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: tabBorder == false
              ? const BorderRadius.horizontal(left: Radius.circular(50))
              : const BorderRadius.horizontal(right: Radius.circular(50)),
          color: tabColor == false ? Colors.white : Colors.transparent),
      width: size.width * .44,
      child: Center(
        child: Text(
          tabText,
          style: AppStyles.headLineStyle4.copyWith(color: Colors.black87),
        ),
      ),
    );
  }
}
