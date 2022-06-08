import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/cubit/categories_list_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/cubit/categories_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final Function(String index) onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        border: Border.all(color: lynch.withOpacity(.3)),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
      child: BlocBuilder<CategoriesListCubit, CategoriesListState>(
        builder: (context, state) {
          return Material(
            color: white,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      minVerticalPadding: 0,
                      contentPadding: const EdgeInsets.only(
                        left: 16,
                      ),
                      onTap: () {
                        onSelect(state.items[index]);
                      },
                      title: Text(
                        state.items[index],
                        style: inter14Medium,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: lynch.withOpacity(0.3),
                    ),
                  ],
                );
              },
              itemCount: state.items.length,
            ),
          );
        },
      ),
    );
  }
}
