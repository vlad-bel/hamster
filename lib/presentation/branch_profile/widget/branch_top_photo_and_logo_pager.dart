import 'package:business_terminal/config/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BranchTopPhotoAndLogoPager extends StatelessWidget {
  const BranchTopPhotoAndLogoPager({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: lynch,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: CachedNetworkImage(
          width: double.infinity,
          fit: BoxFit.cover,
          // TODO: mock - replace with real images later
          imageUrl:
              'https://www.visitphilly.com/wp-content/uploads/2022/02/AutographBrasserie-photo-by-Francesca-Ragucci-2200x1237px.jpg',
        ),
      ),
    );
  }
}
