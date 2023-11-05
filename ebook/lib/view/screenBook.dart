import 'package:ebook/view/Widgets/ImageTile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../controller/CourseListController.dart';

// class Book extends StatefulWidget {
//   final String id;
//   const Book({super.key, required this.id});

//   @override
//   State<Book> createState() => _BookState();
// }

// class _BookState extends State<Book> {
//   var imageUrls = [];

//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     imageUrls = getBook(widget.id);
//     print(imageUrls);
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [Expanded(child: Text(imageUrls.toString()))],
//       )),
//     );
//   }
// }

class ImageListView extends StatefulWidget {
  final String id;

  ImageListView({required String this.id});

  @override
  _ImageListViewState createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  List<String> imageUrls = [];
  int imageIndex = 1;

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    while (true) {
      final imageUrl = "http://ebook.caddcentre.org:88/assets/book/4/" +
          widget.id.toString() +
          "/files/mobile/$imageIndex.jpg";

      final response = await http.head(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        setState(() {
          imageUrls.add(imageUrl);
          imageIndex++;
        });
      } else {
        break; // Stop loading when an unavailable image is encountered
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        final imageUrl = imageUrls[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(imageUrl),
        );
      },
    );
  }
}
