import '../domain/models/model_user.dart';

abstract class IFetchRepository {
  Future<List<FetchModel>> fetchGitHubUsers(String text);
}
