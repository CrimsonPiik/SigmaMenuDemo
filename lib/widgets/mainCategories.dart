import 'package:coffee_app_ui/widgets/footer.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainCategories extends StatelessWidget {
  const MainCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 2,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Accessories',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        'More Accessories ›',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.yellow),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'MINI FIT-S PODS',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '12 JD',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.maxFinite,
                height: 2,
                color: Colors.white,
              ),
            ],
          ),
        ),

        ////////// Main Categories //////////
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 2,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Shop For',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        'More Categories ›',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 520,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 450,
                                      height: 450,
                                      color: Colors.yellow),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'VAPES',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          back: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 450,
                                      height: 450,
                                      color: Colors.yellow),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'VAPES',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.maxFinite,
                height: 2,
                color: Colors.white,
              ),
            ],
          ),
        ),
        const Footer()
      ],
    );
  }
}
