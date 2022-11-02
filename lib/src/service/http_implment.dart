import 'package:app_pokmon/src/constant/api_url.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'http_service.dart';

class HttpImplment implements HttpService {
  @override
  Future<Response> get<T>(String path) async {
    Uri url = Uri.parse('$urlbase/$path');
    http.Response response = await http.get(url);
    return response;
  }
}
