import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/models/model_user.dart';
import '../../../domain/uses_cases/fetch_use_case.dart';

class FetchStore extends Store<List<FetchModel>> {
  final FetchUseCase fetchUseCase;

  FetchStore({required this.fetchUseCase}) : super(<FetchModel>[]);

  void onSearch(String text) async {
    execute(() => fetchUseCase(text).then((value) => value.right),
        delay: const Duration(milliseconds: 1000));
  }
}
