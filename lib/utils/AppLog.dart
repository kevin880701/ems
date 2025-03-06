class AppLog {
  static const int VERBOSE = 2;
  static const int DEBUG = 3;
  static const int INFO = 4;
  static const int WARN = 5;
  static const int ERROR = 6;

  static int _currentLogLevel = VERBOSE;
  static const int _MAX_LOG_LENGTH = 700;

  static setLogLevel(int priority) {
    int newPriority = priority;
    if (newPriority <= VERBOSE) {
      newPriority = VERBOSE;
    } else if (newPriority >= ERROR) {
      newPriority = ERROR;
    }
    _currentLogLevel = newPriority;
  }

  static int getLogLevel() {
    AppLog.i("Current Log Level is " + _getPriorityText(_currentLogLevel));
    return _currentLogLevel;
  }

  static _log(int priority, String message) {
    if (_currentLogLevel <= priority) {
      String fullMessage = _getPriorityText(priority) + message;
      _splitLog(fullMessage);
    }
  }

  static void _splitLog(String message) {
    if (message.length > _MAX_LOG_LENGTH) {
      int startIndex = 0;
      while (startIndex < message.length) {
        int endIndex = (startIndex + _MAX_LOG_LENGTH < message.length)
            ? startIndex + _MAX_LOG_LENGTH
            : message.length;
        print(message.substring(startIndex, endIndex));
        startIndex = endIndex;
      }
    } else {
      print(message);
    }
  }

  static String _getPriorityText(int priority) {
    switch (priority) {
      case INFO:
        return "INFO|";
      case DEBUG:
        return "DEBUG|";
      case ERROR:
        return "ERROR⚠️|";
      case WARN:
        return "WARN⚠️|";
      case VERBOSE:
      default:
        return "";
    }
  }

  /// Print general logs
  static v(String message) {
    _log(VERBOSE, message);
  }

  /// Print info logs
  static i(String message) {
    _log(INFO, message);
  }

  /// Print debug logs
  static d(String message) {
    _log(DEBUG, message);
  }

  /// Print warning logs
  static w(String message) {
    _log(WARN, message);
  }

  /// Print error logs
  static e(String message) {
    _log(ERROR, message);
  }
}
