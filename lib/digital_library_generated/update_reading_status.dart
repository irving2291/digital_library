part of 'digital_library.dart';

class UpdateReadingStatusVariablesBuilder {
  String readingListId;
  String status;

  final FirebaseDataConnect _dataConnect;
  UpdateReadingStatusVariablesBuilder(this._dataConnect, {required  this.readingListId,required  this.status,});
  Deserializer<UpdateReadingStatusData> dataDeserializer = (dynamic json)  => UpdateReadingStatusData.fromJson(jsonDecode(json));
  Serializer<UpdateReadingStatusVariables> varsSerializer = (UpdateReadingStatusVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateReadingStatusData, UpdateReadingStatusVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateReadingStatusData, UpdateReadingStatusVariables> ref() {
    UpdateReadingStatusVariables vars= UpdateReadingStatusVariables(readingListId: readingListId,status: status,);
    return _dataConnect.mutation("UpdateReadingStatus", dataDeserializer, varsSerializer, vars);
  }
}

class UpdateReadingStatusReadingListUpdate {
  String id;
  UpdateReadingStatusReadingListUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateReadingStatusReadingListUpdate({
    required this.id,
  });
}

class UpdateReadingStatusData {
  UpdateReadingStatusReadingListUpdate? readingList_update;
  UpdateReadingStatusData.fromJson(dynamic json):
  
  readingList_update = json['readingList_update'] == null ? null : UpdateReadingStatusReadingListUpdate.fromJson(json['readingList_update']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (readingList_update != null) {
      json['readingList_update'] = readingList_update!.toJson();
    }
    return json;
  }

  UpdateReadingStatusData({
    this.readingList_update,
  });
}

class UpdateReadingStatusVariables {
  String readingListId;
  String status;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateReadingStatusVariables.fromJson(Map<String, dynamic> json):
  
  readingListId = nativeFromJson<String>(json['readingListId']),
  status = nativeFromJson<String>(json['status']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['readingListId'] = nativeToJson<String>(readingListId);
    json['status'] = nativeToJson<String>(status);
    return json;
  }

  UpdateReadingStatusVariables({
    required this.readingListId,
    required this.status,
  });
}

