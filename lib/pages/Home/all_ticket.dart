import 'package:flutter/material.dart';
import 'package:ticket_app/components/widgets/ticket_view.dart';
import 'package:ticket_app/utilities/all_json.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Tickets"),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...ticketList.map((singleTicket) => GestureDetector(
                      onTap: () {
                        var index = ticketList.indexOf(singleTicket);

                        Navigator.pushNamed(context, 'ticket_page',
                            arguments: {"index": index});
                      },
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TicketView(
                            ticket: singleTicket,
                            wholeScreen: true,
                          )),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
