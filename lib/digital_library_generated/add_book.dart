part of 'digital_library.dart';

class AddBookVariablesBuilder {
  String title;
  String author;
  Optional<String> _isbn = Optional.optional(nativeFromJson, nativeToJson);
  List<String> genre;
  Optional<String> _synopsis = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _publicationYear = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _pages = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _coverUrl = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  AddBookVariablesBuilder isbn(String? t) {
   _isbn.value = t;
   return this;
  }
  AddBookVariablesBuilder synopsis(String? t) {
   _synopsis.value = t;
   return this;
  }
  AddBookVariablesBuilder publicationYear(int? t) {
   _publicationYear.value = t;
   return this;
  }
  AddBookVariablesBuilder pages(int? t) {
   _pages.value = t;
   return this;
  }
  AddBookVariablesBuilder coverUrl(String? t) {
   _coverUrl.value = t;
   return this;
  }

  AddBookVariablesBuilder(this._dataConnect, {required  this.title,required  this.author,required  this.genre,});
  Deserializer<AddBookData> dataDeserializer = (dynamic json)  => AddBookData.fromJson(jsonDecode(json));
  Serializer<AddBookVariables> varsSerializer = (AddBookVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddBookData, AddBookVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddBookData, AddBookVariables> ref() {
    AddBookVariables vars= AddBookVariables(title: title,author: author,isbn: _isbn,genre: genre,synopsis: _synopsis,publicationYear: _publicationYear,pages: _pages,coverUrl: _coverUrl,);
    return _dataConnect.mutation("AddBook", dataDeserializer, varsSerializer, vars);
  }
}

class AddBookBookInsert {
  String id;
  AddBookBookInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  AddBookBookInsert({
    required this.id,
  });
}

class AddBookData {
  AddBookBookInsert book_insert;
  AddBookData.fromJson(dynamic json):
  
  book_insert = AddBookBookInsert.fromJson(json['book_insert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['book_insert'] = book_insert.toJson();
    return json;
  }

  AddBookData({
    required this.book_insert,
  });
}

class AddBookVariables {
  String title;
  String author;
  late Optional<String>isbn;
  List<String> genre;
  late Optional<String>synopsis;
  late Optional<int>publicationYear;
  late Optional<int>pages;
  late Optional<String>coverUrl;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddBookVariables.fromJson(Map<String, dynamic> json):
  
  title = nativeFromJson<String>(json['title']),
  author = nativeFromJson<String>(json['author']),
  genre = (json['genre'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList() {
  
  
  
  
    isbn = Optional.optional(nativeFromJson, nativeToJson);
    isbn.value = json['isbn'] == null ? null : nativeFromJson<String>(json['isbn']);
  
  
  
    synopsis = Optional.optional(nativeFromJson, nativeToJson);
    synopsis.value = json['synopsis'] == null ? null : nativeFromJson<String>(json['synopsis']);
  
  
    publicationYear = Optional.optional(nativeFromJson, nativeToJson);
    publicationYear.value = json['publicationYear'] == null ? null : nativeFromJson<int>(json['publicationYear']);
  
  
    pages = Optional.optional(nativeFromJson, nativeToJson);
    pages.value = json['pages'] == null ? null : nativeFromJson<int>(json['pages']);
  
  
    coverUrl = Optional.optional(nativeFromJson, nativeToJson);
    coverUrl.value = json['coverUrl'] == null ? null : nativeFromJson<String>(json['coverUrl']);
  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['title'] = nativeToJson<String>(title);
    json['author'] = nativeToJson<String>(author);
    if(isbn.state == OptionalState.set) {
      json['isbn'] = isbn.toJson();
    }
    json['genre'] = genre.map((e) => nativeToJson<String>(e)).toList();
    if(synopsis.state == OptionalState.set) {
      json['synopsis'] = synopsis.toJson();
    }
    if(publicationYear.state == OptionalState.set) {
      json['publicationYear'] = publicationYear.toJson();
    }
    if(pages.state == OptionalState.set) {
      json['pages'] = pages.toJson();
    }
    if(coverUrl.state == OptionalState.set) {
      json['coverUrl'] = coverUrl.toJson();
    }
    return json;
  }

  AddBookVariables({
    required this.title,
    required this.author,
    required this.isbn,
    required this.genre,
    required this.synopsis,
    required this.publicationYear,
    required this.pages,
    required this.coverUrl,
  });
}

