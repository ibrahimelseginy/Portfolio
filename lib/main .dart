// ignore: file_names
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/index.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e, stackTrace) {
    print('Firebase Init Error: $e');
    print('StackTrace: $stackTrace');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: 'Ibrahim Elseginy - Mobile Developer | Flutter Developer',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [AnalyticsService.getAnalyticsObserver()],
        theme: ThemeData(
          primaryColor: const Color(0xff5dc8f8),
          secondaryHeaderColor: const Color(0xff065a9d),
          scaffoldBackgroundColor: const Color(0xff0c0c0c),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: WidgetStateProperty.all<Color>(const Color(0x5455889f)),
          ),
          fontFamily: "Gilroy",
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        home: const Index(),
      ),
    );
  }
}
