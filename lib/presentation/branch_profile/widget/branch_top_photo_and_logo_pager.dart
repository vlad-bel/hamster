import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  ///TODO store to bloc
  final images = [
    'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
    'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
  ];

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                PageView.builder(
                  controller: pageViewController,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: images[index % images.length],
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
                      child:
                          // SizedBox(),
                          Text(
                        '${pageViewController.hasClients ? pageViewController.page!.toInt() + 1 : 1} / ${images.length}',
                        style: inter14Semibold,
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
            child: BranchLogo(
                image:
                    'https://qph.cf2.quoracdn.net/main-qimg-3e45cfebdc1a71a6c2c1962f662d7873-lq'),
          ),
        ),
        Transform.translate(
          offset: Offset(8, -12),
          child: Align(
            alignment: Alignment.topRight,
            child: EditButton(
              onEditTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class BranchLogo extends StatelessWidget {
  const BranchLogo({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: white,
      ),
      padding: EdgeInsets.all(4),
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: image,
        ),
      ),
    );
  }
}
