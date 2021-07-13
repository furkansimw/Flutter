import 'package:quiz_app/Quesion.dart';

class Repositories {
  static var questions = [];
  var x = Question(0, "how are you", "good", "good", "good", "good", 1);
  void start() {
    questions = [x];
  }
}
