import 'package:carousel_slider/carousel_slider.dart';
import 'package:coching_app/bottom_screens/user_details_screen.dart';
import 'package:coching_app/screens/CourseDetailScreen.dart';
import 'package:coching_app/screens/CoursesScreen.dart';
import 'package:coching_app/screens/TestSeriesScreen.dart';
import 'package:coching_app/screens/SuportScreen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> bannerImages = [
    'assets/images/book1.jpg',
    'assets/images/Book2.jpg',
    'assets/images/Book3.jpg',
  ];

  List<Map<String, dynamic>> topCards = [
    {"title": "Courses", "image": "assets/icons/course.png"},
    {"title": "Test Series", "image": "assets/icons/test.png"},
    {"title": "Support", "image": "assets/icons/book.png"},
  ];

  final List<Map<String, dynamic>> featuredCourses = [
    {
      "title": "RAS Foundation...",
      "subtitle": "SIKAR BATCH\n2025-26",
      "image": "assets/images/UPSC.jpg",
      "rating": 5,
    },
    {
      "title": "Law Optional Pa...",
      "subtitle": "Master-Class",
      "image": "assets/images/UPSC.jpg",
      "rating": 5,
    },
  ];

  final List<Map<String, dynamic>> topRatedCourses = [
    {
      "title": "RAS Foundation English Medium 2025-26",
      "image": "assets/images/UPSC.jpg",
      "rating": 5,
      "price": 50000,
      "isNew": true,
    },
    {
      "title": "Law Optional Paper I",
      "image": "assets/images/UPSC.jpg",
      "rating": 5,
      "price": 9440,
      "videos": 25,
    },
    {
      "title": "Assistant Professor Paper-III (GK)",
      "image": "assets/images/UPSC.jpg",
      "rating": 5,
      "price": 8260,
    },
    {
      "title": "Assistant Professor History",
      "image": "assets/images/UPSC.jpg",
      "rating": 5,
      "price": 17500,
    },
  ];

  @override
  void initState() {
    super.initState();
    topCards[0]['onTap'] = () => _navigateTo(const Coursesscreen());
    topCards[1]['onTap'] = () => _navigateTo(const Testseriesscreen());
    topCards[2]['onTap'] = () => _navigateTo(const SupportScreen());
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, animation, __) => page,
      transitionsBuilder: (_, animation, __, child) => SlideTransition(
        position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .animate(animation),
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  void _navigateTo(Widget screen) {
    Navigator.push(context, _createRoute(screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 2,
      surfaceTintColor: Colors.white,
      toolbarHeight: 65,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, _createRoute(const EditProfileScreen()));
            },
            child: BounceInDown(
              duration: const Duration(milliseconds: 800),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/icons/person.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            "Hi, Webpino",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: [
              BlinkingDot(),
              SizedBox(width: 10),
              Icon(Icons.notifications_none, color: Colors.black87),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Banner
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: FadeIn(
              duration: const Duration(milliseconds: 600),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items: bannerImages.map((imgPath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          /// Looking For
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Looking For",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(
                  children: topCards.map((card) {
                    return Expanded(
                      child: ElasticIn(
                        duration: const Duration(milliseconds: 900),
                        child: InkWell(
                          onTap: card['onTap'],
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(card['image'],
                                    height: 36, width: 36),
                                const SizedBox(height: 8),
                                Text(card['title'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          /// Featured Courses
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Featured Course",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View all",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: featuredCourses.length,
              itemBuilder: (context, index) {
                final course = featuredCourses[index];
                return SlideInLeft(
                  duration: Duration(milliseconds: 300 + (index * 100)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Coursedetailscreen(course: course),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.asset(
                              course['image'],
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(course['title'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(course['subtitle'],
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        size: 14, color: Colors.orange),
                                    const SizedBox(width: 4),
                                    Text("${course['rating']}"),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          /// Top Rated
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Text("Top Rated",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ListView.builder(
            itemCount: topRatedCourses.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final course = topRatedCourses[index];
              return FadeInUp(
                duration: Duration(milliseconds: 300 + (index * 200)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Coursedetailscreen(course: course),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          course['image'],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(course['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                          if (course['isNew'] == true)
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Text("NEW",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  size: 14, color: Colors.orange),
                              const SizedBox(width: 4),
                              Text("${course['rating']}"),
                              if (course.containsKey("videos")) ...[
                                const SizedBox(width: 8),
                                const Icon(Icons.play_circle_outline, size: 14),
                                const SizedBox(width: 4),
                                Text("${course['videos']}+"),
                              ]
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text("₹${course['price']}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
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

class BlinkingDot extends StatefulWidget {
  const BlinkingDot({super.key});
  @override
  State<BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<BlinkingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 0.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const Text(
        "• LIVE",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
