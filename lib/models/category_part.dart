class CategoryPart {
  String name;
  String imgName;
  bool isSelected;

  CategoryPart({
    required this.name,
    required this.imgName,
    this.isSelected = false,
  });

  factory CategoryPart.fromJson(Map<String, dynamic> json) {
    return CategoryPart(
      name: json['name'],
      imgName: json['imgName'],
      isSelected: json['isSelected'],
    );
  }

  static List<CategoryPart> fromJsonList(List<dynamic> jsonList) {
    List<CategoryPart> parts = [];

    for (var item in jsonList) {
      parts.add(CategoryPart.fromJson(item));
    }

    return parts;
  }
}
