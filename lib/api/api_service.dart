import 'package:dio/dio.dart';
import 'package:quotes_api/api/config.dart';

import '../model/quotes_model.dart';

class ApiService
{

  static Future<Quotes> fetchQuotes()
  async {
    String endPoint = 'quotes';
    Dio dio = Config.getDio();
    Response response = await dio.get(endPoint);
    if(response.statusCode==200)
      {
        return Quotes.fromJson(response.data);
      }
    else
      {
        throw Exception("could not get data");
      }


  }


}