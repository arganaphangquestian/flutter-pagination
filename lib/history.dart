class History {
  final int id;
  final int status;

  History(this.id, this.status);

  factory History.fromJSON(Map<String, dynamic> json) {
    return History(json["trxId"] ?? -1, json["trxStatus"] ?? -1);
  }
}
