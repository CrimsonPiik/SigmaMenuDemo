import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer>
    with SingleTickerProviderStateMixin<Footer> {
  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            color: Colors.white.withOpacity(0.7),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Meow Stores - Meow Meow Food',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AnimatedBuilder(
                      animation: animationController,
                      builder: (BuildContext context, _) {
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController,
                                    curve: const Interval((1 / 10) * 1, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        animationController.forward();
                        return FadeTransition(
                          opacity: animation,
                          child: Transform(
                            transform: Matrix4.translationValues(
                                100 * (1.0 - animation.value), 0.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '28 - Wasfi Al-Tal Street ( Gardenz ), PizzaHut Buildin',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Amman , Jordan',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '065626110 - 065626111',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Working Time:',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    'Saturday To Wednesday : 8:00AM - 8:00PM',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    'Thursday: 8:00AM - 3:00PM',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    'Friday: Closed',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
            ),
          ),
          Container(
            width: double.maxFinite,
            color: Colors.grey.withOpacity(0.4),
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: AnimatedBuilder(
                  animation: animationController,
                  builder: (BuildContext context, _) {
                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController,
                                curve: const Interval((1 / 10) * 1, 1.0,
                                    curve: Curves.fastOutSlowIn)));
                    animationController.forward();
                    return FadeTransition(
                      opacity: animation,
                      child: Transform(
                        transform: Matrix4.translationValues(
                            100 * (1.0 - animation.value), 0.0, 0.0),
                        child: Text(
                          'Copyright © 2022 Citycenter For Computers | Web Development & SEO by DSTeck.com',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

// SizedBox(
//       height: 200,
//       width: double.maxFinite,
//       child: AnimatedBuilder(
//         animation: animationController,
//         builder: (BuildContext context, _) {
//           final Animation<double> animation =
//               Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                   parent: animationController,
//                   curve: const Interval((1 / 10) * 1, 1.0,
//                       curve: Curves.fastOutSlowIn)));
//           animationController.forward();
//           return FadeTransition(
//             opacity: animation,
//             child: Transform(
//               transform: Matrix4.translationValues(
//                   100 * (1.0 - animation.value), 0.0, 0.0),
//               child:
//             ),
//           );
//         },
//       ),
//     );