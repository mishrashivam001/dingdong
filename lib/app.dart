import 'package:ding_dong/core/constant/app_theme.dart';
import 'package:ding_dong/ui/screen/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'controller/provider/theme_change_notifier.dart';
import 'package:provider/provider.dart';
import 'core/router/router.dart';
import 'core/utils/sizer.dart';
import 'generated/l10n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DigDongApp extends StatefulWidget {
  const DigDongApp({Key? key}) : super(key: key);

  @override
  State<DigDongApp> createState() => _DigDongAppState();
}

class _DigDongAppState extends State<DigDongApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    //... Init app configs
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      debugPrint('Hello I m here foreground');
    } else if (state == AppLifecycleState.paused) {
      debugPrint('Hello I m here background');
    }
    if (state == AppLifecycleState.detached) {
      debugPrint('Hello I m here in termination');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
          child:
              Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeNotifier.getTheme(),
              darkTheme: AppTheme.darkTheme,
              onGenerateRoute: Routes.generateRoute,
              home: const SplashScreen(),
              navigatorKey: navigatorKey,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            );
          }));
    });

    // @override
    // void dispose() {
    //   //... dispose app level config
    //   WidgetsBinding.instance.removeObserver(this);
    //
    //   super.dispose();
    // }
  }
}
