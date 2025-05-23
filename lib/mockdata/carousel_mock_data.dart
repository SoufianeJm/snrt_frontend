class CarouselItem {
  final String title;
  final String imageUrl;
  final String exploreUrl;

  CarouselItem({
    required this.title,
    required this.imageUrl,
    required this.exploreUrl,
  });
}

final List<CarouselItem> carouselMockData = [
  CarouselItem(
    title: 'Ala ghafla',
    imageUrl: 'assets/images/trending1.jpg',
    exploreUrl: 'https://example.com',
  ),
  CarouselItem(
    title: 'Moroccan Movie',
    imageUrl: 'assets/images/trending2.jpg',
    exploreUrl: 'https://example.com',
  ),
  CarouselItem(
    title: 'Cultural Event',
    imageUrl: 'assets/images/trending3.jpg',
    exploreUrl: 'https://example.com',
  ),
]; 