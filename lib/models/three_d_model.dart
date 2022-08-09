class ThreeDModel {
  String? method;
  String? url;
  String? redirectUrl;
  List<String>? mechanism;
  Map<String, dynamic>? payload;

  ThreeDModel(
      {this.method,
        this.url,
        this.redirectUrl,
        this.mechanism,
        this.payload});

  ThreeDModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    url = json['url'];
    redirectUrl = json['redirect_url'];
    if (json['mechanism'] != null) {
      mechanism = [];
      json['mechanism'].forEach((v) {
        mechanism!.add(v);
      });
    }

    payload = json['payload'] ?? {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['method'] = method;
    data['url'] = url;
    data['redirect_url'] = redirectUrl;
    if (mechanism != null) {
      data['mechanism'] = mechanism!.toList();
    }
    data['payload'] = payload;

    return data;
  }

}