import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/search_place/cubit/search_place_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/search_place/cubit/search_place_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    Key? key,
    required this.layerLink,
    required this.cubit,
    required this.overlayEntry,
    required this.size,
  }) : super(key: key);

  final LayerLink layerLink;
  final SearchPlaceCubit cubit;
  final OverlayEntry overlayEntry;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, SearchPlaceState state) {
        return state.when(
          open: (predictions) {
            return Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                showWhenUnlinked: false,
                link: layerLink,
                offset: Offset(0, size.height),
                child: Material(
                  elevation: 4,
                  child: Container(
                    height: predictions.length * 50,
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final prediction = predictions[index];
                        return ListTile(
                          onTap: () {
                            cubit.selectPrediction(prediction);
                            overlayEntry.remove();
                          },
                          title: SizedBox(
                            width: size.width,
                            child: Text(
                              prediction.description!,
                              style: inter12,
                            ),
                          ),
                        );
                      },
                      itemCount: predictions.length,
                    ),
                  ),
                ),
              ),
            );
          },
          idle: (e) => const SizedBox(),
        );
      },
    );
  }
}
