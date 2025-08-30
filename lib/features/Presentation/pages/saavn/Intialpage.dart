import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/usermodel.dart';
import '../../Blocs/Musicbloc/User_bloc/user_bloc_bloc.dart';
import '../MainHomePage/MainHomePage.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  bool _isloading = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Centered container
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App Icon
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset("assets/icon.png", scale: 15),
                  ),
                  Spaces.kheight30,

                  // Greeting
                  Text(
                    'Welcome Aboard!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.orbitron(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Spaces.kheight10,
                  Text(
                    'Let\'s get started by knowing your name',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                  Spaces.kheight30,

                  // Text Field
                  TextField(
                    controller: _textEditingController,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white10,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  Spaces.kheight30,

                  // Proceed Button
                  GestureDetector(
                    onTap: () {
                      final name = _textEditingController.text.trim();
                      if (name.length >= 5) {
                        final usermodel = Usermodel(
                          name: name,
                          date: DateTime.now().toString(),
                        );

                        BlocProvider.of<UserBlocBloc>(
                          context,
                        ).add(UserBlocEvent.userdetails(usermodel, 'initial'));

                        setState(() {
                          _isloading = true;
                        });

                        Future.delayed(const Duration(seconds: 2)).then((_) {
                          if (mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MainHomePage(),
                              ),
                            );
                          }
                        });
                      } else {
                        Spaces.showtoast('Name must be at least 5 characters.');
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.indigo, Colors.deepPurple],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          'Let\'s Go 🚀',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spaces.kheight20,

                  // Disclaimer
                  Text(
                    '🔒 All data stays securely on your device.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.white54,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Loading Indicator
          if (_isloading)
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
