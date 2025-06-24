import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileButtonWidgets extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;
  const ProfileButtonWidgets(
      {super.key,
      required this.title,
      required this.icon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.black54,
                  size: 30,
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black54,
            size: 16,
          ),
        ],
      ),
    );
  }
}
