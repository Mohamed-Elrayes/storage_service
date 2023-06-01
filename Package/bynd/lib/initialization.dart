interface class InitializeAble {
  void initialize(){}
}


class Initializer {
  List<InitializeAble> classes = [];

  void registerClass(InitializeAble classInstance) {
    classes.add(classInstance);
  }

  void initializeAll() {
    for (var classInstance in classes) {
      classInstance.initialize();
    }
  }
}
