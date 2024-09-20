import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/models/enums/enums.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String? id;
  @JsonKey(name: 'entity_type', defaultValue: EntityType.client)
  final EntityType? entityType;
  @JsonKey(name: 'last_login')
  final DateTime? lastLogin;
  @JsonKey(name: 'is_superuser')
  final bool? isSuperuser;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? email;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  @JsonKey(name: 'is_staff')
  final bool? isStaff;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  final List<dynamic>? groups;
  @JsonKey(name: 'user_permissions')
  final List<dynamic>? userPermissions;

  User({
    this.id,
    this.entityType,
    this.lastLogin,
    this.isSuperuser,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.isVerified,
    this.isStaff,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.profilePicture,
    this.groups = const [],
    this.userPermissions = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    EntityType? entityType,
    DateTime? lastLogin,
    bool? isSuperuser,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    bool? isVerified,
    bool? isStaff,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? profilePicture,
    List<String>? groups,
    List<String>? userPermissions,
  }) {
    return User(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      lastLogin: lastLogin ?? this.lastLogin,
      isSuperuser: isSuperuser ?? this.isSuperuser,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isVerified: isVerified ?? this.isVerified,
      isStaff: isStaff ?? this.isStaff,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      profilePicture: profilePicture ?? this.profilePicture,
      groups: groups ?? this.groups,
      userPermissions: userPermissions ?? this.userPermissions,
    );
  }
}
