import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/provider/news_provider.dart';
import 'package:gap/gap.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({super.key, required this.getIndex});
  final int getIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getDetailedData = ref.watch(newsProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'News Page Derail',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: getDetailedData.when(
        data: (data) => Column(
          children: [
            Image.network(
              data[getIndex].urlToImage.toString(),
            ),
            const Gap(60),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(data[getIndex].title.toString(),
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  const Gap(20),
                  SelectableText(
                    data[getIndex].description.toString(),
                    style: GoogleFonts.amiko(
                      fontSize: 18,
                    ),
                  ),
                  const Gap(20),
                  SelectableText(
                    data[getIndex].content.toString(),
                    style: GoogleFonts.amiko(
                      fontSize: 18,
                    ),
                  ),
                  const Gap(20),
                  SelectableText(
                    data[getIndex].publishedAt.toString(),
                    style: GoogleFonts.amiko(
                      fontSize: 14,
                    ),
                  ),
                  SelectableText(
                    data[getIndex].author.toString(),
                    style: GoogleFonts.getFont(
                      'Caveat',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
