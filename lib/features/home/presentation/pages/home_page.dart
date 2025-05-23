import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../mockdata/carousel_mock_data.dart';
import '../widgets/custom_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(),
      ),
      // This padding follows the Figma 5-c2lumn grid (20px margin) // Comment retained, though padding is removed
      body: Column( // The Padding widget was removed here
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomSearchBar(),
          const SizedBox(height: 20),
          CustomCarousel(
            items: carouselMockData,
            height: 200,
          ),
          const SizedBox(height: 20),
          // More widgets coming here...
        ],
      ),
    );
  }
}