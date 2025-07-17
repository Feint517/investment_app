class WatchedCompanyModel {
  WatchedCompanyModel({
    required this.id,
    required this.logo,
    required this.name,
    required this.value,
    required this.percentageChange,
  });

  final int id ;
  final String logo;
  final String name;
  final String value;
  final double percentageChange;
}
