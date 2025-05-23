import 'package:flutter/material.dart';

// Make sure this import points to your actual mock data file.
// For example: import 'package:your_app_name/mockdata/recommendation_mock_data.dart';
// As a placeholder, I'll define a simple mock data structure and data below.

// Placeholder for RecommendationItem data structure
class RecommendationItem {
  final String imageUrl;
  final String category;
  final String title;
  final String source;
  final String date;

  const RecommendationItem({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.source,
    required this.date,
  });
}

// Placeholder mock data (replace with your actual data)
final List<RecommendationItem> recommendationMockData = [
  RecommendationItem(
    imageUrl: 'assets/images/recommend1.jpg', // Ensure you have actual images here
    category: 'Politics',
    title: 'Tenue à Rabat de la 1ère session de la Commission Mixte ...',
    source: 'Snrt News',
    date: 'Apr 14, 2025',
  ),
  RecommendationItem(
    imageUrl: 'assets/images/recommend2.jpg',
    category: 'Sports',
    title: 'Le Burundi réaffirme son soutien à l\'intégrité territoriale du ...',
    source: 'MAws',
    date: 'Apr 15, 2025',
  ),
  RecommendationItem(
    imageUrl: 'assets/images/recommend3.jpg',
    category: 'Sport',
    title: 'Exciting Match Ends in a Draw After Last Minute Goal',
    source: 'Sports Today',
    date: 'Apr 16, 2025',
  ),
  RecommendationItem(
    imageUrl: 'assets/images/recommend4.jpg',
    category: 'Politics',
    title: 'Le Burundi réaffirme son soutien à l\'intégrité territoriale du ...',
    source: 'Snrt News',
    date: 'Apr 14, 2025',
  ),
];


class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Define colors based on theme
    final Color itemBackgroundColor = isDark ? const Color(0xFF232323) : Colors.white;
    final Color titleTextColor = isDark ? Colors.white : Colors.black;
    final Color subtitleColor = isDark ? Colors.grey[400]! : Colors.grey[600]!;
    final Color categoryColor = isDark ? Colors.grey[400]! : Colors.grey[600]!;
    final Color recommendedTitleColor = isDark ? Colors.white : Colors.black;

    // Define image size and card corner radius
    const double imageSize = 115.0;
    const double cardBorderRadius = 12.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Text(
            'Recommended',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: recommendedTitleColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendationMockData.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = recommendationMockData[index];
              return Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image container
                    Container(
                      width: 110,
                      height: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Text Block - Expanded to take remaining space, with its own padding
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,  // Space between image and text
                          right: 12.0, // Space from text to right edge of card
                          top: 8.0,    // Space from text to top edge of card (within its bounds)
                          bottom: 8.0, // Space from text to bottom edge of card (within its bounds)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center, // Vertically center text content
                          children: [
                            Text(
                              item.category,
                              style: TextStyle(
                                color: categoryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.title,
                              style: TextStyle(
                                color: titleTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    item.source,
                                    style: TextStyle(
                                      color: subtitleColor,
                                      fontSize: 13,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: subtitleColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  item.date,
                                  style: TextStyle(
                                    color: subtitleColor,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// To use this in a screen:
// 1. Make sure you have actual images in your assets folder (e.g., 'assets/images/recommend1.jpg')
//    and update the paths in `recommendationMockData`.
// 2. Add the assets folder to your pubspec.yaml:
// flutter:
//   assets:
//     - assets/images/
// 3. Then, in your screen's build method:
// Scaffold(
//   backgroundColor: Colors.black, // For dark theme, to match the desired look
//   body: SafeArea(
//     child: SingleChildScrollView( // If the content might overflow screen height
//       child: RecommendedSection(),
//     ),
//   ),
// );

