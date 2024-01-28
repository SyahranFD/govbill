import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:http/http.dart' as http;

class ApiHistoryController {
  static final box = GetStorage();

  
  static Future fetchHistory() async {
    print('fetch history dijalankan');
    try {
      var response = await http.get(Uri.parse('${url}/history-tagihan/show-all'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        final content = json.decode(response.body)['data'];
        print('berhasil fetch history');
        return content;

        // listHistory.forEach((tagihan) {
        //   print(tagihan.toJson());
        // });
      } else {
                print(json.decode(response.body));
        return "error";

      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

}