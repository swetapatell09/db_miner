class categoryModel {
  String? name;
  int? id;

  categoryModel({this.name, this.id});
  factory categoryModel.mapToModel(Map m1) {
    return categoryModel(id: m1['id'], name: m1['category']);
  }
}
