import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> allCourses = [
    {
      'title': 'IAS Foundation GS',
      'rating': 3.9,
      'videos': '266+ Videos',
      'price': '₹9400',
      'image': 'assets/images/UPSC.jpg',
      'isNew': false,
    },
    {
      'title': 'Law Optional Paper I',
      'rating': 5.0,
      'videos': '25+ Videos',
      'price': '₹9440',
      'image': 'assets/images/UPSC.jpg',
      'isNew': false,
    },
    {
      'title': 'Assistant Professor Political Science',
      'rating': 3.8,
      'videos': '428+ Videos',
      'price': '₹1180',
      'image': 'assets/images/UPSC.jpg',
      'isNew': true,
    },
    {
      'title': 'Assistant Professor Geography',
      'rating': 3.9,
      'videos': '114+ Videos',
      'price': '₹1180',
      'image': 'assets/images/UPSC.jpg',
      'isNew': true,
    },
    {
      'title': 'IAS Foundation GS',
      'rating': 3.9,
      'videos': '266+ Videos',
      'price': '₹9400',
      'image': 'assets/images/UPSC.jpg',
      'isNew': false,
    },
    {
      'title': 'Law Optional Paper I',
      'rating': 5.0,
      'videos': '25+ Videos',
      'price': '₹9440',
      'image': 'assets/images/UPSC.jpg',
      'isNew': false,
    },
    {
      'title': 'Assistant Professor Political Science',
      'rating': 3.8,
      'videos': '428+ Videos',
      'price': '₹1180',
      'image': 'assets/images/UPSC.jpg',
      'isNew': true,
    },
    {
      'title': 'Assistant Professor Geography',
      'rating': 3.9,
      'videos': '114+ Videos',
      'price': '₹1180',
      'image': 'assets/images/UPSC.jpg',
      'isNew': true,
    },
  ];

  List<Map<String, dynamic>> filteredCourses = [];
  String searchText = '';
  String selectedSort = 'Sort by Name';
  final List<String> sortOptions = [
    'Sort by Name',
    'Sort by Rating',
    'Sort by Price',
    'Sort by Videos',
  ];

  @override
  void initState() {
    super.initState();
    filteredCourses = List.from(allCourses);
  }

  void _onSearch(String query) {
    setState(() {
      searchText = query.toLowerCase();
      filteredCourses = allCourses.where((course) {
        return course['title'].toLowerCase().contains(searchText);
      }).toList();
      _applySort(); // apply current sort after search
    });
  }

  void _applySort() {
    if (selectedSort == 'Sort by Name') {
      filteredCourses.sort((a, b) => a['title'].compareTo(b['title']));
    } else if (selectedSort == 'Sort by Rating') {
      filteredCourses.sort((a, b) => b['rating'].compareTo(a['rating']));
    } else if (selectedSort == 'Sort by Price') {
      filteredCourses.sort((a, b) {
        int priceA = int.parse(a['price'].replaceAll(RegExp(r'[^\d]'), ''));
        int priceB = int.parse(b['price'].replaceAll(RegExp(r'[^\d]'), ''));
        return priceA.compareTo(priceB);
      });
    } else if (selectedSort == 'Sort by Videos') {
      int getVideos(String text) =>
          int.parse(text.split('+')[0].replaceAll(RegExp(r'[^\d]'), ''));
      filteredCourses.sort(
          (a, b) => getVideos(b['videos']).compareTo(getVideos(a['videos'])));
    }
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: const Color(0xFFF4F4FC),
      builder: (context) {
        String tempSelectedSort = selectedSort;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select option to sort courses',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: DropdownButtonHideUnderline(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.white, // Dropdown menu color
                    ),
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(12), // Rounded menu
                      value: tempSelectedSort,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: sortOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                              Text(value, style: const TextStyle(fontSize: 14)),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          tempSelectedSort = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.blue)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        selectedSort = tempSelectedSort;
                        _applySort();
                      });
                    },
                    child: const Text('Save',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Search'),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 400),
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: _onSearch,
                        decoration: const InputDecoration(
                          hintText: 'Search by Exam, Subject, Course',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _showSortBottomSheet,
                      child: Icon(Icons.tune, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredCourses.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredCourses.length,
                      itemBuilder: (context, index) {
                        final course = filteredCourses[index];
                        return SlideInUp(
                          duration: Duration(milliseconds: 300 + (index * 100)),
                          child: CourseCard(course: course),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No courses found',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Map<String, dynamic> course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              course['image'],
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          course['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (course['isNew'])
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red.shade600,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text('${course['rating']}',
                          style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 12),
                      const Icon(Icons.video_library_outlined,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(course['videos'],
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course['price'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
