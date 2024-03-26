import 'package:flutter/material.dart';
import 'package:moniepoint_task/util.dart';

class BuyOffersUi extends StatelessWidget {
  const BuyOffersUi({required this.value, super.key,});

  final double value;

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
      child: Column(
        children: [
          const Text(
            "BUY",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            Util.addSpaceTo4DigitNumber(value.toInt()),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
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
