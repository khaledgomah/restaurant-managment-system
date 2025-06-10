import 'dart:convert';

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  DateTime? dateJoined;
  String? email;
  bool? isActive;
  bool? isStaff;
  bool? isSuperuser;
  dynamic lastLogin;
  List<dynamic>? userPermissions;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.dateJoined,
    this.email,
    this.isActive,
    this.isStaff,
    this.isSuperuser,
    this.lastLogin,
    this.userPermissions,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        username: data['username'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        dateJoined: data['date_joined'] == null
            ? null
            : DateTime.parse(data['date_joined'] as String),
        email: data['email'] as String?,
        isActive: data['is_active'] as bool?,
        isStaff: data['is_staff'] as bool?,
        isSuperuser: data['is_superuser'] as bool?,
        lastLogin: data['last_login'] as dynamic,
        userPermissions: data['user_permissions'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'date_joined': dateJoined?.toIso8601String(),
        'email': email,
        'is_active': isActive,
        'is_staff': isStaff,
        'is_superuser': isSuperuser,
        'last_login': lastLogin,
        'user_permissions': userPermissions,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}
