import 'package:finli_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.04,
          horizontal: width * 0.04,
        ),
        child: Column(
          // HEADER
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_avatar.png'),
                  backgroundColor: Color(0xFFEA1763),
                ),
                SizedBox(height: 12),
                Text(
                  'Riyan',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'riyan@gmail.com',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 32),
                // FIELD CONTENT
                FieldEditProfile(
                  title: 'Nama Lengkap',
                  hintText: 'Masukkan nama lengkap Anda',
                ),
                const SizedBox(height: 12),
                FieldEditProfile(
                  title: 'Username',
                  hintText: 'Masukkan username Anda',
                ),
                const SizedBox(height: 12),
                FieldEditProfile(
                  title: 'Email',
                  hintText: 'Masukkan email Anda',
                ),

                const SizedBox(height: 62),
                // BUTTON EDIT PROFILE
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 169,
                      vertical: 21,
                    ),
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FieldEditProfile extends StatelessWidget {
  final String title;
  final String hintText;
  const FieldEditProfile({
    super.key,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: AppColors.black,
            ),

            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: AppColors.black,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: Color.fromARGB(212, 192, 192, 192),
                  width: 1.0,
                ),
              ),
              filled: true,
              fillColor: AppColors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: AppColors.blue, width: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
