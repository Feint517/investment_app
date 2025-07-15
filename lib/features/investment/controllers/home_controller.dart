import 'package:get/get.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/features/investment/models/watched_company_model.dart';

class HomeController extends GetxController {
  //* variables
  final hideAssetValue = false.obs;

  final differencePercentage = 50;

  final List<WatchedCompanyModel> watchedCompanies = [
    WatchedCompanyModel(
      logo: TestAssets.companyLogo1,
      name: 'Biso Na Biso',
      value: '\$275.84',
      percentageChange: -1.5,
    ),
    WatchedCompanyModel(
      logo: TestAssets.companyLogo2,
      name: 'Congo Foods',
      value: '\$150.00',
      percentageChange: 2.3,
    ),
    WatchedCompanyModel(
      logo: TestAssets.companyLogo3,
      name: 'Green Agriculture',
      value: '\$320.50',
      percentageChange: 0.0,
    ),
  ];
}
