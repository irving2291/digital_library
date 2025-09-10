part of 'digital_library.dart';

class AddToReadingListVariablesBuilder {
  String userId;
  String bookId;
  String status;

  final FirebaseDataConnect _dataConnect;
  AddToReadingListVariablesBuilder(this._dataConnect, {required  this.userId,required  this.bookId,required  this.status,});
  Deserializer<AddToReadingListData> dataDeserializer = (dynamic json)  => AddToReadingListData.fromJson(jsonDecode(json));
  Serializer<AddToReadingListVariables> varsSerializer = (AddToReadingListVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddToReadingListData, AddToReadingListVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddToReadingListData, AddToReadingListVariables> ref() {
    AddToReadingListVariables vars= AddToReadingListVariables(userId: userId,bookId: bookId,status: status,);
    return _dataConnect.mutation("AddToReadingList", dataDeserializer, varsSerializer, vars);
  }
}

class AddToReadingListReadingListInsert {
  String id;
  AddToReadingListReadingListInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  AddToReadingListReadingListInsert({
    required this.id,
  });
}

class AddToReadingListData {
  AddToReadingListReadingListInsert readingList_insert;
  AddToReadingListData.fromJson(dynamic json):
  
  readingList_insert = AddToReadingListReadingListInsert.fromJson(json['readingList_insert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['readingList_insert'] = readingList_insert.toJson();
    return json;
  }

  AddToReadingListData({
    required this.readingList_insert,
  });
}

class AddToReadingListVariables {
  String userId;
  String bookId;
  String status;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddToReadingListVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']),
  bookId = nativeFromJson<String>(json['bookId']),
  status = nativeFromJson<String>(json['status']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['bookId'] = nativeToJson<String>(bookId);
    json['status'] = nativeToJson<String>(status);
    return json;
  }

  AddToReadingListVariables({
    required this.userId,
    required this.bookId,
    required this.status,
  });
}

