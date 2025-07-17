import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/styles/loaders.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/investment/controllers/home_controller.dart';
import 'package:investment_app/features/investment/widgets/watched_company_tile.dart';

class EditWatchlist extends GetView<HomeController> {
  const EditWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(title: 'Watchlist', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Column(
          children: [
            const Gap(AppSizes.xl),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.watchedCompanies.length,
              itemBuilder: (context, index) {
                final company = controller.watchedCompanies[index];
                return Dismissible(
                  key: Key(company.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    controller.watchedCompanies.removeAt(index);
                    CustomLoaders.showSnackBar(
                      type: SnackBarType.success,
                      title: '${company.name} removed from watchlist',
                    );
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: WatchedCompanyTile(company: company),
                );
              },
              separatorBuilder: (context, index) => const Gap(AppSizes.md),
            ),
          ],
        ),
      ),
    );
  }
}
