import 'package:finli_app/bloc/auth/auth_bloc.dart';
import 'package:finli_app/pages/login_page.dart';
import 'package:finli_app/pages/profile/edit_profile_page.dart';
import 'package:finli_app/theme/color.dart';
import 'package:finli_app/widgets/profile_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          // HEADER
          Container(
            height: height * 0.28,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Center(
              child: Column(
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
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'riyan@gmail.com',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BUTTON CONTENT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 34),
            child: Column(
              children: [
                ProfileButtonWidgets(
                  title: "Ubah Profil",
                  icon: Icons.account_circle_rounded,
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
                ProfileButtonWidgets(
                  title: "Pengaturan",
                  icon: Icons.build_circle_rounded,
                  onPressed: () {
                    // Action for changing profile
                  },
                ),
                SizedBox(height: 40),
                ProfileButtonWidgets(
                  title: "Ganti Password",
                  icon: Icons.https,
                  onPressed: () {
                    // Action for changing profile
                  },
                ),
                SizedBox(height: 40),
                ProfileButtonWidgets(
                  title: "Kebijakan Privasi",
                  icon: Icons.info_rounded,
                  onPressed: () {
                    // Action for changing profile
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 120),
          // LOGOUT BUTTON
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthAuthenticated) {
                // Jika logout berhasil, tampilkan pesan dan navigasi ke halaman login.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('logout successful!')),
                );
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              } else if (state is AuthError) {
                // Jika logout gagal, tampilkan pesan error.
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 120,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(LogoutRequested());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        'Logout',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
