import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app/controller/expanded_text_controller.dart';
import 'package:ticket_app/resources/stryles/app_styles.dart';
import 'package:ticket_app/utilities/all_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int? index;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments != null &&
        arguments is Map &&
        arguments.containsKey("index")) {
      setState(() {
        index = arguments["index"];
      });
      print('This is the index: $index');
    } else {
      print('Error: Invalid or missing arguments');
      setState(() {
        index = 0; // Set a default value or handle error appropriately
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppStyles.bgColor,
            expandedHeight: 300,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.5)),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/img/${hotelList[index!]["image"]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            hotelList[index!]['place'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                shadows: [
                                  Shadow(
                                      blurRadius: 10,
                                      color: Colors.yellow,
                                      offset: Offset(2.0, 2.0))
                                ]),
                          )))
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: ExpandedTextWidget(
                  text: hotelList[index!]['detail'],
                )),
            const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'More Images',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              width: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelList[index!]['images'].length,
                  itemBuilder: (context, imageIndex) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                          fit: BoxFit.cover,
                          "assets/img/${hotelList[index!]['images'][imageIndex]}"),
                    );
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
          ]))
        ],
      ),
    );
  }
}

class ExpandedTextWidget extends StatelessWidget {
  final String text;
  ExpandedTextWidget({super.key, required this.text});

  final ExpandedTextController controller = Get.put(ExpandedTextController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var textWidget = Text(
        style: const TextStyle(fontSize: 20),
        text,
        maxLines: controller.isExpaned.value == true ? null : 9,
        overflow: controller.isExpaned.value == true
            ? TextOverflow.visible
            : TextOverflow.ellipsis,
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget,
          GestureDetector(
            onTap: controller.toggleExpansion,
            child: Text(
              controller.isExpaned.value == false ? 'More' : 'Less',
              style: TextStyle(color: AppStyles.primaryColor, fontSize: 15),
            ),
          )
        ],
      );
    });
  }
}
