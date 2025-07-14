import 'package:get/get.dart';
import 'package:investment_app/features/investment/views/home.dart';
import 'package:investment_app/features/notifications/views/notification.dart';
import 'package:investment_app/features/statisics/views/statistics.dart';

class BottomNavController extends GetxController {
  final pages = [
    const HomeScreen(),
    const StatisticsScreen(),
    const NotificationScreen(),
  ];

  //* Reactive index for the selected tab
  var currentIndex = 0.obs;

  //* Method to update the selected tab
  void changeTab(int index) {
    currentIndex.value = index;
  }
}
