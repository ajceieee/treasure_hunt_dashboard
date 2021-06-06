import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/home/home_vm.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class UsersDetail extends ViewModelWidget<HomeScreenVM> {
  const UsersDetail({
    Key? key,
  });

  @override
  Widget build(BuildContext context, HomeScreenVM model) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Leaderboard",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        // Responsive(
        //   mobile: UserCardGridView(
        //     crossAxisCount: _size.width < 650 ? 2 : 4,
        //     childAspectRatio: _size.width < 650 ? 1.3 : 1,
        //   ),
        //   tablet: UserCardGridView(),
        //   desktop: UserCardGridView(
        //     childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
        //   ),
        // ),
      ],
    );
  }
}

class UserCardGridView extends StatelessWidget {
  const UserCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => UserInfoCard(info: demoMyFiles[index]),
    );
  }
}

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Total PLayers",
    numOfFiles: 1328,
    svgSrc: "icons/Documents.svg",
    totalStorage: "1.9GB",
    color: Color(0xFF212332),
    percentage: 35,
  ),
];

class UserInfoCard extends ViewModelWidget<HomeScreenVM> {
  const UserInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context, HomeScreenVM model) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(16.0 * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  info.svgSrc!,
                  color: info.color,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // ProgressLine(
          //   color: info.color,
          //   percentage: info.percentage,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              model.userLoading
                  ? Container()
                  : Text(
                      "${model.userDetails!.length} players",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white70),
                    ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = const Color(0xFF212332),
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
