import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Page_routes/page_routes.dart';
import 'package:weather_app/Providers/Provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: MyappRoutes().router,
        ));
  }
}
