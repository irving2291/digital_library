part of 'digital_library.dart';

class SeedBooksVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  SeedBooksVariablesBuilder(this._dataConnect, );
  Deserializer<SeedBooksData> dataDeserializer = (dynamic json)  => SeedBooksData.fromJson(jsonDecode(json));
  
  Future<OperationResult<SeedBooksData, void>> execute() {
    return ref().execute();
  }

  MutationRef<SeedBooksData, void> ref() {
    
    return _dataConnect.mutation("SeedBooks", dataDeserializer, emptySerializer, null);
  }
}

class SeedBooksBookInsertMany {
  String id;
  SeedBooksBookInsertMany.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  SeedBooksBookInsertMany({
    required this.id,
  });
}

class SeedBooksData {
  List<SeedBooksBookInsertMany> book_insertMany;
  SeedBooksData.fromJson(dynamic json):
  
  book_insertMany = (json['book_insertMany'] as List<dynamic>)
        .map((e) => SeedBooksBookInsertMany.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['book_insertMany'] = book_insertMany.map((e) => e.toJson()).toList();
    return json;
  }

  SeedBooksData({
    required this.book_insertMany,
  });
}

