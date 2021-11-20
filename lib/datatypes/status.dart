enum Status {
  fine,
  help
}

extension StatusExtension on Status {
  String get string {
    switch (this) {
      case Status.fine: return "I'm fine";
      case Status.help: return 'I need help';
      default: return "";
    }
  }

  int get value {
    switch (this) {
      case Status.fine: return 0;
      case Status.help: return 1;
      default: return -1;
    }
  }
}