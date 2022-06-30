import 'package:device_preview/device_preview.dart';
import 'package:f_voz/home/screens/about.dart';
import 'package:f_voz/home/screens/home.dart';
import 'package:f_voz/home/state/forum_list.dart';
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
      ],
      child: MaterialApp(
        // Device Preview
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,

        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => HomePage(),
          '/about': (context) => const AboutPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
