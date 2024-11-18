import 'package:aula13_checkpoint3/domain/hint.dart';
import 'package:dio/dio.dart';

class RequestService {
  final dio = Dio();
  final host = "https://gdapp.com.br/api/sustainable-tips";

  Future<List<Hint>> readHintsService() async {
    try {
      final response = await dio.get('$host');
      return (response.data as List)
          .map((json) => Hint.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> createHintService(Hint hint) async {
    final data = {'hint': hint.toJson()};

    try {
      final response = await dio.post(
        '$host',
        data: data,
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
