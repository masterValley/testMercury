import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mercury_app/Models/user.dart';

class UserApi {
  Future<User> createUser(Map body, String hotelId) async {
    return http.post(Uri.parse("https://us-central1-fb-api-d1076.cloudfunctions.net/clientes/postCliente/$hotelId"), body: body).then((http.Response response) {
      final int statuscode = response.statusCode;
      if (statuscode != 200) {
        throw new Exception("Error while fetching data");
      }
      return User.fromJson(json.decode(response.body));
    });
  }
  
}
