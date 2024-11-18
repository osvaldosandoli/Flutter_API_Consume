import 'package:get/get.dart';
import '../../domain/hint.dart';
import '../../service/request.service.dart';

class HintController extends GetxController {
  final _requestService = RequestService();
  Rx<List<Hint>> hints = Rx([]);
  Rx<bool> loading = Rx(false);

  HintController();

 Future<void> fetchHints() async {
    loading.value = true;
    hints.value = await _requestService.readHintsService();
    loading.value = false;
  }

  Future<bool> createHint({
    required String category,
    required String title,
    required String student,
    required String description,
  }) async {
    final hint = Hint(category: category, title: title, student: student, description: description);
    return  await _requestService.createHintService(hint);
  }
}
