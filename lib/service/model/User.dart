class User {
  int _albumId;
  int _id;
  String _title;
  String _url;
  String _thumbnailUrl;


  User(this._albumId, this._id, this._title, this._url, this._thumbnailUrl);

  int get albumId => _albumId;

  set albumId(int value) {
    _albumId = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get thumbnailUrl => _thumbnailUrl;

  set thumbnailUrl(String value) {
    _thumbnailUrl = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}
