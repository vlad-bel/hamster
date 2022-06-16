import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_branch_profile_checkboxes_cubit.freezed.dart';

enum CompanyDataCommonFieldsWithBranchData {
  companyName,
  streetName,
  streetNumber,
  postalCode,
  city,
  country,
  allSelected,
}

typedef CreateBranchProfileCheckboxesData
    = Map<CompanyDataCommonFieldsWithBranchData, bool>;

@injectable
class CreateBranchProfileCheckboxesCubit
    extends Cubit<CreateBranchProfileCheckboxesState> {
  CreateBranchProfileCheckboxesCubit()
      : super(const CreateBranchProfileCheckboxesState.initial({})) {
    emit(InitialBranchCheckboxes(dataMap));
  }

  CreateBranchProfileCheckboxesData dataMap = {
    CompanyDataCommonFieldsWithBranchData.companyName: false,
    CompanyDataCommonFieldsWithBranchData.streetName: false,
    CompanyDataCommonFieldsWithBranchData.postalCode: false,
    CompanyDataCommonFieldsWithBranchData.city: false,
    CompanyDataCommonFieldsWithBranchData.country: false,
    CompanyDataCommonFieldsWithBranchData.allSelected: false,
  };

  void changeSelection(
    CompanyDataCommonFieldsWithBranchData enumFieldType, {
    required bool? isSelected,
  }) {
    state.whenOrNull(
      initial: (data) {
        final selected = isSelected ?? false;

        if (enumFieldType ==
            CompanyDataCommonFieldsWithBranchData.allSelected) {
          _selectAll(isSelected: selected);
        } else {
          _changeSelectionOfCheckboxes(enumFieldType, selected);
        }
      },
    );
  }

  void _changeSelectionOfCheckboxes(
      CompanyDataCommonFieldsWithBranchData enumFieldType, bool isSelected) {
    dataMap[enumFieldType] = isSelected;
    dataMap[CompanyDataCommonFieldsWithBranchData.allSelected] = false;

    final newMap = Map.of(dataMap);
    updateState(newMap);
  }

  void _selectAll({required bool? isSelected}) {
    dataMap.updateAll((key, value) {
      final selected = isSelected ?? false;
      return selected;
    });

    updateState(dataMap);
  }

  bool isSelectedAll() {
    final result =
        dataMap[CompanyDataCommonFieldsWithBranchData.allSelected] ?? false;
    return result;
  }

  void updateState(CreateBranchProfileCheckboxesData newMap) {
    // TODO: investigate why removing of line below (LoadingBranchCheckboxes) will break UI update
    // TODO: and why deep/shallow copy of map does not solve it
    emit(const LoadingBranchCheckboxes());
    emit(InitialBranchCheckboxes(newMap));
  }
}

@freezed
class CreateBranchProfileCheckboxesState
    with _$CreateBranchProfileCheckboxesState {
  const factory CreateBranchProfileCheckboxesState.initial(
    CreateBranchProfileCheckboxesData data,
  ) = InitialBranchCheckboxes;

  const factory CreateBranchProfileCheckboxesState.loading() =
      LoadingBranchCheckboxes;
}
