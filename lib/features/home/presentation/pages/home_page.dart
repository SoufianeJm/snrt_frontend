import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../mockdata/carousel_mock_data.dart';
import '../widgets/custom_carousel.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../widgets/recommended_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CustomSearchBar(),
            const SizedBox(height: 20),
            CustomCarousel(
              items: carouselMockData,
              height: 200,
            ),
            const RecommendedSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Handle navigation here if needed
        },
      ),
    );
  }
}