import 'package:flutter/material.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';

class HotelView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 350,
      width: size.width * 0.6,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                width: 190,
                height: 170,
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.white54, width: 3),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage("assets/img/${hotel['image']}"),
                        fit: BoxFit.cover))),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(hotel['place'],
              style: AppStyles.headLineStyle1
                  .copyWith(color: AppStyles.kakiColor)),
          Text(hotel['destination'],
              style: AppStyles.headLineStyle3.copyWith(color: Colors.white)),
          Text('\$${hotel['price'].toString()}/night',
              style: AppStyles.headLineStyle1
                  .copyWith(color: AppStyles.kakiColor)),
        ],
      ),
    );
  }
}
