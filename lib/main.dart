import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/weather.dart';
// import 'package:counter/counter.dart';
// import 'package:timer/timer.dart';
// import 'package:infinite_list/infinite_list.dart';
// import 'package:login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
  );
  runApp(WeatherApp(weatherRepository: WeatherRepository()));
}
