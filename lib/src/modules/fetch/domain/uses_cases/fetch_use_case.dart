import 'package:either_dart/either.dart';

import '../../../../core/errors/failure.dart';
import '../../infra/implementations.dart';
import '../models/model_user.dart';

class FetchUseCase {
  final IFetchRepository fetchRepository;
  FetchUseCase({
    required this.fetchRepository,
  });

  Future<Either<Failure, List<FetchModel>>> call(String text) async {
    try {
      final response = await fetchRepository.fetchGitHubUsers(text);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
