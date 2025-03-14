import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/components/widgets/app_double_text.dart';
import 'package:ticket_app/components/widgets/hotel_view.dart';
import 'package:ticket_app/components/widgets/ticket_view.dart';
import 'package:ticket_app/resources/media.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';
import 'package:ticket_app/utilities/all_json.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //text + name + logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //text + name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //text
                        const Text(
                          'Good Morning',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //name
                        Text(
                          'Book Tickets',
                          style: AppStyles.headLineStyle1,
                        ),
                      ],
                    ),

                    //logo
                    Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(AppMedia.logo),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //search
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF4F6FD),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Search')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AppDoubleText(
                  bigText: "Upcoming Flights",
                  smallText: 'View all',
                  func: () {
                    Navigator.pushNamed(context, 'all_tickets');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ticketList
                        .map((singleTicket) => GestureDetector(
                              onTap: () {
                                var index = ticketList.indexOf(singleTicket);
                                Navigator.pushNamed(context, 'ticket_page',
                                    arguments: {"index": index});
                              },
                              child: TicketView(
                                ticket: singleTicket,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AppDoubleText(
                  bigText: "Hotel",
                  smallText: 'View all',
                  func: () {
                    Navigator.pushNamed(context, 'all_hotels');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: hotelList
                          .map((singleHotel) => GestureDetector(
                                onTap: () {
                                  var index = hotelList.indexOf(singleHotel);
                                  Navigator.pushNamed(context, 'hotel_detail',
                                      arguments: {"index": index});
                                },
                                child: HotelView(
                                  hotel: singleHotel,
                                ),
                              ))
                          .toList()),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
