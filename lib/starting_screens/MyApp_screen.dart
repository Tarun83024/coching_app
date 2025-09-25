import 'package:coching_app/starting_screens/login_screen.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with TickerProviderStateMixin {
  late AnimationController _smallImageController;
  late Animation<Offset> _smallImageOffset;

  late AnimationController _bigImageController;
  late Animation<Offset> _bigImageOffset;

  @override
  void initState() {
    super.initState();

    _smallImageController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _smallImageOffset = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _smallImageController,
      curve: Curves.easeOut,
    ));

    _bigImageController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _bigImageOffset = Tween<Offset>(
      begin: const Offset(-2.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _bigImageController,
      curve: Curves.easeOutBack,
    ));

    Future.delayed(const Duration(milliseconds: 300), () {
      _smallImageController.forward();
      _bigImageController.forward();
    });
  }

  @override
  void dispose() {
    _smallImageController.dispose();
    _bigImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Design
          Positioned(
            top: -150,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                color: Color(0xFFD0E8F2), // soft govt blue
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                color: Color(0xFFD0E8F2),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 100),

                            // Small Icon (e.g. logo)
                            // Small Avatar from assets
                            // SlideTransition(
                            //   position: _smallImageOffset,
                            //   child: const Align(
                            //     alignment: Alignment.topRight,
                            //     child: CircleAvatar(
                            //       radius: 30,
                            //       backgroundImage: AssetImage(
                            //           'assets/images/small_avatar.png'),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(height: 10),

// Big Avatar from assetsSlideTransition(
                            SlideTransition(
                              position: _bigImageOffset,
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/starting_logo.jpg',
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 180),

                            const Text(
                              "Smart Prep for Govt Exams",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                                color: Color.fromARGB(255, 100, 181, 246),
                              ),
                            ),
                            const SizedBox(height: 20),

                            const Text(
                              "Smart Learning for Bright Futures",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 30, left: 24, right: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(_createLoginRoute());
                          },
                          child: const Text(
                            "Start Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Route _createLoginRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const LoginScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
