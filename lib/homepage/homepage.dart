import 'package:flutter/material.dart';
import 'package:weather_app/api_services/api.dart';
import 'package:weather_app/common_widgets/day_deatils_list.dart';
import 'package:weather_app/common_widgets/elementslist/daydetails_imageList.dart';
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

  // Fetch weather data for the user-entered location
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
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: title_color),
                        decoration: InputDecoration(
                          labelText: 'Enter Location',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _fetchWeatherData(location);
                      },
                    ),
                  ],
                ),
              ),
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
      decoration: BoxDecoration(color: backgroundthemecolor_black),
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
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune),
              color: title_color,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.grid_view),
              color: title_color,
            ),
          ],
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
          _buildWeatherElement(
              'assets/weatherImages/cloudy.png', '${weather.rain}mm', 'Cloudy'),
          _buildWeatherElement(
              'assets/weatherImages/wind.png', '${weather.windKph}kph', 'Wind'),
          _buildWeatherElement('assets/weatherImages/humidity.png',
              '${weather.humidity}', 'Humidity'),
        ],
      ),
    );
  }

  Widget _buildWeatherElement(String imagePath, String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height / 18,
          width: MediaQuery.of(context).size.width / 13,
        ),
        titletext(name: value, size: 18),
        textdesc(name: label, size: 12),
      ],
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

  // Extra details of weather
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
            _buildDetailRow('Feels Like:', 'assets/images/thermometer.png',
                '${weather.feelslike}°c'),
            _buildDetailRow('Pressure:', 'assets/images/pressure.png',
                '${weather.pressure}'),
            _buildDetailRow('Heat Index:', 'assets/images/heating.png',
                '${weather.heatindex}°c'),
            _buildDetailRow(
                'Wind:', 'assets/images/windr.png', '${weather.windr}'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String imagePath, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        textdesc(name: label, size: 16),
        Image.asset(
          imagePath,
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height / 18,
          width: MediaQuery.of(context).size.width / 13,
        ),
        titletext(name: value, size: 16),
      ],
    );
  }
}
