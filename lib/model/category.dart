class Category {
  static String moviesId = 'movies';
  static String musicId = 'music';
  static String sportsId = 'sports';
  String id;
  late String title;
  late String image;

  Category({required this.id, required this.title, required this.image});

  Category.fromId({required this.id}) {
    // image = 'assets/images/$id.png';
    // title '$id';

    if (id == moviesId) {
      title = 'Movies';
      image = 'assets/images/movies.png';
    } else if (id == musicId) {
      title = 'Music';
      image = 'assets/images/music.png';
    } else if (id == sportsId) {
      title = 'Sports';
      image = 'assets/images/sports.png';
    }
  }

  static List<Category>getCategories(){
    return [
      Category.fromId(id: sportsId),
      Category.fromId(id: musicId),
      Category.fromId(id: moviesId),
    ];
  }
}
