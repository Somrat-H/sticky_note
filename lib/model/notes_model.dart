class NotesModel {
  late String subject;
  NotesModel({required this.subject});
  NotesModel.fromJson(dynamic json) {
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subject'] = subject;
    return map;
  }
}
