class AssemblyModel {
  int id;
  String title;
  String status;
  String inserted;
  int insertedBy;
  dynamic modified;
  dynamic modifiedBy;

  AssemblyModel(
      {this.id,
        this.title,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy});

  AssemblyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['inserted'] = inserted;
    data['inserted_by'] = insertedBy;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    return data;
  }
}