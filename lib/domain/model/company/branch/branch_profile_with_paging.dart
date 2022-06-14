import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch_profile_with_paging.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class BranchProfileWithPaging {
  @JsonKey(name: 'data')
  final List<BranchProfile> data;
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'take')
  final int take;
  @JsonKey(name: 'order')
  final String order;
  @JsonKey(name: 'itemCount')
  final int itemCount;
  @JsonKey(name: 'pageCount')
  final int pageCount;
  @JsonKey(name: 'hasPreviousPage')
  final bool hasPreviousPage;
  @JsonKey(name: 'hasNextPage')
  final bool hasNextPage;

  BranchProfileWithPaging({
    required this.data,
    required this.page,
    required this.take,
    required this.order,
    required this.itemCount,
    required this.pageCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory BranchProfileWithPaging.fromJson(Map<String, dynamic> json) =>
      _$BranchProfileWithPagingFromJson(json);

  Map<String, dynamic> toJson() => _$BranchProfileWithPagingToJson(this);

  String getPrintableString() {
    final branches = data.map((e) => e.toJson().toString()).toList().toString();
    return branches;
  }
}
