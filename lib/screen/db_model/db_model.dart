class dbModel {
  String? name, quotes, author;
  int? id;

  dbModel({this.name, this.quotes, this.author, this.id});
  factory dbModel.mapToModel(Map m1) {
    return dbModel(
        id: m1['id'],
        author: m1['author'],
        name: m1['name'],
        quotes: m1['quotes']);
  }
}
