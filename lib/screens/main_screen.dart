import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rowIcons(),
          ],
        ),
      ),
    );
  }

  Widget rowIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconWidget(
          icon: Icons.sort,
          onTap: () {},
        ),
        iconWidget(
          icon: Icons.person,
          onTap: () {},
        )
      ],
    );
  }

  Widget iconWidget({
    required IconData icon,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade700),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
