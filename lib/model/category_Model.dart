class CategoryData {
  String? id;
  String? category;
  CategoryData();
  CategoryData.frommap(Map<String, dynamic> value) {
    id = value['id'];
    category = value['category'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
    };
  }
}
