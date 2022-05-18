import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
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
        const CompanyCellAvatar(
          imagePath: [
            ///TODO remove mock data
            ///get data from backend
            'https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg',
            'https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg',
            'https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg',
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                repCompany.company.companyName ?? '',
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
    required this.imagePath,
  }) : super(key: key);

  final List<String> imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Stack(
            alignment: Alignment.center,
            children: generateAvatars(),
          ),
        ),
        if (imagePath.length > 2)
          Text(
            '+${imagePath.length - 2}',
            style: inter14,
          ),
      ],
    );
  }

  List<Widget> generateAvatars() {
    final avatars = <Widget>[];
    const horizontalOffset = 32.0;
    for (var i = 0; i < imagePath.length; i++) {
      if (i == 2) break;
      avatars.add(
        Positioned(
          left: i * horizontalOffset,
          child: Avatar(
            width: 50,
            height: 50,
            image: imagePath[i],

            ///TODO remove mock data
            ///get data from backend
            placeholderImage: 'images/profile_icon.png',
          ),
        ),
      );
    }

    return avatars;
  }
}
