import 'package:flutter/material.dart';
import 'package:moniepoint_task/util.dart';

class RentOffersUi extends StatelessWidget {
  const RentOffersUi({
    required this.value,
    super.key,
  });

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
      child: Column(
        children: [
          const Text(
            "RENT",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xffA5957E),
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
              color: Color(0xffA5957E),
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
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
