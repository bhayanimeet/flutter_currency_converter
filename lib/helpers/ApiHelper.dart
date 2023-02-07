import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Currency.dart';

class ApiHelper{
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<Currency?> fetchData({String from = "USD",dynamic amount = 1,String to = "INR"})async{

    String api = "https://api.exchangerate.host/convert?from=$from&to=$to&amount=$amount";

    http.Response result = await http.get(Uri.parse(api));

    if(result.statusCode == 200){
      Map decodedData = jsonDecode(result.body);
      Currency currency  = Currency.fromMap(data: decodedData);
      return currency;
    }
    return null;
  }
}