import 'package:flutter/material.dart';

class RentOffersUi extends StatelessWidget {
  const RentOffersUi({super.key});

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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFDF8F2),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: const Column(
        children: [
          Text(
            "RENT",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xffA5957E),
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "2212",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xffA5957E),
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
              color: Color(0xffA5957E),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
