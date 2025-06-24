import 'package:finli_app/bloc/auth/auth_bloc.dart';
import 'package:finli_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/amcc-logo-new-blue.png'),
                Text(
                  'Finli',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3B82F6),
                  ),
                ),
              ],
            ),
            SizedBox(height: 43),
            Image.asset('assets/img_login.png', height: 183),
            SizedBox(height: 43),
            Text(
              'Selamat Datang',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Silahkan login untuk melanjutkan',

              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 48),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.grey),
                  hintText: 'Email Address',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.grey),
                  hintText: 'Password',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 65),
            // ElevatedButton(
            //   onPressed: () {
            //     final email = _emailcontroller.text.trim();
            //     final password = _passwordcontroller.text.trim();

            //     if (email == '' && password == '') {
            //       Navigator.pushNamed(context, '/main');
            //     } else {
            //       showDialog(
            //         context: context,
            //         builder:
            //             (context) => AlertDialog(title: Text('Invalid Login')),
            //       );
            //     }
            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 28),
            //     backgroundColor: Color(0xFF3B82F6),
            //   ),
            //   child: Text(
            //     'Login',
            //     style: GoogleFonts.plusJakartaSans(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w500,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is LoginAuthAuthenticated) {
                  // Jika login berhasil, tampilkan pesan dan navigasi ke halaman home.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login successful!')),
                  );
                  Navigator.pushNamed(
                    context,
                    '/main',
                  ); // Navigasi ke halaman home.
                } else if (state is AuthError) {
                  // Jika login gagal, tampilkan pesan error.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.blue),
                  ),
                  // Tampilkan teks "Login" jika tidak sedang loading.
                  onPressed:
                      state is AuthLoading
                          ? null // Nonaktifkan tombol jika sedang loading.
                          : () {
                            if (_emailcontroller.text.isEmpty ||
                                _passwordcontroller.text.isEmpty) {
                              // Validasi input kosong.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in all fields'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              // Memicu event login dengan email dan password.
                              context.read<AuthBloc>().add(
                                LoginRequested(
                                  _emailcontroller.text.trim(),
                                  _passwordcontroller.text.trim(),
                                ),
                              );
                            }
                          },
                  child:
                      state is AuthLoading
                          ? const CircularProgressIndicator(
                            color:
                                Colors
                                    .white, // Tampilkan indikator loading di tombol.
                          )
                          : Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun?"),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "Daftar Sekarang!",
                    style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold,
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
