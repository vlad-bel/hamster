import 'package:json_annotation/json_annotation.dart';

part 'branch_profile.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class BranchProfile {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'branchName')
  final String? branchName;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'postalCode')
  final String? postalCode;
  @JsonKey(name: 'streetName')
  final String? streetName;
  @JsonKey(name: 'streetNumber')
  final String? streetNumber;
  @JsonKey(name: 'entrances')
  final int? entrances;
  @JsonKey(name: 'website')
  final String? website;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'companyId')
  final String? companyId;
  @JsonKey(name: 'branchNumber')
  final String? branchNumber;
  @JsonKey(name: 'fillingProgress')
  final int? fillingProgress;
  @JsonKey(name: 'posesData')
  final List<PosData>? posesData;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'subcategories')
  final List<String>? subcategories;
  @JsonKey(name: 'openingHours')
  final OpeningHours? openingHours;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: 'isVerificationRequestDeclined')
  final bool? isVerificationRequestDeclined;
  @JsonKey(name: 'isVerified')
  final bool? isVerified;

  BranchProfile({
    this.id,
    this.branchName,
    this.city,
    this.country,
    this.postalCode,
    this.streetName,
    this.streetNumber,
    this.entrances,
    this.website,
    this.phoneNumber,
    this.companyId,
    this.branchNumber,
    this.fillingProgress,
    this.posesData,
    this.category,
    this.subcategories,
    this.openingHours,
    this.createdAt,
    this.updatedAt,
    this.isVerificationRequestDeclined,
    this.isVerified,
  });

  factory BranchProfile.fromJson(Map<String, dynamic> json) =>
      _$BranchProfileFromJson(json);

  Map<String, dynamic> toJson() => _$BranchProfileToJson(this);

  String getFullAddress() => '${streetName ?? ''} ${streetNumber ?? ''}';
}

@JsonSerializable(ignoreUnannotated: false)
class PosData {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'manufacturer')
  final String manufacturer;
  @JsonKey(name: 'model')
  final String model;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'isActive')
  final bool isActive;

  PosData({
    required this.name,
    required this.manufacturer,
    required this.model,
    required this.id,
    required this.isActive,
  });

  factory PosData.fromJson(Map<String, dynamic> json) =>
      _$PosDataFromJson(json);

  Map<String, dynamic> toJson() => _$PosDataToJson(this);
}

class OpeningHours {
  List<OpeningHourItem>? monday;
  List<OpeningHourItem>? tuesday;
  List<OpeningHourItem>? wednesday;
  List<OpeningHourItem>? thursday;
  List<OpeningHourItem>? friday;
  List<OpeningHourItem>? saturday;
  List<OpeningHourItem>? sunday;

  OpeningHours(
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  );

  OpeningHours.fromJson(Map<String, dynamic> json) {
    if (json['monday'] != null) {
      monday = <OpeningHourItem>[];
      json['monday'].forEach((v) {
        monday!.add(OpeningHourItem.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['tuesday'] != null) {
      tuesday = <OpeningHourItem>[];
      json['tuesday'].forEach((v) {
        tuesday!.add(OpeningHourItem.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['wednesday'] != null) {
      wednesday = <OpeningHourItem>[];
      json['wednesday'].forEach((v) {
        wednesday!.add(OpeningHourItem.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['thursday'] != null) {
      thursday = <OpeningHourItem>[];
      json['thursday'].forEach((v) {
        thursday!.add(OpeningHourItem.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['friday'] != null) {
      friday = <OpeningHourItem>[];
      json['friday'].forEach((v) {
        friday!.add(OpeningHourItem.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['saturday'] != null) {
      saturday = <OpeningHourItem>[];
      json['saturday'].forEach((v) {
        saturday!.add(OpeningHourItem.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['sunday'] != null) {
      sunday = <OpeningHourItem>[];
      json['sunday'].forEach((v) {
        sunday!.add(OpeningHourItem.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (monday != null) {
      data['monday'] = monday!.map((v) => v.toJson()).toList();
    }
    if (tuesday != null) {
      data['tuesday'] = tuesday!.map((v) => v.toJson()).toList();
    }
    if (wednesday != null) {
      data['wednesday'] = wednesday!.map((v) => v.toJson()).toList();
    }
    if (thursday != null) {
      data['thursday'] = thursday!.map((v) => v.toJson()).toList();
    }
    if (friday != null) {
      data['friday'] = friday!.map((v) => v.toJson()).toList();
    }
    if (saturday != null) {
      data['saturday'] = saturday!.map((v) => v.toJson()).toList();
    }
    if (sunday != null) {
      data['sunday'] = sunday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OpeningHourItem {
  String? from;
  String? to;

  OpeningHourItem({this.from, this.to});

  OpeningHourItem.fromJson(Map<String, dynamic> json) {
    from = json['from'] as String?;
    to = json['to'] as String?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}
