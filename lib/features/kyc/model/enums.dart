enum KYCDocumentType { registrationDocument, businessCertificate }

extension KYCDocumentTypeExt on KYCDocumentType {
  static List<String> get stringValues =>
      KYCDocumentType.values.map((value) => value.getDisplayName()).toList();

  String getDisplayName() {
    switch (this) {
      case KYCDocumentType.registrationDocument:
        return "Registration Document";
      case KYCDocumentType.businessCertificate:
        return "Business Certificate";
    }
  }
}

enum ClientKYCDocumentType { nin, driversLicense, internationalPassport }

extension ClientKYCDocumentTypeExt on ClientKYCDocumentType {
  static List<String> get stringValues => ClientKYCDocumentType.values
      .map((value) => value.getDisplayName())
      .toList();

  String getDisplayName() {
    switch (this) {
      case ClientKYCDocumentType.nin:
        return "NIN";
      case ClientKYCDocumentType.driversLicense:
        return "Driver's License";
      case ClientKYCDocumentType.internationalPassport:
        return "International Passport";
    }
  }
}

enum ChooseFileType { takePhoto, selectFromGallery, selectFromFiles }
