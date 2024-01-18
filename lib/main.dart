import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sik_baitulhikmah/theme.dart';

import 'router.dart';

Future<void> main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(App()));
}

class App extends StatelessWidget {
  const App({super.key});

  static const title = 'SIK TK Baitul Hikmah';

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.light,
      dark: AppTheme.dark,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 960, name: TABLET),
          const Breakpoint(start: 961, end: double.infinity, name: DESKTOP),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: title,
          routerConfig: router,
          theme: theme,
          darkTheme: darkTheme,
        ),
      ),
    );
  }
}
