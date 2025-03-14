import 'package:flutter/material.dart';
import 'package:ticket_app/components/widgets/app_column_text_layout.dart';
import 'package:ticket_app/components/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/components/widgets/big_circle.dart';
import 'package:ticket_app/components/widgets/big_dot.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';
import 'package:ticket_app/resources/stryles/text_style_third.dart';
import 'package:ticket_app/resources/stryles/text_style_forth.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 180,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            //blue part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor == null
                    ? AppStyles.ticketBlue
                    : AppStyles.ticketColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21)),
              ),
              child: Column(
                children: [
                  //top ticket
                  Row(
                    children: [
                      TextStyleThird(
                        text: ticket["from"]["code"],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      BigDot(isColor: isColor),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutbuilderWidget(
                              randomDivider: 6,
                              isColor: isColor,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.57,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: isColor == null
                                    ? Colors.white
                                    : AppStyles.planeSecondColor,
                              ),
                            ),
                          ),
                        ],
                      )),
                      BigDot(isColor: isColor),
                      Expanded(child: Container()),
                      TextStyleThird(
                        text: ticket["to"]["code"],
                        isColor: isColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),

                  //bottom ticket
                  //show departure and destination with icons first line
                  Row(
                    children: [
                      SizedBox(
                          width: 100,
                          child: TextStyleForth(
                            text: ticket["from"]["name"],
                            isColor: isColor,
                          )),
                      Expanded(child: Container()),
                      TextStyleForth(
                        text: ticket["flying_time"],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                          width: 100,
                          child: TextStyleForth(
                            text: ticket["to"]["name"],
                            align: TextAlign.end,
                            isColor: isColor,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            //circle and dots
            Container(
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketOrange
                      : AppStyles.ticketColor),
              child: Row(
                children: [
                  BigCircle(
                    isRight: true,
                    isColor: isColor,
                  ),
                  Expanded(
                      child: AppLayoutbuilderWidget(
                    randomDivider: 16,
                    width: 6,
                    isColor: isColor,
                  )),
                  BigCircle(
                    isRight: false,
                    isColor: isColor,
                  ),
                ],
              ),
            ),
            //orange part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor == null
                    ? AppStyles.ticketOrange
                    : AppStyles.ticketColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                    bottomRight: Radius.circular(isColor == null ? 21 : 0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppColumnTextLayout(
                    topText: ticket["date"],
                    bottomText: 'DATE',
                    isColor: isColor,
                  ),
                  AppColumnTextLayout(
                    topText: ticket["departure_time"],
                    bottomText: 'Departure Time',
                    align: CrossAxisAlignment.center,
                    isColor: isColor,
                  ),
                  AppColumnTextLayout(
                    topText: ticket["number"].toString(),
                    bottomText: 'Number',
                    align: CrossAxisAlignment.end,
                    isColor: isColor,
                  ),
                ],
              ),
              /*
              child: Column(
                children: [
                  //top ticket
                  Row(
                    children: [
                      Text(
                        '1 MAY',
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '08:00 AM',
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '23',
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),

                  //bottom ticket
                  //show departure and destination with icons first line
                  Row(
                    children: [
                      Text(
                        'Date',
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'Departure time',
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'November',
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              */
            ),
          ],
        ),
      ),
    );
  }
}
