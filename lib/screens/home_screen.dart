import 'package:flutter/material.dart';
import 'package:moniepoint_task/widgets/buy_offers_ui.dart';
import 'package:moniepoint_task/widgets/rent_offers_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Container(
          height: 48,
          width: 192,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        actions: const [
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 160, left: 16, right: 16),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffF8F7F6),
              Color(0xffFAD9B2),
            ],
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hi, Marina',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "let's select your perfect place",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                height: 1,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: BuyOffersUi(),),
                SizedBox(width: 10,),
                Expanded(flex: 1, child: RentOffersUi(),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
