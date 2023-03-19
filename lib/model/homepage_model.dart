class HomepageModel {
  final String url;
  final String title;
  final String category;

  HomepageModel({
    required this.url,
    required this.title,
    required this.category,
  });
}

List<HomepageModel> wallpapers = [
  HomepageModel(
    url:
        "https://i.pinimg.com/550x/13/7d/76/137d760602f9169a2aca329e9f9e07c1.jpg",
    title: "Material Wallpaper",
    category: "Abstract art",
  ),
];
