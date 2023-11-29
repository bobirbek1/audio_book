import 'dart:io';

import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadingPage extends StatefulWidget {
  final CacheManager dcm;
  final Box box;
  const ReadingPage({required this.dcm, required this.box, super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  Map<String, dynamic>? args;

  File? pdfFile;
  final pdfCtrl = PdfViewerController();

  @override
  void initState() {
    pdfCtrl.addListener(() {
      widget.box.put(args?["name"], pdfCtrl.pageNumber);
    });
    Future.microtask(() {
      widget.dcm
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
    pdfCtrl.jumpToPage(widget.box.get(args?["name"]) ?? 1);
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
                    controller: pdfCtrl,
                    pageLayoutMode: PdfPageLayoutMode.single,
                    scrollDirection: PdfScrollDirection.horizontal,
                  ),
      ),
    );
  }
}
