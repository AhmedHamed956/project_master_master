import 'model/product_data.dart';
import 'model/translations_model.dart';

class TabsDetailsModel {
  String? status;
  String? message;
  List<TabsData>? data;

  TabsDetailsModel({this.status, this.message, this.data});

  TabsDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TabsData>[];
      json['data'].forEach((v) {
        data!.add(TabsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TabsData {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<ProductData>? sameSubCategoryProducts;
  List<Translations>? translations;

  TabsData(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.sameSubCategoryProducts,
      this.translations});

  TabsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    if (json['same_sub_category_products'] != null) {
      sameSubCategoryProducts = <ProductData>[];
      json['same_sub_category_products'].forEach((v) {
        sameSubCategoryProducts!.add(ProductData.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    if (sameSubCategoryProducts != null) {
      data['same_sub_category_products'] =
          sameSubCategoryProducts!.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
