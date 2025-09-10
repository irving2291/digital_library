part of 'digital_library.dart';

class GetBooksByGenreVariablesBuilder {
  String genre;

  final FirebaseDataConnect _dataConnect;
  GetBooksByGenreVariablesBuilder(this._dataConnect, {required  this.genre,});
  Deserializer<GetBooksByGenreData> dataDeserializer = (dynamic json)  => GetBooksByGenreData.fromJson(jsonDecode(json));
  Serializer<GetBooksByGenreVariables> varsSerializer = (GetBooksByGenreVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetBooksByGenreData, GetBooksByGenreVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetBooksByGenreData, GetBooksByGenreVariables> ref() {
    GetBooksByGenreVariables vars= GetBooksByGenreVariables(genre: genre,);
    return _dataConnect.query("GetBooksByGenre", dataDeserializer, varsSerializer, vars);
  }
}

class GetBooksByGenreBooks {
  String id;
  String title;
  String author;
  List<String> genre;
  String? synopsis;
  double? rating;
  String? coverUrl;
  GetBooksByGenreBooks.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']),
  author = nativeFromJson<String>(json['author']),
  genre = (json['genre'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList(),
  synopsis = json['synopsis'] == null ? null : nativeFromJson<String>(json['synopsis']),
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
    if (rating != null) {
      json['rating'] = nativeToJson<double?>(rating);
    }
    if (coverUrl != null) {
      json['coverUrl'] = nativeToJson<String?>(coverUrl);
    }
    return json;
  }

  GetBooksByGenreBooks({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    this.synopsis,
    this.rating,
    this.coverUrl,
  });
}

class GetBooksByGenreData {
  List<GetBooksByGenreBooks> books;
  GetBooksByGenreData.fromJson(dynamic json):
  
  books = (json['books'] as List<dynamic>)
        .map((e) => GetBooksByGenreBooks.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['books'] = books.map((e) => e.toJson()).toList();
    return json;
  }

  GetBooksByGenreData({
    required this.books,
  });
}

class GetBooksByGenreVariables {
  String genre;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetBooksByGenreVariables.fromJson(Map<String, dynamic> json):
  
  genre = nativeFromJson<String>(json['genre']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['genre'] = nativeToJson<String>(genre);
    return json;
  }

  GetBooksByGenreVariables({
    required this.genre,
  });
}

