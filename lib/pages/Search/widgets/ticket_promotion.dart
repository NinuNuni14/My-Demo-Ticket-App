import 'package:flutter/material.dart';
import 'package:ticket_app/resources/media.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';

class TicketPromotion extends StatelessWidget {
  const TicketPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: size.width * .44,
          height: 425,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 1,
                    spreadRadius: 2),
              ]),
          child: Column(
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: AssetImage(AppMedia.airline),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '20% discount on the early booking of this flight. Dont miss',
                style: AppStyles.headLineStyle2,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  width: size.width * .42,
                  height: 210,
                  decoration: BoxDecoration(
                      color: const Color(0xFF3A8888),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discount\nfor survey',
                        style: AppStyles.headLineStyle2.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Take the survey about our service and get discount',
                        style: AppStyles.headLineStyle4.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                //circle
                Positioned(
                  right: -45,
                  top: -30,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 18, color: AppStyles.circleColor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: size.width * .42,
              height: 210,
              decoration: BoxDecoration(
                  color: const Color(0xFFEC6545),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    'Take Love',
                    style: AppStyles.headLineStyle2.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Take the survey about our service and get discount',
                    style:
                        AppStyles.headLineStyle4.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
