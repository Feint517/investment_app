import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:investment_app/core/bindings/general_bindings.dart';
import 'package:investment_app/core/themes/theme.dart';
import 'package:investment_app/features/authentication/views/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          title: 'Le Petit Davinci',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: CustomAppTheme.lightTheme,
          darkTheme: CustomAppTheme.darkTheme,
          initialBinding: GeneralBindings(),
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
