import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:wastexchange_mobile/screens/map_screen.dart';
import 'package:wastexchange_mobile/utils/constants.dart';
import 'package:wastexchange_mobile/utils/logger.dart';
import 'package:wastexchange_mobile/routes/router.dart';

Future main() async {
  await DotEnv().load('.env');

  //set logger level
  Logger.level = getLoggerLevel(DotEnv().env['LOGGER_LEVEL']);

  //launch app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
      title: Constants.APP_TITLE,
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontFamily: 'OpenSans', fontWeight: FontWeight.w600),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'OpenSans', fontWeight: FontWeight.w400),
        ),
      )
    );
  }
}
