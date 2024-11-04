class getPrayerObject{
  Map<String , dynamic> data;
  getPrayerObject({required this.data});
  factory getPrayerObject.time(Map<String,dynamic> data){
    return getPrayerObject(data: data);
  }
}