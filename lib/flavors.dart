enum Flavor {
  DEV,
  STAGING,
  PROD,
}

extension FlavorName on Flavor {
  String get name => this.toString().split('.').last;
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Dev App';
      case Flavor.STAGING:
        return 'Staging App';
      case Flavor.PROD:
        return 'Prod App';
      default:
        return 'title';
    }
  }

}
