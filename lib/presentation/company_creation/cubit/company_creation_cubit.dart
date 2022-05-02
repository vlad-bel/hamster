import 'package:business_terminal/presentation/company_creation/cubit/company_creation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:google_maps_webservice/places.dart';

@injectable
class CompanyCreationCubit extends Cubit<CompanyCreationState> {
  CompanyCreationCubit() : super(const CompanyCreationState.loading());

  static const companyField = 'company';
  static const addressField = 'address';
  static const postcodeField = 'postcode';

  final formGroup = fb.group({
    companyField: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    addressField: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    postcodeField: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });

  final places = GoogleMapsPlaces(
    apiKey: 'AIzaSyBkUrWkOYuIXxLHNLrqrZpGzk3aYP7vX7A',
  );

  Future createCompany({
    required Prediction selectedAddress,
  }) async {}
}
