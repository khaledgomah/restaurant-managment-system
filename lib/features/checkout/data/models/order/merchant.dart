import 'dart:convert';

class Merchant {
  int? id;
  DateTime? createdAt;
  List<dynamic>? phones;
  List<dynamic>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;

  Merchant({
    this.id,
    this.createdAt,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
  });

  factory Merchant.fromMap(Map<String, dynamic> data) => Merchant(
        id: data['id'] as int?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        phones: data['phones'] as List<dynamic>?,
        companyEmails: data['company_emails'] as List<dynamic>?,
        companyName: data['company_name'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        city: data['city'] as String?,
        postalCode: data['postal_code'] as String?,
        street: data['street'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'phones': phones,
        'company_emails': companyEmails,
        'company_name': companyName,
        'state': state,
        'country': country,
        'city': city,
        'postal_code': postalCode,
        'street': street,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Merchant].
  factory Merchant.fromJson(String data) {
    return Merchant.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Merchant] to a JSON string.
  String toJson() => json.encode(toMap());
}
