class HomeModel {
  String? name, images;
  int? id;
  List<dynamic>? quotesList = [];
  List<dynamic>? authorList = [];
  List<dynamic>? imageList = [];

  HomeModel(
      {this.name,
      this.id,
      this.quotesList,
      this.authorList,
      this.imageList,
      this.images});
  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
        name: m1['name'],
        id: m1['id'],
        authorList: m1['author'],
        quotesList: m1['quotes'],
        imageList: m1['image'],
        images: m1['images']);
  }
}
