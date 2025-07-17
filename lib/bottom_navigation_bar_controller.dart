import 'package:get/get.dart';
import 'package:investment_app/features/investment/views/home.dart';
import 'package:investment_app/features/personalization/views/profile.dart';
import 'package:investment_app/features/statisics/views/statistics.dart';

class BottomNavController extends GetxController {
  final pages = [
    const HomeScreen(),
    const StatisticsScreen(),
    const ProfileScreen(),
  ];

  //* Reactive index for the selected tab
  var currentIndex = 0.obs;

  //* Method to update the selected tab
  void changeTab(int index) {
    currentIndex.value = index;
  }
}
