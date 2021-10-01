class menuImagesModel{
  String imageurl;

  menuImagesModel(this.imageurl);
  menuImagesModel.fromjsen(Map<String,dynamic> map){
    this.imageurl=map['url'];
  }

}