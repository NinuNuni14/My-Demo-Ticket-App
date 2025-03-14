import 'package:flutter/material.dart';
import 'package:ticket_app/resources/stryles/text_style_forth.dart';
import 'package:ticket_app/resources/stryles/text_style_third.dart';

class AppColumnTextLayout extends StatelessWidget {
  final String topText;
  final String bottomText;
  final CrossAxisAlignment align;
  final bool? isColor;
  const AppColumnTextLayout(
      {super.key,
      required this.topText,
      required this.bottomText,
      this.align = CrossAxisAlignment.start,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        TextStyleThird(
          text: topText,
          isColor: isColor,
        ),
        const SizedBox(
          height: 5,
        ),
        TextStyleForth(
          text: bottomText,
          isColor: isColor,
        )
      ],
    );
  }
}
