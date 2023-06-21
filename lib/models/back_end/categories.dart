class Categoriess {
  List<Category>? categories;

  Categoriess({this.categories});

  Categoriess.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) { categories!.add(new Category.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? arName;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? image;
  List<SubCategoriess>? subCategoriess;

  Category({this.id, this.name, this.arName, this.createdAt, this.updatedAt, this.deletedAt, this.subCategoriess,this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['ar_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    image = json['imageurl'];
    if (json['sub_categories'] != null) {
      subCategoriess = <SubCategoriess>[];
      json['sub_categories'].forEach((v) { subCategoriess!.add(new SubCategoriess.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ar_name'] = this.arName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.subCategoriess != null) {
      data['sub_categories'] = this.subCategoriess!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoriess {
  int? id;
  String? name;
  String? arName;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  SubCategoriess({this.id, this.name, this.arName, this.categoryId, this.createdAt, this.updatedAt, this.deletedAt});

  SubCategoriess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['ar_name'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ar_name'] = this.arName;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}