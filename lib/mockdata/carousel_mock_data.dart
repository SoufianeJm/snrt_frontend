class CarouselItem {
  final String title;
  final String description;
  final String imageUrl;
  final String exploreUrl;

  CarouselItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.exploreUrl,
  });
}

final List<CarouselItem> carouselMockData = [
  CarouselItem(
    title: 'Ala ghafla',
    description: 'A Moroccan TV show about unexpected events.',
    imageUrl: 'assets/images/trending1.jpg',
    exploreUrl: 'https://example.com/ala-ghafla',
  ),
  CarouselItem(
    title: 'B.A.G',
    description: 'Award-winning Moroccan cinema experience.',
    imageUrl: 'assets/images/trending2.jpg',
    exploreUrl: 'https://example.com/moroccan-movie',
  ),
  CarouselItem(
    title: 'Ain Libra',
    description: 'Discover the best cultural events in Morocco.',
    imageUrl: 'assets/images/trending3.jpg',
    exploreUrl: 'https://example.com/cultural-event',
  ),
]; 