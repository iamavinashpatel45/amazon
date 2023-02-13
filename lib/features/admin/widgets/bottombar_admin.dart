import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/admin/screens/admin_screens.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class Bottomnavigatorbar_admin extends StatefulWidget {
  const Bottomnavigatorbar_admin({super.key});

  @override
  State<Bottomnavigatorbar_admin> createState() => _Bottomnavigatorbar_adminState();
}

class _Bottomnavigatorbar_adminState extends State<Bottomnavigatorbar_admin> {
  int _page = 0;
  double width = 42;
  double borederwidth = 5;

  void updatepage(int page) {
    setState(() {
      _page = page;
    });
  }

  final List<Widget> _pages = [
    const admin_screen(),
    const Center(
      child: Text("Analytics Page"),
    ),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: global_variables.selectedNavBarColor,
        unselectedItemColor: global_variables.unselectedNavBarColor,
        iconSize: 28,
        onTap: updatepage,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? global_variables.selectedNavBarColor
                        : global_variables.backgroundColor,
                    width: borederwidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? global_variables.selectedNavBarColor
                        : global_variables.backgroundColor,
                    width: borederwidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? global_variables.selectedNavBarColor
                        : global_variables.backgroundColor,
                    width: borederwidth,
                  ),
                ),
              ),
              child: const Badge(
                badgeContent: Text("2"),
                badgeStyle: BadgeStyle(
                  elevation: 0,
                  badgeColor: Colors.white,
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
