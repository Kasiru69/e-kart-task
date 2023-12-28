import 'package:http/http.dart' as http;
fetchdata(String url)async{
  http.Response res=await http.get(Uri.parse(url));
  return res.body;
}