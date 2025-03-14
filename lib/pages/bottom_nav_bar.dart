import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/controller/bottom_nav_controller.dart';
import 'package:ticket_app/pages/Home/homepage.dart';
import 'package:ticket_app/pages/Profile/profile_page.dart';
import 'package:ticket_app/pages/Search/search_page.dart';
import 'package:ticket_app/pages/Ticket/ticket_page.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  //dependency injection
  final BottomNavController controller = Get.put(BottomNavController());

  //page texting
  final appScreens = [
    const MyHomePage(),
    const SearchPage(),
    const TicketPage(),
    const ProfilePage(),
  ];

  //change index for BottomNavBar
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: Center(child: appScreens[controller.selectedIndex.value]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onItemTapped,
            backgroundColor: Colors.green,
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_home_add_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_add_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                  label: 'Tickets'),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  label: 'Profile'),
            ],
          ));
    });
  }
}
