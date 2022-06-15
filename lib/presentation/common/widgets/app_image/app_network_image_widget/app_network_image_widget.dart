import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/image/image_paths.dart';
import 'package:business_terminal/config/image/raster_paths.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_network_image_widget/bloc/app_network_image_widget_bloc.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_network_image_widget/bloc/app_network_image_widget_state.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNetworkImageWidget extends StatefulWidget {
  const AppNetworkImageWidget({
    Key? key,
    required this.fileName,
    required this.fit,
  }) : super(key: key);

  final String fileName;
  final BoxFit fit;

  @override
  State<AppNetworkImageWidget> createState() => _AppNetworkImageWidgetState();
}

class _AppNetworkImageWidgetState extends State<AppNetworkImageWidget>
    with AutomaticKeepAliveClientMixin<AppNetworkImageWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => getIt.get<AppNetworkImageWidgetCubit>()
        ..loadFile(
          fileName: widget.fileName,
        ),
      child:
          BlocBuilder<AppNetworkImageWidgetCubit, AppNetworkImageWidgetState>(
        builder: (context, state) {
          return state.when(
            error: (title) {
              return Avatar(
                width: 50,
                height: 50,
                placeholderImage: ImagePaths.png(
                  RasterPaths.profileIcon,
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            notFound: () {
              return Center(
                child: Text(AppLocale.of(context).notFound),
              );
            },
            success: (bytes) {
              return Image.memory(
                bytes,
                fit: widget.fit,
              );
            },
          );
        },
      ),
    );
  }
}
