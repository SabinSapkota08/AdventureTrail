import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    Category(
      name: 'Tent',
      imageUrl:
          'https://images.unsplash.com/photo-1571687949921-1306bfb24b72?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    ),
    Category(
        name: 'Slepping bag',
        imageUrl:
            'https://www.thermarest.com/blog/wp-content/uploads/2019/04/Sleeping-Bag-Temperature-Ratings-Ben-Matthews-1600x1000-1.jpg'),
    Category(
      name: 'Trekking bag',
      imageUrl:
          'https://media.istockphoto.com/id/1213236556/photo/hiking-backpack-travel-gear-on-mountain-items-include-hiking-for-travel.jpg?s=612x612&w=0&k=20&c=4M26gJ3fTE7qvgH_RoJuqKRFhuEB4zOJrVN90YKeEiE=',
    ),
  ];
}
