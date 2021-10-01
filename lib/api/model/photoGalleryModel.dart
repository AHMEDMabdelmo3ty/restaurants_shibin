
class photoGalleryModel{
  String imageurl;

  photoGalleryModel(this.imageurl);
  photoGalleryModel.fromjsen(Map<String,dynamic> map){
    this.imageurl=map['url'];
  }

}