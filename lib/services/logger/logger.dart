import 'package:logger/logger.dart';

class LoggerService{
  final Logger logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: false,
      )
  );

  // try this out for demo
  void demo(){
    logger.v('Log a verbose message');
    logger.d('Log a debug message');
    logger.i('Log a info message');
    logger.w('Log a warning message');
    logger.e('Log a error message');
    logger.wtf('Log a wtf message');
  }
}