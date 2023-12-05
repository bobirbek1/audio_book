import 'dart:io';

import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/view_models/library_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadingPage extends StatefulWidget {
  final CacheManager dcm;
  final Box box;
  const ReadingPage({required this.dcm, required this.box, super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  BookModel? book;

  File? pdfFile;
  final pdfCtrl = PdfViewerController();

  @override
  void initState() {
    pdfCtrl.addListener(() {
      widget.box.put(book?.name, pdfCtrl.pageNumber);
    });
    Future.microtask(() {
      if (context.mounted) {
        context.read<LibraryViewModel>().addBookToLibrary(book);
      }
      if (book?.fileUrl != null) {
        widget.dcm
            .getSingleFile(book?.fileUrl ?? "", key: book?.name)
            .then((value) {
          setState(() {
            pdfFile = value;
          });
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    book = context.getArguments<BookModel?>();
    pdfCtrl.jumpToPage(widget.box.get(book?.name) ?? 1);
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
          book?.name ?? "Name not found",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
        child: book?.fileUrl == null
            ? const Center(
                child: Text("No book file url provided!"),
              )
            : pdfFile == null
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Padding(
                    padding:
                        EdgeInsets.only(bottom: context.getSnackbarPadding()),
                    child: SfPdfViewer.file(
                      pdfFile!,
                      controller: pdfCtrl,
                      pageLayoutMode: PdfPageLayoutMode.single,
                      scrollDirection: PdfScrollDirection.horizontal,
                    ),
                  ),
      ),
    );
  }
}
