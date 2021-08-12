class PackageInfoBean {
  late String _appName;
  late String _packageName;
  late String _version;
  late String _buildNumber;


  String get appName => _appName;
  String get packageName => _packageName;
  set appName(String value) {
    _appName = value;
  }

  set packageName(String value) {
    _packageName = value;
  }

  String get version => _version;

  set version(String value) {
    _version = value;
  }

  String get buildNumber => _buildNumber;

  set buildNumber(String value) {
    _buildNumber = value;
  }
}
