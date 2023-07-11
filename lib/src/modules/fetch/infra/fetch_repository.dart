import '../../../core/errors/failure.dart';
import '../domain/models/model_user.dart';
import '../external/data/github_datasouce.dart';
import 'implementations.dart';

class FetchRepository extends IFetchRepository {
  final IDataSource dataSource;

  FetchRepository(this.dataSource);

  @override
  Future<List<FetchModel>> fetchGitHubUsers(String text) async {
    try {
      final response = await dataSource.fetch(text);

      return response;
    } catch (e, stackTrace) {
      throw Failure(message: e.toString(), stackTrace: stackTrace);
    }
  }
}
