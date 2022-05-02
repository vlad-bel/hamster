import 'package:business_terminal/presentation/company_creation/cubit/company_creation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:google_maps_webservice/places.dart';

@injectable
class CompanyCreationCubit extends Cubit<CompanyCreationState> {
  CompanyCreationCubit() : super(const CompanyCreationState.loading()) {
    // formGroup.valueChanges.listen((event) async {
    //   if (event != null) {
    //     final addressValue = event[addressField]! as String;
    //    final response =  await places.autocomplete(
    //       addressValue,
    //     );
    //     response.predictions.forEach((element) {
    //       print("prediction:${element.description}");
    //     });
    //   }
    // });
  }

  static const companyField = 'company';
  static const addressField = 'address';
  static const postcodeField = 'postcode';

  final formGroup = fb.group({
    companyField: FormControl<String>(),
    addressField: FormControl<String>(),
    postcodeField: FormControl<String>(),
  });

  final places = GoogleMapsPlaces(
    apiKey: 'AIzaSyBkUrWkOYuIXxLHNLrqrZpGzk3aYP7vX7A',
  );
}
