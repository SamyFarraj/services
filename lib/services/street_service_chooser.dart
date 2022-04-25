//هاد الصف هو معلومات الخدمات يعني هون حددنا انو
// كل خدمة بتتكون
// 1-من اسم واللي هو title وانو مطلوب
//2- من List  خدمات وهي مو مطلوبة Optional
//لانو اخر حدمات متل ال Tower Crane
//ما بيكون جواها List
//طبعا بعد اخر تعديل طلبو الزبون صارت دايما مافي جواها شي
//وكل عنصر فيها صار عبارة عن Button بتاخد لصفحة OnHold
class ServiceChooser {
  final String title;
  final List<ServiceChooser> serviceChoosingList;

  const ServiceChooser({
    required this.title,
    this.serviceChoosingList = const [],
  });
}
