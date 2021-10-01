
import 'menuImagesModel.dart';
import 'photoGalleryModel.dart';

class resModel {
  String id;
  String name;
  String Items;
  String from;
  String to;
  String timedelivery;
  String location;
  String address;
  String mobileNumber;
  String coverPhoto;
  String profileimage;
  List<menuImagesModel> menuImages;
  List<photoGalleryModel> photoGallery;

  resModel(
      {this.id,
      this.name,
      this.Items,
      this.address,
      this.mobileNumber,
      this.coverPhoto,
      this.from,
      this.to,
      this.timedelivery,
      this.location,
      this.profileimage,
      this.menuImages,
      this.photoGallery});

  resModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.Items = json['Items'];
    this.from = json['from'];
    this.to = json['to'];
    this.timedelivery = json['timedelivery'];
    this.location = json['location'];
    this.address = json['address'];
    this.mobileNumber = json['mobileNumber'];
    this.coverPhoto = json['coverPhoto']['url'];
    this.profileimage = json['profileimage']['url'];
    _setmenuImages(json["menuImages"]);
    _setphotoGallery(json["photoGallery"]);
  }

  void _setmenuImages(List<dynamic> jesnComment) {
    this.menuImages = [];
    for (var image in jesnComment) {
      menuImages.add(menuImagesModel.fromjsen(image));
    }
  }

  void _setphotoGallery(List<dynamic> jesnComment) {
    this.photoGallery = [];
    for (var image in jesnComment) {
      photoGallery.add(photoGalleryModel.fromjsen(image));
    }
  }
}
