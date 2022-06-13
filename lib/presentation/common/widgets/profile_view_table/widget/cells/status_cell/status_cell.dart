import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/status_cell/base_status_cell.dart';
import 'package:flutter/material.dart';

enum CompanyStatusCellType {
  notFullData,
  waitingForVerification,
  verified,
  declined,
  unknown,
}

class CompanyStatusCell extends StatelessWidget {
  const CompanyStatusCell({
    Key? key,
    required this.repCompany,
  }) : super(key: key);

  final RepCompany repCompany;

  @override
  Widget build(BuildContext context) {
    switch (getStatusType()) {
      case CompanyStatusCellType.notFullData:
        return DataCompleteStatusCell(
          value: parseFillingProgress(
            repCompany.company?.fillingProgress,
          ),
        );
      case CompanyStatusCellType.waitingForVerification:
        return const AwaitingVerificationCell();
      case CompanyStatusCellType.verified:
        return const VerifiedStatusCell();
      case CompanyStatusCellType.declined:
        return const DeclinedCell();
      case CompanyStatusCellType.unknown:
        return const UnknownStatusCell();
    }
  }

  CompanyStatusCellType getStatusType() {
    if (repCompany.company?.fillingProgress != null) {
      if (parseFillingProgress(repCompany.company?.fillingProgress) < 100) {
        return CompanyStatusCellType.notFullData;
      }

      if (parseFillingProgress(repCompany.company?.fillingProgress) == 100) {
        return CompanyStatusCellType.waitingForVerification;
      }

      if (repCompany.branch!.fillingProgress == 100 &&
          repCompany.company!.isVerified! &&
          !repCompany.company!.isVerificationRequestDeclined!) {
        return CompanyStatusCellType.verified;
      }

      if (repCompany.branch!.fillingProgress == 100 &&
          repCompany.company!.isVerificationRequestDeclined! &&
          !repCompany.company!.isVerified!) {
        return CompanyStatusCellType.declined;
      }
    }

    return CompanyStatusCellType.unknown;
  }
}

///parse dynamic fillingProgress field from backend
///because it's receive sometimes like String and sometimes like Int
///TODO this is temporary solution. remove after fix on backend
int parseFillingProgress(dynamic value) {
  if (value is String) {
    return int.parse(value);
  }

  return value as int;
}
