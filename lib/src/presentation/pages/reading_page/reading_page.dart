import 'dart:io';

import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  Map<String, dynamic>? args;

  File? pdfFile;

  @override
  void initState() {
    Future.microtask(() {
      DefaultCacheManager()
          .getSingleFile(args?["file_url"], key: args?["name"])
          .then((value) {
        setState(() {
          pdfFile = value;
        });
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    args = context.getArguments<Map<String, dynamic>?>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
            : pdfFile == null
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : SfPdfViewer.file(
                    pdfFile!,
                    pageLayoutMode: PdfPageLayoutMode.single,
                    scrollDirection: PdfScrollDirection.horizontal,
                  ),
      ),
    );
  }
}
