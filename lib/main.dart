import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:google_fonts/google_fonts.dart';
import 'package:hagglex/core/navigations/navigation_service.dart';
import 'package:hagglex/core/navigations/route_generator.dart';
import 'package:hagglex/core/navigations/route_paths.dart';
import 'package:hagglex/core/share_ui/shared/app_colors.dart';
import 'package:hagglex/injection_container.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HaggleX',
      navigatorKey: sl<NavigationService>().key,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xff2E1963,
          AppColors.colorScratch,
        ),
        textTheme: GoogleFonts.darkerGrotesqueTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: Routes.startUpPage,
      onGenerateRoute: generateRoute,
    );
  }
}
