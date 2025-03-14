import 'package:flutter/material.dart';
import 'package:ticket_app/pages/Home/all_hotels.dart';
import 'package:ticket_app/pages/Home/all_ticket.dart';
import 'package:ticket_app/pages/Home/hoel_detail.dart';
import 'package:ticket_app/pages/Ticket/ticket_page.dart';
import 'package:ticket_app/pages/bottom_nav_bar.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppStyles.bgColor),
      home: BottomNavBar(),
      routes: {
        'all_tickets': (context) => const AllTickets(),
        'all_hotels': (context) => const AllHotels(),
        'ticket_page': (context) => const TicketPage(),
        'hotel_detail': (context) => const HotelDetail(),
      },
    );
  }
}
