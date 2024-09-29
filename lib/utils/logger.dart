import 'package:logger/logger.dart';

logger(Type type) => Logger(printer: CustomPrinter(type.toString()));

class CustomPrinter extends LogPrinter {
  final String className;
  final PrettyPrinter _prettyPrinter = PrettyPrinter();

  CustomPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = _prettyPrinter.levelColors?[event.level];//TODO VERIFICAR
    final emoji = _prettyPrinter.levelEmojis?[event.level];//TODO VERIFICAR
    final message = event.message;

    //final color = PrettyPrinter.levelColors[event.level];
    //final emoji = PrettyPrinter.levelEmojis[event.level];
    //final message = event.message;

    return [color!('$emoji $className : $message')];
  }
}
