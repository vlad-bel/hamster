import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/use_cases/pos_overview/pos_overview_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PosOverviewUseCase)
class PosOverviewUseCaseImpl extends PosOverviewUseCase {
  PosOverviewUseCaseImpl(this._client);

  final RestClient _client;

  @override
  Future<BranchProfileWithPaging> getData({required int page}) async {
    try {
      final result = await _client.getBranchesByRepresentative(page);
      return result;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'change_password',
      );
    }
  }
}
