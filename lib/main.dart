import 'package:device_preview/device_preview.dart';
import 'package:f_voz/home/screens/about.dart';
import 'package:f_voz/home/screens/home.dart';
import 'package:f_voz/home/state/forum_list.dart';
import 'package:f_voz/home/state/settings.dart';
import 'package:f_voz/home/state/thread.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const preview = true;

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: ((context) => const VozApp())));
}

class VozApp extends StatelessWidget {
  const VozApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThreadState(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForumListState(),
        ),
        ChangeNotifierProvider(create: (context) => SettingState()),
      ],
      child: Consumer<SettingState>(
        builder: ((context, setting, child) {
          return MaterialApp(
            // Device Preview
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,

            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: setting.isDarkMode ? ThemeMode.dark : ThemeMode.light,

            initialRoute: '/',
            routes: <String, WidgetBuilder>{
              '/': (context) => HomePage(),
              '/about': (context) => const AboutPage(),
            },

            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}
