import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/data/models/category_model/category_model.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/category_view_model.dart';
import 'package:audio_book/src/presentation/view_models/search_books_veiw_model.dart';
import 'package:audio_book/src/presentation/widgets/book_item.dart';
import 'package:audio_book/src/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Explore",
              style: Theme.of(context).textStyles.semiBold24,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: context.read<SearchBooksViewModel>().searchTextCtrl,
              decoration: const InputDecoration(
                hintText: "Search books or authors...",
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Recommended Categories",
              style: Theme.of(context).textStyles.medium16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          _RecommendedCategories(
              categories:
                  context.read<CategoryViewModel>().getRecommendedCategories()),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Latest Search",
              style: Theme.of(context).textStyles.medium16,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const _LatestSearchBooks(
            books: [],
          ),
        ],
      ),
    );
  }
}

class _LatestSearchBooks extends StatelessWidget {
  final List<BookModel> books;
  const _LatestSearchBooks({required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          BookItem(
            title: "Some Title",
            imageUrl: "",
            width: 160,
            height: 160,
          ),
          SizedBox(
            width: 16,
          ),
          BookItem(
            title: "Some Title",
            imageUrl: "",
            width: 160,
            height: 160,
          ),
          SizedBox(
            width: 16,
          ),
          BookItem(
            title: "Some Title",
            imageUrl: "",
            width: 160,
            height: 160,
          ),
          SizedBox(
            width: 16,
          ),
          BookItem(
            title: "Some Title",
            imageUrl: "",
            width: 160,
            height: 160,
          ),
        ],
      ),
    );
  }
}

class _RecommendedCategories extends StatelessWidget {
  final List<CategoryModel> categories;
  const _RecommendedCategories({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 10 / 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          categories.length > 4 ? 4 : categories.length,
          (index) => CategoryItem(
            text: categories[index].name,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
