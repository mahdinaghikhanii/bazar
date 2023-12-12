class AuthersModel {
  final String title;
  final String category;
  final String image;
  AuthersModel(
      {required this.title, required this.category, required this.image});
}

List<AuthersModel> authersList = [
  AuthersModel(
      title: "John Freeman", category: "Writer", image: "assets/1.png"),
  AuthersModel(
      title: "Tess Gunty", category: "Novelist", image: "assets/2.png"),
  AuthersModel(title: "Richard", category: "Writer", image: "assets/3.png")
];
