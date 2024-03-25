import 'package:flutter/material.dart';

class BuyOffersUi extends StatelessWidget {
  const BuyOffersUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
        bottom: 48,
      ),
      width: double.infinity,
      // height: 144,
      decoration: const BoxDecoration(
        color: Color(0xffFC9E12),
        shape: BoxShape.circle,
      ),
      child: const Column(
        children: [
          Text(
            "BUY",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "1034",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "offers",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
