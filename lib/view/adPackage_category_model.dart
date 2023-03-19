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
      name: 'Annapurna Trek',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR9hiBuS-qYGYNUZ5zC3LFOvG8HzemttN94HIWF7hz&s',
    ),
    Category(
        name: 'Mardi Trek',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYhXJjPEReIrbD8qOki2u72bAHV28xPMvVBuYMeaP7&s'),
    Category(
      name: 'Langtang Trek',
      imageUrl:
          'https://cimages1.touristlink.com/data/cache/L/A/N/G/T/A/N/G/langtang-region-nepal_640_480.jpg',
    ),
  ];
}
