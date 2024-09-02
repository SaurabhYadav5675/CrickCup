import 'package:crick_cup/bloc/recent_match/recent_match_cubit.dart';
import 'package:crick_cup/constants/app_theme.dart';
import 'package:crick_cup/utilities/api_endpoint.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crick_cup/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //Flutter needs to call native code before calling runApp. so we makes sure that we have an instance
  //of the WidgetsBinding, which is required to use platform channels to call the native code.
  WidgetsFlutterBinding.ensureInitialized();
  await ApiUrl().init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecentMatchCubit>(create: (ctx) => RecentMatchCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.dartTheme,
        themeMode: ThemeMode.light,
        home: const SplashScreen(),
      ),
    );
  }
}
