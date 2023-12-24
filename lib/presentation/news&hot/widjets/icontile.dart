import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';

class IconTile extends StatelessWidget {
  final String tittle;
  final IconData icon;
  final double iconsize;
  final double fontsize;
  const IconTile({
    super.key,
    required this.tittle,
    required this.icon,
    this.iconsize = 30,
    this.fontsize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhitecolor,
            size: iconsize,
          ),
          Text(
            tittle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
