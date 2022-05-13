import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenuHeader extends StatelessWidget {
  const SideMenuHeader({
    Key? key,
    this.imageUrl,
    this.repCompany,
  }) : super(key: key);

  final String? imageUrl;
  final RepCompany? repCompany;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          '/images/hamster_logo.svg',
          width: 135,
          color: denim,
        ),
        const SizedBox(height: 60),
        Row(
          children: [
            Avatar(
              image: repCompany?.company.companyLogo,
              width: 50,
              height: 50,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: CupertinoButton(
                child: Text(
                  "ÄNDERN",
                  style: inter14.copyWith(
                    color: denim,
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        CompanyInfo(
          companyAddress: '${repCompany?.company.streetName ?? ""} '
              '${repCompany?.company.streetNumber ?? ""}'
              '${repCompany != null ? "," : ""}'
              ' ${repCompany?.company.postalCode ?? ""} '
              '${repCompany?.company.country ?? ""}',
          companyNumber: repCompany?.company.branchNumber ?? '',
          companyName: repCompany?.company.companyName ?? '',
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.image,
    this.placeholderImage,
    this.width,
    this.height,
  }) : super(key: key);

  final String? image;
  final String? placeholderImage;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      placeholder: (context, image) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: solitude,
            image: placeholderImage != null
                ? DecorationImage(
                    image: AssetImage(placeholderImage!),
                  )
                : null,
          ),
        );
      },
      imageBuilder: (context, image) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: image,
            ),
          ),
        );
      },
      errorWidget: (context, url, dynamic error) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: solitude,
            image: placeholderImage != null
                ? DecorationImage(
                    image: AssetImage(placeholderImage!),
                  )
                : null,
          ),
        );
      },
    );
  }
}

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({
    Key? key,
    required this.companyName,
    required this.companyAddress,
    required this.companyNumber,
  }) : super(key: key);

  final String companyName;
  final String companyAddress;
  final String companyNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          companyName,
          style: inter16SemiBold,
        ),
        const SizedBox(height: 10),
        Text(
          companyAddress,
          style: inter12,
        ),
        const SizedBox(height: 10),
        Text(
          'Nummer: $companyNumber',
          style: inter12,
        ),
      ],
    );
  }
}
