part of 'digital_library.dart';

class SearchBooksVariablesBuilder {
  String searchTerm;

  final FirebaseDataConnect _dataConnect;
  SearchBooksVariablesBuilder(this._dataConnect, {required  this.searchTerm,});
  Deserializer<SearchBooksData> dataDeserializer = (dynamic json)  => SearchBooksData.fromJson(jsonDecode(json));
  Serializer<SearchBooksVariables> varsSerializer = (SearchBooksVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<SearchBooksData, SearchBooksVariables>> execute() {
    return ref().execute();
  }

  QueryRef<SearchBooksData, SearchBooksVariables> ref() {
    SearchBooksVariables vars= SearchBooksVariables(searchTerm: searchTerm,);
    return _dataConnect.query("SearchBooks", dataDeserializer, varsSerializer, vars);
  }
}

class SearchBooksBooks {
  String id;
  String title;
  String author;
  List<String> genre;
  String? synopsis;
  double? rating;
  String? coverUrl;
  SearchBooksBooks.fromJson(dynamic json):
  
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

  SearchBooksBooks({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    this.synopsis,
    this.rating,
    this.coverUrl,
  });
}

class SearchBooksData {
  List<SearchBooksBooks> books;
  SearchBooksData.fromJson(dynamic json):
  
  books = (json['books'] as List<dynamic>)
        .map((e) => SearchBooksBooks.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['books'] = books.map((e) => e.toJson()).toList();
    return json;
  }

  SearchBooksData({
    required this.books,
  });
}

class SearchBooksVariables {
  String searchTerm;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SearchBooksVariables.fromJson(Map<String, dynamic> json):
  
  searchTerm = nativeFromJson<String>(json['searchTerm']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['searchTerm'] = nativeToJson<String>(searchTerm);
    return json;
  }

  SearchBooksVariables({
    required this.searchTerm,
  });
}

