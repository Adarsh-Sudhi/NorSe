import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:norse/configs/constants/Spaces.dart';

class Aboutpage extends StatefulWidget {
  static const String aboutpage = './aboutpage';
  const Aboutpage({super.key});

  @override
  State<Aboutpage> createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  bool loading = true;

  _call() async {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Textutil(
          text: 'About',
          fontsize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
          splashRadius: 24,
        ),
      ),
      body:
          loading
              ? const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
              : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Circular Icon with subtle shadow
                      Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/icon.png",
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Card with app info
                      Card(
                        color: Colors.grey.shade900.withValues(alpha: 0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 28,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Textutil(
                                text: 'NorSe Music',
                                fontsize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                              const SizedBox(height: 6),
                              Textutil(
                                text: Spaces.version,
                                fontsize: 12,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Built with ",
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                    size: 16,
                                  ),
                                  Text(
                                    ' by Adarsh N S',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'NorSe is an open source project and can be found here',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.aldrich(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 16),

                              ElevatedButton.icon(
                                onPressed: () async {
                                  final uri =
                                      'https://github.com/adarsh-ns-dev/NorSe';

                                  await EasyLauncher.url(url: uri);
                                },
                                icon: const Icon(Icons.code),
                                label: const Text('View on GitHub'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.indigo,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 24,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Social and Connect Section
                      Column(
                        children: [
                          const Textutil(
                            text: 'Connect with me on',
                            fontsize: 12,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _socialIcon(
                                context,
                                'assets/instagram.png',
                                'https://www.instagram.com/_adarsh_ns/?igsh=aDVqdXJrY2Nrczh0',
                              ),
                              const SizedBox(width: 24),
                              Text(
                                'OR',
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(width: 24),
                              _socialIcon(
                                context,
                                'assets/linkedin.png',
                                'https://www.linkedin.com/in/adarsh-n-s-97b3a0246?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                              ),
                            ],
                          ),

                          const SizedBox(height: 28),

                          const Textutil(
                            text: 'If you like my work',
                            fontsize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),

                          const SizedBox(height: 12),

                          ElevatedButton.icon(
                            onPressed: () async {
                              final uri =
                                  'https://www.buymeacoffee.com/adarshadarz';

                              await EasyLauncher.url(url: uri);
                            },
                            icon: const Icon(Icons.coffee),
                            label: const Text('Buy Me A Coffee'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 28,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _socialIcon(BuildContext context, String assetPath, String url) {
    return InkWell(
      onTap: () async {
        await EasyLauncher.url(url: url);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 46,
        width: 46,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Image.asset(assetPath),
      ),
    );
  }
}
