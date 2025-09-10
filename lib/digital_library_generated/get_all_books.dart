part of 'digital_library.dart';

class GetAllBooksVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetAllBooksVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllBooksData> dataDeserializer = (dynamic json)  => GetAllBooksData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllBooksData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetAllBooksData, void> ref() {
    
    return _dataConnect.query("GetAllBooks", dataDeserializer, emptySerializer, null);
  }
}

class GetAllBooksBooks {
  String id;
  String title;
  String author;
  List<String> genre;
  String? synopsis;
  int? publicationYear;
  double? rating;
  String? coverUrl;
  GetAllBooksBooks.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']),
  author = nativeFromJson<String>(json['author']),
  genre = (json['genre'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList(),
  synopsis = json['synopsis'] == null ? null : nativeFromJson<String>(json['synopsis']),
  publicationYear = json['publicationYear'] == null ? null : nativeFromJson<int>(json['publicationYear']),
  rating = json['rating'] == null ? null : nativeFromJson<double>(json['rating']),
  coverUrl = json['coverUrl'] == null ? null : nativeFromJson<String>(json['coverUrl']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['author'] = nativeToJson<String>(author);
    json['genre'] = genre.map((e) => nativeToJson<String>(e)).toList();
    if (synopsis != null) {
      json['synopsis'] = nativeToJson<String?>(synopsis);
    }
    if (publicationYear != null) {
      json['publicationYear'] = nativeToJson<int?>(publicationYear);
    }
    if (rating != null) {
      json['rating'] = nativeToJson<double?>(rating);
    }
    if (coverUrl != null) {
      json['coverUrl'] = nativeToJson<String?>(coverUrl);
    }
    return json;
  }

  GetAllBooksBooks({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    this.synopsis,
    this.publicationYear,
    this.rating,
    this.coverUrl,
  });
}

class GetAllBooksData {
  List<GetAllBooksBooks> books;
  GetAllBooksData.fromJson(dynamic json):
  
  books = (json['books'] as List<dynamic>)
        .map((e) => GetAllBooksBooks.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['books'] = books.map((e) => e.toJson()).toList();
    return json;
  }

  GetAllBooksData({
    required this.books,
  });
}

