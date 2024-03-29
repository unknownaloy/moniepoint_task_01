import 'package:flutter/material.dart';
import 'package:moniepoint_task/enums/nav_enum.dart';
import 'package:moniepoint_task/screens/home_screen.dart';
import 'package:moniepoint_task/screens/map_screen.dart';
import 'package:moniepoint_task/widgets/custom_nav_item.dart';

class MoniepointHome extends StatefulWidget {
  const MoniepointHome({super.key});

  @override
  State<MoniepointHome> createState() => _MoniepointHomeState();
}

class _MoniepointHomeState extends State<MoniepointHome>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<Offset> _slideAnimation;

  NavEnum _selectedItem = NavEnum.home;

  Widget _displayedScreen(NavEnum value) {
    if (value.isHome) {
      return const HomeScreen();
    }

    if (value.isSearch) {
      return const MapScreen();
    }

    return Container(
      color: const Color(0xffA5957E),
    );
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.88,
          1.0,
          curve: Curves.easeInSine,
        ),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _displayedScreen(_selectedItem),
      bottomNavigationBar: SlideTransition(
        position: _slideAnimation,
        child: Container(
          margin: const EdgeInsets.only(
            left: 56,
            bottom: 18,
            right: 56,
          ),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          height: 64,
          decoration: const BoxDecoration(
            color: Color(0xff2B2B2B),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...NavEnum.values.map(
                (item) => SizedBox(
                  width: 52, height: 52,
                  child: CustomNavItem(
                    icon: item.icon,
                    isActive: item == _selectedItem,
                    onTap: () {
                      setState(() => _selectedItem = item);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
