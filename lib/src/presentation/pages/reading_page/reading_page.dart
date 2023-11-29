import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = context.getArguments<Map<String, dynamic>?>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
          icon: Assets.icons.arrowLeft.svg(),
        ),
        centerTitle: true,
        title: Text(
          args?["name"] ?? "Name not found",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
        child: args?["file_url"] == null
            ? const Center(
                child: Text("No book file url provided!"),
              )
            : SfPdfViewer.network(
                args!["file_url"]!,
                pageLayoutMode: PdfPageLayoutMode.single,
                scrollDirection: PdfScrollDirection.horizontal,
              ),
      ),
    );
  }
}
