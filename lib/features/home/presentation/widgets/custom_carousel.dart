import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../mockdata/carousel_mock_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class CustomCarousel extends StatefulWidget {
  final List<CarouselItem> items;
  final double height;
  final Function(int)? onPageChanged;

  const CustomCarousel({
    super.key,
    required this.items,
    this.height = 200,
    this.onPageChanged,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colors = isDark ? AppColors.dark : AppColors.light;
    final textStyles = isDark ? AppTextStyles.dark : AppTextStyles.light;
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = 20.0;
    final availableWidth = screenWidth - (horizontalPadding * 2);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: widget.height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
                if (widget.onPageChanged != null) {
                  widget.onPageChanged!(index);
                }
              },
            ),
            items: widget.items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: availableWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            item.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: colors.surfaceBorder,
                                child: const Center(
                                  child: Icon(Icons.broken_image, color: Colors.grey),
                                ),
                              );
                            },
                          ),
                          // Left-to-right hard black gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                  Colors.transparent,
                                ],
                                stops: const [0.1, 0.3, 1, 1],
                              ),
                            ),
                          ),
                          // Content overlay (left-aligned)
                          Positioned(
                            left: 24,
                            top: 24,
                            bottom: 24,
                            right: availableWidth * 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: textStyles.bodyLarge.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.description,
                                      style: textStyles.bodyMedium.copyWith(
                                        color: Colors.white.withOpacity(0.85),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 36,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: colors.textPrimaryHeader,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      elevation: 0,
                                    ),
                                    onPressed: () => _launchUrl(item.exploreUrl),
                                    child: Text(
                                      'Explore Now',
                                      style: textStyles.bodySmall.copyWith(
                                        color: AppColors.alwaysBlack,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          // Animated dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.items.length, (index) {
              final bool isActive = index == _currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : colors.surfaceBorder.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
} 