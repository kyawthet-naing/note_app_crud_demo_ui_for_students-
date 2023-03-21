import 'package:note_crud/data/models/response_model.dart';
import 'package:note_crud/data/network/base_network.dart';
import 'package:note_crud/data/models/note_model.dart';
import 'package:note_crud/data/utils/const.dart';

class NoteApi {
  static const String _url = "${Const.apiURL}/note-app";

  static Future<ResponseModel> getAll() async {
    ResponseModel resp = await BaseNetwork.get(url: _url);
    if (resp.status!) {
      var notes = resp.data as List<dynamic>;
      resp.data = notes.map((e) => NoteModel.fromJson(e)).toList();
    }
    return resp;
  }

  static Future<ResponseModel> create({required NoteModel note}) async {
    ResponseModel resp = await BaseNetwork.post(
      url: _url,
      body: note.toJson(),
    );
    if (resp.status!) {
      resp.data = NoteModel.fromJson(resp.data);
    }
    return resp;
  }

  static Future<ResponseModel> update({required NoteModel note}) async {
    ResponseModel resp = await BaseNetwork.put(
      url: '$_url/${note.id}',
      body: note.toJson(),
    );
    if (resp.status!) {
      resp.data = NoteModel.fromJson(resp.data);
    }
    return resp;
  }

  static Future<ResponseModel> delete({required String id}) async {
    return await BaseNetwork.delete(url: '$_url/$id');
  }

  static Future<ResponseModel> detail({required String id}) async {
    ResponseModel resp = await BaseNetwork.get(url: '$_url/$id');
    if (resp.status!) {
      resp.data = NoteModel.fromJson(resp.data);
    }
    return resp;
  }
}
