import 'package:newsapp/services/fetch_data.dart';
import 'package:riverpod/riverpod.dart';

final newsProvider = FutureProvider((ref) async {
  return ref.watch(newsProviderservices).fetchNewsData();
});
