import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/tab_provider.dart';
import 'providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/main_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'utils/app_colors.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final authService = Provider.of<AuthService>(context, listen: false);
        
        return MaterialApp(
          title: 'Food Hub',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
              surface: AppColors.surface,
              brightness: Brightness.light,
            ),
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.backgroundDark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
              surface: AppColors.surfaceDark,
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.interTextTheme(
              ThemeData(brightness: Brightness.dark).textTheme,
            ),
          ),
          home: FutureBuilder<bool>(
            future: _initialDataLoad(authService),
            builder: (context, onboardingSnapshot) {
              if (onboardingSnapshot.hasError) {
                return Scaffold(
                  body: Center(child: Text('Error: ${onboardingSnapshot.error}')),
                );
              }
              if (onboardingSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              final bool onboardingCompleted = onboardingSnapshot.data ?? false;

              if (!onboardingCompleted) {
                return const OnboardingScreen();
              }

              return StreamBuilder<LocalUser?>(
                stream: authService.authStateChanges,
                initialData: authService.currentUser,
                builder: (context, authSnapshot) {
                  if (authSnapshot.hasError) {
                    return Scaffold(
                      body: Center(child: Text('Auth Error: ${authSnapshot.error}')),
                    );
                  }
                  
                  if (authSnapshot.hasData && authSnapshot.data != null) {
                    return const MainScreen();
                  }
                  return const LoginScreen();
                },
              );
            },
          ),
        );
      },
    );
  }

  Future<bool> _initialDataLoad(AuthService authService) async {
    // Wait for auth service to load user from local storage
    await authService.initialized;
    // Check onboarding status
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }
}

