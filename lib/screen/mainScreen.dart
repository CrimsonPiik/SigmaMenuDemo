import 'package:coffee_app_ui/widgets/footer.dart';
import 'package:coffee_app_ui/widgets/header.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Header(),
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
                      Text(
                        'More Accessories ›',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
          const Footer()
        ],
      ),
    );
  }
}
