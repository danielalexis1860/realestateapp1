class Property {
  final String id;
  final String title;
  final String description;
  final String location;
  final double price;
  final List<String> images;
  final int bedrooms;
  final int bathrooms;
  final bool isStudentOnly;
  final bool wifiIncluded;
  final bool electricityIncluded;
  final bool waterIncluded;
  final bool furnished;
  final String landlordName;
  final double rating;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.images,
    required this.bedrooms,
    required this.bathrooms,
    required this.isStudentOnly,
    required this.wifiIncluded,
    required this.electricityIncluded,
    required this.waterIncluded,
    required this.furnished,
    required this.landlordName,
    required this.rating,
  });
}
