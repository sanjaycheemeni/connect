import 'package:http/http.dart' as http;

var courseList = [
  {"name": "Ethical hacking", "no": "205"},
  {"name": "Network Security", "no": "43"},
  {"name": "Cyber Security Analyst", "no": "135"},
  {"name": "Network Engineering ", "no": "6"},
];

// get images http://ebook.caddcentre.org:88/assets/book/4/105/files/mobile/1.jpg
getBook(String id) async {
  String url_prefix =
      "http://ebook.caddcentre.org:88/assets/book/4/" + id + "/files/mobile/";
  var imageList = [];
  int pageno = 1;
  var image_url = "";

  while (true) {
    image_url = url_prefix + pageno.toString() + ".jpg";
    print(image_url);
    if (await isUrlAvailable(image_url))
      imageList.add(image_url);
    else
      break;
  }

  return imageList;
}

Future<bool> isUrlAvailable(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}
