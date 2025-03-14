import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/components/widgets/app_column_text_layout.dart';
import 'package:ticket_app/components/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/components/widgets/ticket_view.dart';
import 'package:ticket_app/pages/Search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/pages/Ticket/widgets/ticket_positioned_circle.dart';
import 'package:ticket_app/resources/media.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';
import 'package:ticket_app/utilities/all_json.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments != null && arguments is Map) {
      ticketIndex = arguments["index"];
    } else {
      ticketIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        backgroundColor: AppStyles.bgColor,
        title: Text(
          'Tickets',
          style: AppStyles.headLineStyle2,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const AppTicketTabs(firstTab: 'Upcoming', secondTab: 'Previoud'),
              const SizedBox(
                height: 20,
              ),
              //ticket part
              Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TicketView(
                    ticket: ticketList[ticketIndex],
                    isColor: true,
                  )),
              const SizedBox(
                height: 1,
              ),
              //ticket detail
              //passenger detail
              Container(
                color: AppStyles.ticketColor,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    //Passenger
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: 'Flutter DB',
                          bottomText: 'Passenger',
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: '5221 364869',
                          bottomText: 'passport',
                          align: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //E-Ticket
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: '364738 28274478',
                          bottomText: 'Number of E-ticket',
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: 'B2SG28',
                          bottomText: 'Booking code',
                          align: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Payment Method
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(AppMedia.visaCard,
                                    fit: BoxFit.cover, width: 50, height: 35),
                                Text(
                                  ' *** 2462',
                                  style: AppStyles.headLineStyle3,
                                ),
                              ],
                            ),
                            Text(
                              'Payment Method',
                              style: AppStyles.headLineStyle4,
                            )
                          ],
                        ),
                        const AppColumnTextLayout(
                          topText: '\$249.99',
                          bottomText: 'Price',
                          align: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //Barcode
                  ],
                ),
              ),
              const SizedBox(
                height: 1.5,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppStyles.ticketColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(21),
                        bottomRight: Radius.circular(21)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BarcodeWidget(
                        data: 'www.google.com',
                        barcode: Barcode.code128(),
                        height: 70,
                        drawText: false,
                        color: AppStyles.textColor,
                        width: double.infinity,
                      ),
                    ),
                  )),
              //colorful ticket
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                ),
              ),
            ],
          ),
          const TicketPositionedCircle(isLeft: true),
          const TicketPositionedCircle()
        ],
      ),
    );
  }
}
