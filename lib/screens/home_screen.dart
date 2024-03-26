import 'package:flutter/material.dart';
import 'package:moniepoint_task/widgets/buy_offers_ui.dart';
import 'package:moniepoint_task/widgets/rent_offers_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _appbarAnimation;

  late final Animation<double> _nameOpacityAnimation;

  late final Animation<double> _firstContentAnimation;
  late final Animation<double> _secondContentAnimation;

  late final Animation<double> _buyAndRentAnimation;

  late final Animation<Offset> _slideAnimation;

  late final Animation<double> _kitchenAnimation;

  late final Animation<double> _windowAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _appbarAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.15,
          curve: Curves.easeIn,
        ),
      ),
    );

    _nameOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.15,
          0.18,
          curve: Curves.easeIn,
        ),
      ),
    );

    _firstContentAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.18,
          0.24,
          curve: Curves.easeIn,
        ),
      ),
    );

    _secondContentAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.22,
          0.28,
          curve: Curves.easeIn,
        ),
      ),
    );

    _buyAndRentAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.18,
          0.32,
          curve: Curves.easeIn,
        ),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.32,
          0.40,
          curve: Curves.decelerate,
        ),
      ),
    );

    _kitchenAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.40,
          0.50,
          curve: Curves.easeIn,
        ),
      ),
    );

    _windowAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.55,
          0.65,
          curve: Curves.easeIn,
        ),
      ),
    );

    // Start the animation
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
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Container(
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  height: 56,
                  width: _appbarAnimation.value * 196,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Opacity(
                    opacity: _appbarAnimation.value,
                    child: const Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xffA5957E),
                          size: 18,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Flexible(
                          child: Text(
                            "Saint Petersburg",
                            style: TextStyle(
                              color: Color(0xffA5957E),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Transform.scale(
                    scale: _appbarAnimation.value,
                    alignment: Alignment.center,
                    child: const CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Opacity(
                        opacity: _nameOpacityAnimation.value,
                        child: const Text(
                          'Hi, Marina',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffA5957E),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: _firstContentAnimation.value * 48,
                        color: Colors.transparent,
                        child: const Flexible(
                          child: Text(
                            "let's select your",
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xff232220),
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: _secondContentAnimation.value * 48,
                        color: Colors.transparent,
                        child: const Flexible(
                          child: Text(
                            "perfect place",
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xff232220),
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Transform.scale(
                              scale: _buyAndRentAnimation.value,
                              child: BuyOffersUi(
                                value: _buyAndRentAnimation.value * 1034,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Transform.scale(
                              scale: _buyAndRentAnimation.value,
                              child: RentOffersUi(
                                value: _buyAndRentAnimation.value * 2212,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SlideTransition(
                  position: _slideAnimation,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 10,
                            right: 10,
                          ),
                          height: 208,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                            // color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage('assets/images/kitchen.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            width: (_kitchenAnimation.value *
                                MediaQuery.of(context).size.width) + 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xffA5957E).withAlpha(248),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32),
                              ),
                            ),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xffA5957E),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 384,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(32),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/chair_on_rug.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.bottomLeft,
                                        padding: const EdgeInsets.only(
                                          left: 10, bottom: 10, right: 0,
                                        ),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(32),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/window.jpg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          width: (_windowAnimation.value *
                                              MediaQuery.of(context).size.width) + 56,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffA5957E).withAlpha(248),
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(32),
                                            ),
                                          ),
                                          child: const Align(
                                            alignment: Alignment.centerRight,
                                            child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.chevron_right,
                                                color: Color(0xffA5957E),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(32),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/sitting_room.jpg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
