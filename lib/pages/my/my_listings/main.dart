import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class MyListings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LeftRightTile(
          tile1: ListingsContainer(
            label: 'Active',
          ),
          tile2: ListingsContainer(
            label: 'Reviewing',
          ),
        ),
        LeftRightTile(
          tile1: ListingsContainer(
            label: 'Expired',
          ),
          tile2: ListingsContainer(
            label: 'Declined',
          ),
        )
      ],
    );
  }
}

class ListingsContainer extends StatelessWidget {
  final String label;

  const ListingsContainer({
    Key key,
    this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.officialMatchFourth,
              blurRadius: 8,
            )
          ]),
      width: width * 0.35,
      height: width * 0.35,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onTap: () => Navigator.pushNamed(
            context,
            'categorised_listings',
            arguments: {"type": label},
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Stack(
              children: [
                Image.asset(
                  'assets/profileTab/$label.png',
                  height: 30,
                ),
                Positioned(
                  bottom: 0,
                  child: NepekText(
                    capitalize(label),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.officialMatch,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeftRightTile extends StatelessWidget {
  final Widget tile1;
  final Widget tile2;
  const LeftRightTile({Key key, this.tile1, this.tile2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: width * 0.1),
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tile1,
          tile2,
        ],
      ),
    );
  }
}
