part of 'digital_library.dart';

class CreateUserVariablesBuilder {
  String name;
  String email;

  final FirebaseDataConnect _dataConnect;
  CreateUserVariablesBuilder(this._dataConnect, {required  this.name,required  this.email,});
  Deserializer<CreateUserData> dataDeserializer = (dynamic json)  => CreateUserData.fromJson(jsonDecode(json));
  Serializer<CreateUserVariables> varsSerializer = (CreateUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateUserData, CreateUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateUserData, CreateUserVariables> ref() {
    CreateUserVariables vars= CreateUserVariables(name: name,email: email,);
    return _dataConnect.mutation("CreateUser", dataDeserializer, varsSerializer, vars);
  }
}

class CreateUserUserInsert {
  String id;
  CreateUserUserInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateUserUserInsert({
    required this.id,
  });
}

class CreateUserData {
  CreateUserUserInsert user_insert;
  CreateUserData.fromJson(dynamic json):
  
  user_insert = CreateUserUserInsert.fromJson(json['user_insert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_insert'] = user_insert.toJson();
    return json;
  }

  CreateUserData({
    required this.user_insert,
  });
}

class CreateUserVariables {
  String name;
  String email;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateUserVariables.fromJson(Map<String, dynamic> json):
  
  name = nativeFromJson<String>(json['name']),
  email = nativeFromJson<String>(json['email']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    json['email'] = nativeToJson<String>(email);
    return json;
  }

  CreateUserVariables({
    required this.name,
    required this.email,
  });
}

