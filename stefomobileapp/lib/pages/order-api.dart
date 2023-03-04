import 'order.dart';
import 'package:http/http.dart' as http;

Future<List<Order>> fetchorder() async{

  String url = "http://localhost/steefo_api/vieworder.php";
  final response=await http.get(url as Uri);
  return orderFromJson(response.body);

}

class order {
}