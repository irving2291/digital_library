part of 'digital_library.dart';

class GetUserReadingListVariablesBuilder {
  String userId;

  final FirebaseDataConnect _dataConnect;
  GetUserReadingListVariablesBuilder(this._dataConnect, {required  this.userId,});
  Deserializer<GetUserReadingListData> dataDeserializer = (dynamic json)  => GetUserReadingListData.fromJson(jsonDecode(json));
  Serializer<GetUserReadingListVariables> varsSerializer = (GetUserReadingListVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserReadingListData, GetUserReadingListVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetUserReadingListData, GetUserReadingListVariables> ref() {
    GetUserReadingListVariables vars= GetUserReadingListVariables(userId: userId,);
    return _dataConnect.query("GetUserReadingList", dataDeserializer, varsSerializer, vars);
  }
}

class GetUserReadingListReadingLists {
  String id;
  String status;
  Timestamp dateAdded;
  GetUserReadingListReadingListsBook book;
  GetUserReadingListReadingLists.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  status = nativeFromJson<String>(json['status']),
  dateAdded = Timestamp.fromJson(json['dateAdded']),
  book = GetUserReadingListReadingListsBook.fromJson(json['book']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['status'] = nativeToJson<String>(status);
    json['dateAdded'] = dateAdded.toJson();
    json['book'] = book.toJson();
    return json;
  }

  GetUserReadingListReadingLists({
    required this.id,
    required this.status,
    required this.dateAdded,
    required this.book,
  });
}

class GetUserReadingListReadingListsBook {
  String id;
  String title;
  String author;
  String? coverUrl;
  double? rating;
  GetUserReadingListReadingListsBook.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']),
  author = nativeFromJson<String>(json['author']),
  coverUrl = json['coverUrl'] == null ? null : nativeFromJson<String>(json['coverUrl']),
  rating = json['rating'] == null ? null : nativeFromJson<double>(json['rating']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['author'] = nativeToJson<String>(author);
    if (coverUrl != null) {
      json['coverUrl'] = nativeToJson<String?>(coverUrl);
    }
    if (rating != null) {
      json['rating'] = nativeToJson<double?>(rating);
    }
    return json;
  }

  GetUserReadingListReadingListsBook({
    required this.id,
    required this.title,
    required this.author,
    this.coverUrl,
    this.rating,
  });
}

class GetUserReadingListData {
  List<GetUserReadingListReadingLists> readingLists;
  GetUserReadingListData.fromJson(dynamic json):
  
  readingLists = (json['readingLists'] as List<dynamic>)
        .map((e) => GetUserReadingListReadingLists.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['readingLists'] = readingLists.map((e) => e.toJson()).toList();
    return json;
  }

  GetUserReadingListData({
    required this.readingLists,
  });
}

class GetUserReadingListVariables {
  String userId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetUserReadingListVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  GetUserReadingListVariables({
    required this.userId,
  });
}

