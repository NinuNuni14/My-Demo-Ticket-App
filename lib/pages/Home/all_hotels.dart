import 'package:flutter/material.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';
import 'package:ticket_app/utilities/all_json.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text('All Hotels'),
        centerTitle: true,
        backgroundColor: AppStyles.bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.78),
            itemCount: hotelList.length,
            itemBuilder: (context, index) {
              var singleHotel = hotelList[index];
              return HotelGridView(hotel: singleHotel, index: index);
            }),
      ),
    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;
  const HotelGridView({super.key, required this.hotel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('My index is $index');
        Navigator.pushNamed(context, 'hotel_detail',
            arguments: {"index": index});
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Container(
          height: 350,
          // width: size.width * 0.6,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.1,
                child: Container(
                    /*
                    width: 190,
                    height: 170,
                  */
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.white54, width: 3),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage("assets/img/${hotel['image']}"),
                            fit: BoxFit.cover))),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(hotel['place'],
                  style: AppStyles.headLineStyle3
                      .copyWith(color: AppStyles.kakiColor)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(hotel['destination'],
                      style: AppStyles.headLineStyle3
                          .copyWith(color: Colors.white)),
                  Text('\$${hotel['price'].toString()}/night',
                      style: AppStyles.headLineStyle4
                          .copyWith(color: AppStyles.kakiColor)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
