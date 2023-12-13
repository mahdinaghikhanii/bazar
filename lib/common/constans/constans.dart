class AppConstants {
  static const googleKEY = 'AIzaSyACdhxIVspjuvjmAUjvURemJ5AdQAp13Wg';
  static const String baseURL = 'https://www.googleapis.com/books/';
  static const String flutterBooks = 'v1/volumes?q=flutter&key=$googleKEY';
  static const String specialOfferBooks =
      'v1/volumes?q=books&filter=paid-ebooks&key=$googleKEY';
}
