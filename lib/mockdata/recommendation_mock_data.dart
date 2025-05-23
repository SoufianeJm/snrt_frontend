class RecommendationItem {
  final String imageUrl;
  final String category;
  final String title;
  final String source;
  final String date;

  RecommendationItem({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.source,
    required this.date,
  });
}

final List<RecommendationItem> recommendationMockData = [
  RecommendationItem(
    imageUrl: 'assets/images/recommend1.jpg',
    category: 'Categorie',
    title: 'Tenue à Rabat de la 1ère session de la Commission Mixte ...',
    source: 'Snrt News',
    date: 'Apr 14, 2025',
  ),
  RecommendationItem(
    imageUrl: 'assets/images/recommend2.jpg',
    category: 'Categorie',
    title: 'Le Burundi réaffirme son soutien à l\'intégrité territoriale du ...',
    source: 'Snrt News',
    date: 'Apr 14, 2025',
  ),
  RecommendationItem(
    imageUrl: 'assets/images/recommend3.jpg',
    category: 'Categorie',
    title: 'Le Burundi réaffirme son soutien à l\'intégrité territoriale du ...',
    source: 'Snrt News',
    date: 'Apr 14, 2025',
  ),
  RecommendationItem(
    imageUrl: 'assets/images/recommend4.jpg',
    category: 'Categorie',
    title: 'Le Burundi réaffirme son soutien à l\'intégrité territoriale du ...',
    source: 'Snrt News',
    date: 'Apr 14, 2025',
  ),
  RecommendationItem(
    imageUrl: 'assets/images/recommend5.jpg',
    category: 'Categorie',
    title: 'Nouveau projet de loi sur la culture au Maroc',
    source: 'Snrt News',
    date: 'Apr 15, 2025',
  ),
]; 