import 'package:flutter/material.dart';
import 'package:weather_app/api_services/api.dart';
import 'package:weather_app/common_widgets/elementslist/daydetails_imageList.dart';
import 'package:weather_app/common_widgets/homepagewdiget.dart';
import 'package:weather_app/constant/colors_name.dart';
import 'package:weather_app/constant/texttheme.dart';
import 'package:weather_app/weather_model/weather_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
// Default location or user input: default location is set to bhaktpur

class _HomepageState extends State<Homepage> {
  Future<WeatherModel?>? _weatherData;
  String location = "Bhaktapur";
  @override
  void initState() {
    super.initState();
    _fetchWeatherData(location);
  }

// fetching data from api and put it into _weatherdata
  void _fetchWeatherData(String location) {
    setState(() {
      _weatherData = WeatherApi.getData(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: backgroundthemecolor_black,
          child: Column(
            children: [
              FutureBuilder<WeatherModel?>(
                future: _weatherData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: backgroundthemecolor_black,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text('No data available'));
                  } else {
                    final weather = snapshot.data!;
                    return _buildWeatherContent(weather);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherContent(WeatherModel weather) {
    return Container(
      decoration: const BoxDecoration(color: backgroundthemecolor_black),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeader(weather),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            _buildCurrentWeather(weather),
            const Divider(
              color: Color.fromARGB(255, 78, 78, 82),
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            _buildWeatherElements(weather),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            _buildDayTemperature(),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Align(
              alignment: Alignment.centerLeft,
              child: titletext(name: 'Details:', size: 14),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            _buildWeatherDetails(weather),
          ],
        ),
      ),
    );
  }

  // First section of the code: current date and time
  Widget _buildHeader(WeatherModel weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titletext(name: weather.name ?? 'no data', size: 24),
            Row(
              children: [
                textdesc(name: '${weather.time},', size: 12),
                texthighlight(name: ' ${weather.country}', size: 16),
              ],
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width / 3,
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: TextField(
                  style: const TextStyle(color: title_color),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: sub_title_color),
                    labelText: 'Enter Location',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    location = value;
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: sub_title_color,
                  ),
                  onPressed: () {
                    _fetchWeatherData(location);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Display the main current value section for current weather
  Widget _buildCurrentWeather(WeatherModel weather) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: const BoxDecoration(
        color: backgroundthemecolor_black,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: titletext(name: '${weather.tempC}°', size: 65),
                ),
                FittedBox(
                  child: textdesc(name: '${weather.conditionText}', size: 14),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Image.network(
              'https:${weather.conditionIcon}',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Section of other values of weather
  Widget _buildWeatherElements(WeatherModel weather) {
    return Container(
      height: MediaQuery.of(context).size.height / 7.5,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: const BoxDecoration(
        color: boxtile_color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildWeatherElement(
              imagePath: 'assets/weatherImages/cloudy.png',
              value: '${weather.rain}mm',
              label: 'Cloudy',
              context: context),
          buildWeatherElement(
              imagePath: 'assets/weatherImages/wind.png',
              value: '${weather.windKph}kph',
              label: 'Wind',
              context: context),
          buildWeatherElement(
              imagePath: 'assets/weatherImages/humidity.png',
              value: '${weather.humidity}',
              label: 'Humidity',
              context: context),
        ],
      ),
    );
  }

  // Overall day temperature
  Widget _buildDayTemperature() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: titletext(name: 'Today', size: 14),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
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
                          // widget files is fromm common widgets
                          context: context,
                          image: daydetails_imagelist[index],
                          temp: templist[index],
                          time: timelist[index],
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Extra details of weather information
  Widget _buildWeatherDetails(WeatherModel weather) {
    return Container(
      decoration: const BoxDecoration(
        color: boxtile_color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildDetailRow(
              label: 'Feels Like:',
              imagePath: 'assets/images/thermometer.png',
              value: '${weather.feelslike}°c',
              context: context,
            ),
            buildDetailRow(
                label: 'Heat Index:',
                imagePath: 'assets/images/heating.png',
                context: context,
                value: '${weather.heatindex}°c'),
            buildDetailRow(
                label: 'Wind:',
                imagePath: 'assets/images/windr.png',
                context: context,
                value: '${weather.windr}'),
          ],
        ),
      ),
    );
  }
}
