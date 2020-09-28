import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  http.Client client;

  ApiClient(this.client);

  Future<String> fetchData() async {
      var res = await http.get('http://127.0.0.1:5000/api/street_class/');
      if(res.statusCode == 200){
        return json.decode(res.body);
      }
      else{
       return 'nope';
      }
  }
}