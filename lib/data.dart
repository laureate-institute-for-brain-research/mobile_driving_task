import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:async';
import 'dart:convert';

//String _serverURL = 'https://x0-29.psych.umn.edu/dend/posts';
//String _serverURL = 'https://tasks.laureateinstitute.org/api/driving/v1/posts';
String _serverURL =
    'https://lnpitest.northcentralus.cloudapp.azure.com/dend/posts';
//String _serverURL = 'https://lnpitask.med.umn.edu/dend/posts';
//String _serverURL = 'https://lnpitask.umn.edu/dend/posts';

@JsonSerializable(nullable: false)
Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    studycode: json['studycode'] as String,
    guid: json['guid'] as String,
    data_version: json['data_version'] as String,
    data: json['data'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'studycode': instance.studycode,
      'guid': instance.guid,
      'data_version': instance.data_version,
      'data': instance.data,
    };

class Data {
  final String studycode;
  final String guid;
  final String data;
  final String data_version;
  Data({
    this.studycode,
    this.guid,
    this.data_version,
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

Future<bool> createData(
    String studycode, String guid, Map dataList, String data_version) async {
  dynamic jsonData = JsonEncoder().convert(dataList);
  Data data = Data(
    studycode: studycode,
    guid: guid,
    data: jsonData,
    data_version: data_version,
  );
  String jsonUser = jsonEncode(data);

  try {
    final http.Response response = await http.post(
      _serverURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonUser,
    );

    if (response.statusCode == 200) {
      Data.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      return Future.value(true);
    } else {
      print(response.statusCode);
      return Future.value(false);
    }
  } catch (e) {
    print('Something went wrong');
    print(e);
    return Future.value(false);
  }
}
