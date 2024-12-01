import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_bright_minds/core/helper/shared_preferences_helper.dart';
import 'package:new_bright_minds/feature/splash/presentation/views/splash_view_body.dart';
import 'package:new_bright_minds/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedLocale = await SharedPreferencesHelper.getLanguageCode();
  runApp(BrightMinds(initialLocale: savedLocale));
}

class BrightMinds extends StatefulWidget {
  final String initialLocale;

  const BrightMinds({super.key, required this.initialLocale});

  @override
  State<BrightMinds> createState() => _BrightMindsState();
}

class _BrightMindsState extends State<BrightMinds> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = Locale(widget.initialLocale);
  }

  Future<void> _changeLanguage(String languageCode) async {
    await SharedPreferencesHelper.saveLanguageCode(languageCode);
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  ThemeData _buildTheme(Locale locale) {
    final bool isArabic = locale.languageCode == 'ar';

    return ThemeData(
      fontFamily: isArabic ? 'iwanzaza' : 'Roboto',
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: isArabic ? 'iwanzaza' : 'Roboto',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: isArabic ? 'iwanzaza' : 'Roboto',
        ),
        displayLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamily: isArabic ? 'iwanzaza' : 'Roboto',
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: isArabic ? 'iwanzaza' : 'Roboto',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(_locale), // تطبيق الثيم بناءً على اللغة
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      home:
          // UserInfo()
          SplashView(
        onChangeLanguage: _changeLanguage,
      ),
    );
  }
}
