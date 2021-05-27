import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

Future<void> cameraOrGallery(context, cameraFn, galleryFn) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Where do you want your images from',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CamOrGallery(
              label: 'Camera',
              icon: Icons.camera_alt_outlined,
              onTap: cameraFn,
            ),
            CamOrGallery(
              label: 'Photos',
              icon: Icons.photo_outlined,
              onTap: galleryFn,
            ),
          ],
        ),
      );
    },
  );
}

class CamOrGallery extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;

  const CamOrGallery({
    Key key,
    this.label,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.officialMatchLightest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.officialMatch,
            ),
            NepekText(
              label,
              fontWeight: FontWeight.w500,
              color: AppColors.officialMatch,
            )
          ],
        ),
      ),
    );
  }
}
