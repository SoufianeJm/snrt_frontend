import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../mockdata/carousel_mock_data.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          // Gradient overlay
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    AppColors.alwaysBlack.withOpacity(0.8),
                                    AppColors.alwaysBlack.withOpacity(0.0),
                                  ],
                                  stops: const [0.0, 0.9],
                                ),
                              ),
                            ),
                          ),
                          // Content overlay
                          Positioned(
                            left: 20,
                            bottom: 20,
                            right: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    item.title,
                                    style: textStyles.headlineMedium.copyWith(
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: colors.textPrimaryHeader,
                                    shape: const StadiumBorder(),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
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