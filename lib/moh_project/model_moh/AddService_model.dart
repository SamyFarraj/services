
class addservice {
String name;
String street;
String IsActive;
String id;
///
///
/// الموديل رح يحملي كل الدااتا تبعي
///
///
addservice({
required this.street,
required this.name,
required this.IsActive,
required this.id,
});

////
///
/// يستخدم ال الفروم جيسن لما بدي جيب من الباك
///
///
/// وبستخدم تو جيسن لما بدي ابعت للباك ؟ ليش؟
/// لانو انا عم شفر للجيسون واببعت الو
/// نقطة انتهى
/// نقطى على السطر
///
///
  addservice fromJson(Map<String, dynamic> json){
return addservice(
id: json['id'],
street: json['street'],
name: json['name'],
IsActive: json['IsActive'],
);
}

Map<String, dynamic> toJson(addservice addservice) {
return {
'id' : addservice.id,
'name' : addservice.name,
'street' : addservice.street,
'IsActive' : addservice.IsActive,
};
}
}