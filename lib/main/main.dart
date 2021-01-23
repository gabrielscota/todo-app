import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'factories/factories.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      initialRoute: '/',
      getPages: const [
        GetPage(
          name: '/',
          page: makeSplashPage,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/home',
          page: makeHomePage,
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
