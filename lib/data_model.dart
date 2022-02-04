// Global class to store data, and paginated products fetched from RestApi and the type of data will be the parameter type of class
class Data<T> {
  final int statusCode;
  final String message;
  final T data;
  final _PageInfoModel pageInfo;

  const Data(
      {this.message = 'Bad request',
        this.data,
        this.statusCode = 400,
        this.pageInfo});

  factory Data.fromJson(Map<String, dynamic> json) {
    var jsonMessage = json['message'];
    String message = '';
    T _data;
    // if status Code is 200 then assign the data
    if (json['statusCode'] == 200) {
      _data = json['data'];
    }
    // if message is map then get the first string of map and show it
    if (jsonMessage is Map && jsonMessage.entries.length > 0) {
      message = jsonMessage.entries.first.value[0];
    } else if (jsonMessage is String) {
      message = jsonMessage;
    }

    return Data<T>(
        statusCode: json['statusCode'],
        message: message,
        data: _data,
        pageInfo: json['pagination'] != null
             new _PageInfoModel.fromJson(json['pagination'])
            : null);
  }

  // returns map of data class
  Map<String, dynamic> toJson() {
    return {
      'statusCode': this.statusCode,
      'message': this.message,
      'data': this.data,
      'pagination': this.pageInfo != null  this.pageInfo.toJson() : null
    };
  }

  // Copy with existing data
  Data<T> copyWith({int statusCode, String message, T data}) => Data<T>(
      data: data  this.data,
      message: message  this.message,
      statusCode: statusCode  this.statusCode);
}

// model contains pagination detail
class _PageInfoModel {
  final int currentPage;
  final int totalPage;
  final int totalItemCount;
  final int currentPageItemCount;

  const _PageInfoModel(
      {this.currentPage = 1,
        this.totalPage = 1,
        this.totalItemCount = 0,
        this.currentPageItemCount = 0});

  factory _PageInfoModel.fromJson(Map<String, dynamic> json) {
    return _PageInfoModel(
        currentPage: json['currentPage'],
        currentPageItemCount: json['currentPageItemCount'],
        totalItemCount: json['totalItemCount'],
        totalPage: json['totalPage']);
  }

  Map<String, dynamic> toJson() => {
    'currentPage': this.currentPage,
    'currentPageItemCount': this.currentPageItemCount,
    'totalItemCount': this.totalItemCount,
    'totalPage': this.totalPage
  };
}
