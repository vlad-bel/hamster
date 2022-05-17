import 'package:business_terminal/presentation/common/widgets/search_place/cubit/search_place_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/search_place/cubit/search_place_state.dart';
import 'package:business_terminal/presentation/common/widgets/search_place/widget/search_list.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:google_maps_webservice/places.dart';

///Textfield for searching place via google places
class SearchPlace extends StatefulWidget {
  SearchPlace({
    Key? key,
    required this.name,
    required this.hint,
    required this.label,
    required this.group,
    required this.onPredictionSelect,
  }) : super(key: key);

  final String hint;
  final String label;
  final String name;
  final FormGroup group;

  final Function(
    Prediction prediction,
  ) onPredictionSelect;

  @override
  State<SearchPlace> createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  OverlayEntry? overlayEntry;

  final layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchPlaceCubit>.value(
      value: SearchPlaceCubit(
        formGroup: widget.group,
        formName: widget.name,
        onPredictionSelect: widget.onPredictionSelect,
      ),
      child: BlocBuilder<SearchPlaceCubit, SearchPlaceState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<SearchPlaceCubit>(context);
          return CompositedTransformTarget(
            link: layerLink,
            child: FormTextField(
              name: widget.name,
              hint: widget.hint,
              label: widget.label,
              onTap: () {
                showOverlay(cubit);
              },
            ),
          );
        },
      ),
    );
  }

  void showOverlay(SearchPlaceCubit cubit) {
    overlayEntry ??= _createOverlayEntry(cubit);
    Overlay.of(context)!.insert(overlayEntry!);
  }

  OverlayEntry _createOverlayEntry(SearchPlaceCubit cubit) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        return SearchList(
          cubit: cubit,
          overlayEntry: overlayEntry!,
          layerLink: layerLink,
          size: size,
        );
      },
    );
  }
}
