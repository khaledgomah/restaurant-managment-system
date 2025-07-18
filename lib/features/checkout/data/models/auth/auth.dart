import 'dart:convert';

import 'profile.dart';

class Auth {
  Profile? profile;
  String? token;

  Auth({this.profile, this.token});

  factory Auth.fromMap(Map<String, dynamic> data) => Auth(
        profile: data['profile'] == null
            ? null
            : Profile.fromMap(data['profile'] as Map<String, dynamic>),
        token: data['token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'profile': profile?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Auth].
  factory Auth.fromJson(String data) {
    return Auth.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Auth] to a JSON string.
  String toJson() => json.encode(toMap());
}
