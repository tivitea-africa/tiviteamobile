enum KYCDocumentType { registrationDocument, businessCertificate }

extension KYCDocumentTypeExt on KYCDocumentType {
  static List<String> get stringValues =>
      KYCDocumentType.values.map((value) => value.name).toList();

  String getDisplayName() {
    switch (this) {
      case KYCDocumentType.registrationDocument:
        return "Registration Document";
      case KYCDocumentType.businessCertificate:
        return "Business Certificate";
    }
  }
}
