import 'package:flutter/material.dart';
import 'package:ticket_app/components/widgets/app_double_text.dart';
import 'package:ticket_app/pages/Search/widgets/ticket_promotion.dart';
import 'package:ticket_app/pages/Search/widgets/app_text_icon.dart';
import 'package:ticket_app/pages/Search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/pages/Search/widgets/find_tickets.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What are\nyou looking for?',
                style: AppStyles.headLineStyle1.copyWith(fontSize: 35),
              ),
              const SizedBox(
                height: 20,
              ),
              const AppTicketTabs(
                firstTab: 'Airline Tickets',
                secondTab: 'Hotels',
              ),
              const SizedBox(
                height: 20,
              ),
              const AppTextIcon(
                icon: Icons.flight_takeoff_rounded,
                text: 'Departure',
              ),
              const SizedBox(
                height: 15,
              ),
              const AppTextIcon(
                icon: Icons.flight_land_rounded,
                text: 'Arrival',
              ),
              const SizedBox(
                height: 20,
              ),
              const FindTickets(),
              const SizedBox(
                height: 40,
              ),
              AppDoubleText(
                bigText: 'Upcoming Flights',
                smallText: 'View all',
                func: () {
                  Navigator.pushNamed(context, 'all_tickets');
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const TicketPromotion(),
            ],
          ),
        )
      ],
    ));
  }
}
