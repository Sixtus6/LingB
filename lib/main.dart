import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingb/config/color.dart';
import 'package:lingb/config/size.dart';
import 'package:lingb/config/theme.dart';
import 'package:lingb/screens/join_chat_room/provider.dart';
import 'package:lingb/screens/splash/index.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorConfig.black, // Change the status bar color
    statusBarIconBrightness:
        Brightness.light, // Change the status bar icons' color
    systemNavigationBarColor:
        ColorConfig.black, // Change the navigation bar color
    systemNavigationBarIconBrightness:
        Brightness.light, // Change the navigation bar icons' color
  ));
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<UserScreenProvider>(
        //     create: (_) => UserScreenProvider()),
        // ChangeNotifierProvider<RiderScreenProvider>(
        //     create: (_) => RiderScreenProvider()),
        // ChangeNotifierProvider<UserAuthProvider>(
        //     create: (_) => UserAuthProvider()),
        // ChangeNotifierProvider<UserGoogleMapProvider>(
        //     create: (_) => UserGoogleMapProvider()),
        // ChangeNotifierProvider<RiderAuthProvider>(
        //     create: (_) => RiderAuthProvider()),
        // ChangeNotifierProvider<RiderGoogleMapProvider>(
        //     create: (_) => RiderGoogleMapProvider()),
        ChangeNotifierProvider<JoinRoomProvider>(
            create: (_) => JoinRoomProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.mainTheme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    return const SplashScreen();
  }
}
