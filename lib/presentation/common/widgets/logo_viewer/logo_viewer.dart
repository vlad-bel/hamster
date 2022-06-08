import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/widget/avatar_selected_picture.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:flutter/material.dart';

class AppLogoViewer extends StatefulWidget {
  const AppLogoViewer({
    Key? key,
    required this.images,
    required this.onPressed,
  }) : super(key: key);

  final List<AppColoredFile> images;
  final VoidCallback onPressed;

  @override
  State<AppLogoViewer> createState() => _AppLogoViewerState();
}

class _AppLogoViewerState extends State<AppLogoViewer> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.images.length > 1)
              InkWell(
                onTap: () async {
                  await controller.previousPage(
                    duration: const Duration(
                      milliseconds: 1,
                    ),
                    curve: Curves.easeIn,
                  );
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: lynch,
                  size: 32,
                ),
              ),
            SizedBox(
              width: 200,
              height: 200,
              child: PageView.builder(
                itemCount: widget.images.length,
                controller: controller,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      color: widget.images[index].color != null &&
                              widget.images[index].color?.length == 6
                          ? Color(
                              int.parse('0xFF${widget.images[index].color}'))
                          : Colors.transparent,
                    ),
                    child: AvatarSelectedPicture(
                      appFile: widget.images[index],
                      onPressed: widget.onPressed,
                    ),
                  );
                },
              ),
            ),
            if (widget.images.length > 1)
              InkWell(
                onTap: () async {
                  await controller.nextPage(
                    duration: const Duration(
                      milliseconds: 1,
                    ),
                    curve: Curves.easeIn,
                  );
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: lynch,
                  size: 32,
                ),
              ),
          ],
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: white,
              child: FutureBuilder(
                future: Future.value(true),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<void> snap,
                ) {
                  return Text(
                    '${(controller.page?.round() ?? 0) + 1} / ${widget.images.length}',
                    style: inter14,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
