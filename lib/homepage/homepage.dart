import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/common_widgets/day_deatils_list.dart';
import 'package:weather_app/common_widgets/elementslist/daydetails_imageList.dart';
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
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: const BoxDecoration(
                      color: backgroundthemecolor_black,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
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
                      Lottie.asset(
                        'assets/images/thunderstorm.json',
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: const Color.fromARGB(255, 78, 78, 82),
                  thickness: 1,
                  endIndent: 20,
                  indent: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 7.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: const BoxDecoration(
                      color: boxtile_color,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/weatherImages/cloudy.png',
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 13,
                          ),
                          titletext(name: '10 m/s', size: 18),
                          subtext(name: ' wind', size: 12),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/weatherImages/wind.png',
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 13,
                          ),
                          titletext(name: '10 m/s', size: 18),
                          subtext(name: ' Humidity', size: 12),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/weatherImages/humidity.png',
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 13,
                          ),
                          titletext(name: '10 m/s', size: 18),
                          subtext(name: ' Rain', size: 1),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: titletext(name: 'Today', size: 14),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                daydetails(
                                  context: context,
                                  image: daydetails_imagelist[index],
                                  temp: '20°',
                                  time: '11 pm',
                                ),
                              ],
                            ),
                            // Container(
                            //   height: MediaQuery.of(context).size.height / 8,
                            //   width: MediaQuery.of(context).size.width / 4,
                            //   decoration: const BoxDecoration(
                            //     color: boxtile_color,
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(20)),
                            //   ),
                            //   padding: const EdgeInsets.all(7),
                            //   child: Column(children: [
                            //     // daydetails(time: '11pm', temp: '20°')
                            //   ]),
                            // ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: titletext(name: 'This week', size: 14),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: boxtile_color,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
