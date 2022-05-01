enum Flavor {
  dev,
  staging,
  prod,
}

extension FlavorName on Flavor {
  String get name => toString().split('.').last;
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev App';
      case Flavor.staging:
        return 'staging App';
      case Flavor.prod:
        return 'Prod App';
      default:
        return 'title';
    }
  }
}
