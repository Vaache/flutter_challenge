import 'package:flutter/material.dart';
import 'package:m_one/core/providers/theme_provider.dart';
import 'package:m_one/core/theme/app_theme.dart';
import 'package:m_one/features/auth/presentation/auth_screen.dart';
import 'package:m_one/features/auth/presentation/stores/auth_store.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        Provider(
          create: (_) => AuthStore(),
          dispose: (context, store) => store.dispose(),
        ),
      ],
      child: Builder(builder: (context) {
        final themeMode = context.select<ThemeProvider, ThemeMode>(
            (themeProvider) => themeProvider.themeMode);

        return MaterialApp(
          title: 'Test App',
          debugShowCheckedModeBanner: false,
          routes: {'/': (_) => AuthScreen()},
          theme:
              themeMode == ThemeMode.light ? AppTheme.light() : AppTheme.dark(),
        );
      }),
    );
  }
}
