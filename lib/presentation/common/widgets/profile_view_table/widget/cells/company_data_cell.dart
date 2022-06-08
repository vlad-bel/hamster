import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/logo.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_header.dart';
import 'package:flutter/material.dart';

class CompanyCell extends StatelessWidget {
  const CompanyCell({
    Key? key,
    required this.repCompany,
  }) : super(key: key);

  final RepCompany repCompany;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CompanyCellAvatar(
          imagePath: repCompany.company?.logos,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                repCompany.company?.companyName ?? '',
                style: inter14Medium,
              ),
              Text(
                repCompany.getFullAddress(),
                style: inter14,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CompanyCellAvatar extends StatelessWidget {
  const CompanyCellAvatar({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  final List<CompanyLogo>? imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      if (imagePath!.isNotEmpty) {
        return Row(
          children: [
            SizedBox(
              width: 90,
              child: Stack(
                alignment: Alignment.center,
                children: generateAvatars(),
              ),
            ),
            if (imagePath!.length > 2)
              Text(
                '+${imagePath!.length - 2}',
                style: inter14,
              ),
          ],
        );
      }
    }

    return SizedBox(
      height: 50,
      width: 50,
      child: ClipOval(
        child: Image.asset(
          Assets.imagesProfileIcon,
        ),
      ),
    );
  }

  List<Widget> generateAvatars() {
    final avatars = <Widget>[];
    const horizontalOffset = 32.0;
    for (var i = 0; i < imagePath!.length; i++) {
      if (i == 2) break;
      avatars.add(
        Positioned(
          left: i * horizontalOffset,
          child: Avatar(
            width: 50,
            height: 50,
            image: imagePath![i].fileName,

            ///TODO remove mock data
            ///get data from backend
            placeholderImage: Assets.imagesProfileIcon,
          ),
        ),
      );
    }

    return avatars;
  }
}
