import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_shop/screens/main_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> screens = [
    MainScreen(),
    // Text(
    //   'Home Page',
    //   style: TextStyle(
    //       fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
    // ),
    Text(
      'Details',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Cart',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        willPopUp(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   title: Text('B - Shop'),
        //   centerTitle: true,
        // ),
        bottomNavigationBar: Container(
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.grey.shade800,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey.shade400,
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                  print(selectedIndex);
                },
                items: [
                  BottomNavigationBarItem(
                      // backgroundColor: Colors.white,
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                      activeIcon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.details_outlined),
                      label: 'Details',
                      activeIcon: Icon(Icons.details)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.abc_outlined),
                      label: 'Cart',
                      activeIcon: Icon(Icons.abc)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined),
                      label: 'Profile',
                      activeIcon: Icon(Icons.person_2)),
                ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [screens[selectedIndex]],
          ),
        ),
      ),
    );
  }

  Future<dynamic> willPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Do you want to exit ?'),
            titleTextStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            icon: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.clear,
                color: Colors.grey,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text('Yes')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No'))
              ],
            ),
          );
        });
  }
}
