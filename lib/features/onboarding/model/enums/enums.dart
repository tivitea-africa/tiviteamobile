enum AppUserType { serviceProvier, customer, guest }

extension AppUserTypeExt on AppUserType {
  String getDisplayName() {
    switch (this) {
      case AppUserType.serviceProvier:
        return "Sign Up as Service Provider";
      case AppUserType.guest:
        return "Browse Listings";
      default: return "Sign Up as Customer";
    }
  }
}