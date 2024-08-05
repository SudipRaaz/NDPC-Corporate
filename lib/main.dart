import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndpc_web/presentation/Recharge/cubit/recharge_form_cubit.dart';
import 'core/app_export.dart';
import 'routes/route_path.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          BlocProvider(create: (_) => RechargeFormCubit()),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return Consumer<ThemeProvider>(
              builder: (context, provider, child) {
                return MaterialApp(
                  title: 'NDPC -NXpY',
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  navigatorKey: NavigatorService.navigatorKey,
                  // localizationsDelegates: [
                  //   AppLocalizationDelegate(),
                  //   GlobalMaterialLocalizations.delegate,
                  //   GlobalWidgetsLocalizations.delegate,
                  //   GlobalCupertinoLocalizations.delegate
                  // ],
                  supportedLocales: [Locale('en', '')],

                  // initial routing to splash screen
                  initialRoute: RoutesName.homePage_screen,
                  // path to generating routes
                  onGenerateRoute: AppRoutes.generateRoutes,
                );
              },
            );
          },
        ));
  }
}
