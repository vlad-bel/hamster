import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_top_photo_and_logo_pager_empty.dart';
import 'package:business_terminal/presentation/branch_profile_picture/branch_profile_picture_page.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:business_terminal/presentation/common/widgets/dynamic_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchTopPhotoAndLogoPager extends StatefulWidget {
  const BranchTopPhotoAndLogoPager({
    Key? key,
  }) : super(key: key);

  @override
  State<BranchTopPhotoAndLogoPager> createState() =>
      _BranchTopPhotoAndLogoPagerState();
}

class _BranchTopPhotoAndLogoPagerState
    extends State<BranchTopPhotoAndLogoPager> {
  final pageViewController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchProfileCubit, BranchProfileState>(
      builder: (context, state) {
        if (state.branchImages?.isEmpty ?? true) {
          return BranchTopPhotoAndLogoPagerEmpty();
        }
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: lynch,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Stack(
                  children: [
                    BlocBuilder<BranchProfileCubit, BranchProfileState>(
                      builder: (cubit, state) {
                        return PageView.builder(
                          controller: pageViewController,
                          itemCount: state.branchImages?.length ?? 0,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: double.infinity,
                              child: DynamicImage(
                                path: state.branchImages?[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Align(
                      child: Row(
                        children: [
                          CupertinoButton(
                            onPressed: () async {
                              await pageViewController.previousPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.ease,
                              );
                              setState(() {});
                            },
                            padding: EdgeInsets.zero,
                            child: SvgPicture.asset(
                              Assets.imagesPagerArrowLeft,
                            ),
                          ),
                          Spacer(),
                          CupertinoButton(
                            onPressed: () async {
                              await pageViewController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.ease,
                              );
                              setState(() {});
                            },
                            padding: EdgeInsets.zero,
                            child: SvgPicture.asset(
                              Assets.imagesPagerArrowRight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: solitude1,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),

                          ///todo make to acumin font from Raik
                          child: BlocBuilder<BranchProfileCubit,
                              BranchProfileState>(
                            builder: (context, state) {
                              final currentPageIndex =
                                  '${pageViewController.hasClients ? (pageViewController.page?.toInt() ?? 0) + 1 : 1} / ${state.branchImages!.length}';
                              return Text(
                                currentPageIndex,
                                style: inter14Semibold,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 128,
                left: 64,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: BlocBuilder<BranchProfileCubit, BranchProfileState>(
                  builder: (context, state) {
                    return BranchLogo(
                      image: state.avatarImages?[0],
                    );
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(8, -12),
              child: Align(
                alignment: Alignment.topRight,
                child: EditButton(
                  icon: Icons.edit,
                  onEditTap: () {
                    Navigator.pushNamed(context, BranchProfilePicturePage.path);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class BranchLogo extends StatelessWidget {
  const BranchLogo({
    Key? key,
    required this.image,
  }) : super(key: key);

  final dynamic image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: white,
      ),
      padding: const EdgeInsets.all(4),
      child: ClipOval(
        child: DynamicImage(
          path: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
