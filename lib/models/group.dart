import 'dart:convert';

class Group {
  /*
  {
  "code": Int,
  "type": String,
  "isActive": bool
}
   */
  final int code;
  final String type;
  final bool isActive;

  const Group({this.code, this.type, this.isActive});

  Group.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        type = json['type'],
        isActive = json['isActive'];

  @override
  bool operator ==(other) {
    if (other is! Group) return false;
    Group that = other;
    // isActive is a check value, not a key.
    return (code == that.code && type == that.type);
  }

  @override
  int get hashCode {
    int prime = 19;
    int hash = (prime * code);
    return hash + (prime * type.hashCode);
  }
}
