import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/auth/presentation/auth_gate.dart';
import 'package:chit_chat/firebase_options.dart';
import 'package:chit_chat/vtu/dash_board.dart';
import 'package:chit_chat/vtu/mine/buy_airtime_screen.dart';
import 'package:chit_chat/vtu/mine/home_vtu.dart';
import 'package:chit_chat/vtu/mine/splash_screen_vtu.dart';
import 'package:chit_chat/vtu/s_gpt.dart';
import 'package:chit_chat/vtu/splash_tst.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/home_home.dart';
import 'core/themes/light_mode.dart';
import 'core/themes/theme_provider.dart';
import 'features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/login_or_register.dart';
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      BlocProvider(
        create: (context)=> AuthBloc(AuthService()),
        child:  ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child:  MyApp()
        )
        ),
      );


}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [],
      debugShowCheckedModeBanner: false,
      home:  HomeHome(),//SplashScreeng(),// AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
