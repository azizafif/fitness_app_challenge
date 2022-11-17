import '../../../../api/exports.dart';
import '../models/home_model.dart';

class HomeServices extends RequestPerformer {
  FutureRequestResult<ExercisesListModel> getExercises({
    required String type,
    required String muscle,
    required String name,
  }) async {
    try {
      return Right(
        await performDecodingRequest(
            baseUrl: 'https://exercises-by-api-ninjas.p.rapidapi.com',
            paginated: false,
            loaderEnabled: false,
            method: RestfullMethods.get,
            path: '/v1/exercises',
            queryParameters: {"type": type, "muscle": muscle, "name": name},
            decodableModel: ExercisesListModel(),
            extraHeaders: {
              'X-RapidAPI-Key': '558dc1fcd6mshf43188794446c87p1e8fa4jsnf2f2f6f950bb',
              'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
            }),
      );
    } on DioError catch (e) {
      return Left(e);
    }
  }
}
