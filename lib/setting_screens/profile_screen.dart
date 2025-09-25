import 'package:animate_do/animate_do.dart';
import 'package:coching_app/screens/SuportScreen.dart';
import 'package:coching_app/setting_screens/DownloadSettingsScreen.dart';
import 'package:coching_app/setting_screens/FaqsScreen.dart';
import 'package:coching_app/setting_screens/MyDownloadsScreen.dart';
import 'package:coching_app/setting_screens/MySubscriptionsScreen.dart';
import 'package:coching_app/setting_screens/NotificationSettingsScreen.dart';
import 'package:coching_app/setting_screens/PrivacyPolicyScreen.dart';
import 'package:coching_app/setting_screens/PurchasedCoursesScreen.dart';
import 'package:coching_app/setting_screens/ReportProblemScreen.dart';
import 'package:coching_app/setting_screens/TermsAndConditionsScreen.dart';
import 'package:coching_app/setting_screens/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:coching_app/bottom_screens/user_details_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLanguage = 'English';
  void _handleTap(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$title tapped"),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: ListView(
            physics: const BouncingScrollPhysics(), // <- smooth scrolling
            padding: const EdgeInsets.only(bottom: 20),
            children: [
              const SizedBox(height: 12),

              /// Profile Card with slight slide animation
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const EditProfileScreen()),
                  );
                },
                child: SlideInRight(
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/icons/person.png"),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tarun Kumawat",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "tarun.kumawat@example.com",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,
                            size: 18, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Sections with animated items
              _buildAnimatedSection(
                "Account",
                [
                  _buildAnimatedTile(Icons.lock_outline, "Change Password", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ChangePasswordScreen()),
                    );
                  }),
                  _buildAnimatedTile(
                      Icons.notifications_outlined, "Notification Settings",
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const NotificationSettingsScreen()),
                    );
                  }),
                  _buildAnimatedSection("Learning Preferences", [
                    _buildAnimatedTile(
                        Icons.language, "Language", _showLanguageBottomSheet),
                    // _buildAnimatedTile(Icons.high_quality_outlined,
                    //     "Video Quality", () => _handleTap("Video Quality")),
                    _buildAnimatedTile(
                      Icons.download_for_offline,
                      "Download Settings",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DownloadSettingsScreen()),
                      ),
                    ),
                  ]),
                  _buildAnimatedSection("App Usage", [
                    _buildAnimatedTile(
                        Icons.subscriptions_outlined,
                        "My Subscriptions",
                        () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const MySubscriptionsScreen()),
                            )),
                    _buildAnimatedTile(
                      Icons.play_circle_outline,
                      "Purchased Courses",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PurchasedCoursesScreen()),
                      ),
                    ),
                    _buildAnimatedTile(
                        Icons.folder_open_outlined,
                        "My Downloads",
                        () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MyDownloadsScreen()),
                            )),
                  ]),
                  _buildAnimatedSection("Support", [
                    _buildAnimatedTile(
                      Icons.help_outline,
                      "FAQs",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FaqsScreen()),
                      ),
                    ),
                    _buildAnimatedTile(
                      Icons.support_agent_outlined,
                      "Contact Support",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SupportScreen()),
                      ),
                    ),
                    _buildAnimatedTile(
                      Icons.bug_report_outlined,
                      "Report a Problem",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportProblemScreen()),
                      ),
                    ),
                  ]),
                  _buildAnimatedSection("Other", [
                    _buildAnimatedTile(
                      Icons.privacy_tip_outlined,
                      "Privacy Policy",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen()),
                      ),
                    ),
                    _buildAnimatedTile(
                      Icons.description_outlined,
                      "Terms & Conditions",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TermsAndConditionsScreen()),
                      ),
                    ),
                    _buildAnimatedTile(
                      Icons.star_border,
                      "Rate Us",
                      () => _showBeautifulRateUsDialog(context),
                    ),
                    _buildAnimatedTile(
                      Icons.logout,
                      "Logout",
                      () => _showLogoutDialog(context),
                    ),
                  ]),
                  const SizedBox(height: 30),
                ],
              ),
            ]));
  }

  Widget _buildAnimatedSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeIn(
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        ...tiles,
      ],
    );
  }

  Widget _buildAnimatedTile(IconData icon, String title, VoidCallback onTap) {
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: _buildSettingsTile(icon, title, onTap),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 15)),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Choose Your Language',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // English option
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLanguage = 'English';
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: selectedLanguage == 'English'
                        ? Colors.blue.shade50
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedLanguage == 'English'
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.language, color: Colors.black54),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'English',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      if (selectedLanguage == 'English')
                        const Icon(Icons.check_circle, color: Colors.blue),
                    ],
                  ),
                ),
              ),

              // Hindi option
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLanguage = 'हिन्दी';
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: selectedLanguage == 'हिन्दी'
                        ? Colors.blue.shade50
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedLanguage == 'हिन्दी'
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.translate, color: Colors.black54),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'हिन्दी',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      if (selectedLanguage == 'हिन्दी')
                        const Icon(Icons.check_circle, color: Colors.blue),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Logout",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.4), // Dark background
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox.shrink(); // Required for showGeneralDialog
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //  const Icon(Icons.logout, size: 48, color: Colors.redAccent),
                  const SizedBox(height: 12),
                  const Text(
                    "Are you sure?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Do you really want to logout?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // 🔐 Your logout logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Logged out successfully")),
                          );
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void _showBeautifulRateUsDialog(BuildContext context) {
  int selectedRating = 0;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.star_rounded, size: 50, color: Colors.amber),
                const SizedBox(height: 10),
                const Text(
                  "Rate Your Experience",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "How would you rate our app?",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 20),

                // ⭐ Rating Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRating = index + 1;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          index < selectedRating
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          size: 36,
                          color: index < selectedRating
                              ? Colors.amber
                              : Colors.grey.shade400,
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black))),

                    // Submit
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Thank you! You rated $selectedRating ⭐"),
                          ),
                        );

                        // TODO: Push to API or open Play Store for 5⭐
                        // if (selectedRating == 5) launchUrl(...);
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                )
              ]),
            );
          },
        ),
      );
    },
  );
}
