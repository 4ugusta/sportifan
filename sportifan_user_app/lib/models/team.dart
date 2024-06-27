class Team {
  String id;
  String name;
  String status;

  Team(this.id, this.name, this.status);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      json['id'] as String,
      json['name'] as String,
      json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
      };
}
