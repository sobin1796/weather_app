import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constant/colors_name.dart';
import 'package:weather_app/constant/texttheme.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: backgroundthemecolor_black),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titletext(name: 'Bhaktapur', size: 24),
                      subtext(name: '11 september,wednesday'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.tune),
                        color: icon_color,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.grid_view),
                        color: icon_color,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titletext(name: '25°', size: 70),
                      subtext(
                        name: 'Thunderastrom',
                        size: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Lottie.asset('assets/images/rain.json'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
