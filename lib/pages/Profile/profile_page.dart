import 'package:flutter/material.dart';
import 'package:ticket_app/components/widgets/app_column_text_layout.dart';
import 'package:ticket_app/resources/media.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Padding(padding: EdgeInsets.only(top: 40)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(AppMedia.logo), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 20,
              ),
              //text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Book Ticket', style: AppStyles.headLineStyle1),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'New-York',
                    style: AppStyles.headLineStyle4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppStyles.kakiColor),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppStyles.ticketColor),
                          child: Icon(
                            Icons.favorite_border,
                            color: AppStyles.kakiColor,
                            size: 22,
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            'Premium Status',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //edit
              Expanded(child: Container()),
              Text(
                'Edit',
                style: AppStyles.headLineStyle3
                    .copyWith(color: AppStyles.primaryColor),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Divider(
              color: Colors.grey.shade400,
            ),
          ),
          //Award notification
          Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppStyles.primaryColor,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.lightbulb,
                        color: AppStyles.primaryColor,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You\'ve got a new award',
                          style: AppStyles.headLineStyle3
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'You have 95 flights in a year',
                          style: AppStyles.headLineStyle4.copyWith(
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: -40,
                right: -40,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 15,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      shape: BoxShape.circle),
                ),
              ),
            ],
          ),
          //Accymulated miles
          const SizedBox(
            height: 30,
          ),
          Text(
            'Accumulated miles',
            style: AppStyles.headLineStyle1,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppStyles.bgColor),
            child: Column(
              children: [
                Text(
                  '192802',
                  style: TextStyle(
                      fontSize: 45,
                      color: AppStyles.textColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Miles accured',
                      style: AppStyles.headLineStyle4.copyWith(fontSize: 17),
                    ),
                    Text('11 June 2022',
                        style: AppStyles.headLineStyle4.copyWith(fontSize: 17))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    color: Colors.grey.shade400,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: '23 042',
                      bottomText: 'Miles',
                      isColor: true,
                    ),
                    AppColumnTextLayout(
                      topText: 'Airline CO',
                      bottomText: 'Received from',
                      isColor: true,
                      align: CrossAxisAlignment.end,
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: '24',
                      bottomText: 'Miles',
                      isColor: true,
                    ),
                    AppColumnTextLayout(
                      topText: 'McDoanal\'s',
                      bottomText: 'Received from',
                      isColor: true,
                      align: CrossAxisAlignment.end,
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: '52 340',
                      bottomText: 'Miles',
                      isColor: true,
                    ),
                    AppColumnTextLayout(
                      topText: 'DBestech',
                      bottomText: 'Received from',
                      isColor: true,
                      align: CrossAxisAlignment.end,
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Center(
              child: Text('How to get more miles',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppStyles.primaryColor,
                      fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}
