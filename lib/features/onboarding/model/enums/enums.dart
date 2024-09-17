enum AppUserType { serviceProvier, customer }

extension AppUserTypeExt on AppUserType {
  String getDisplayName() {
    switch (this) {
      case AppUserType.serviceProvier:
        return "Service Provider";
      default: return "Customer";
    }
  }
}