import 'package:flutter/material.dart';
import 'package:moniepoint_task/widgets/buy_offers_ui.dart';
import 'package:moniepoint_task/widgets/rent_offers_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Container(
        // padding: const EdgeInsets.only(top: 160),
        width: double.infinity,
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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 64,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Hi, Marina',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "let's select your perfect place",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: BuyOffersUi(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: RentOffersUi(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 192,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              ),
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       flex: 1,
                          //       child: Container(
                          //         height: 240,
                          //         decoration: const BoxDecoration(
                          //           borderRadius: BorderRadius.all(
                          //             Radius.circular(32),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     // Expanded(flex: 1,),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
