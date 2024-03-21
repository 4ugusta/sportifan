class Player {
  int id;
  String name;
  String role;
  String battingStyle;
  String bowlingStyle;
  String status;

  Player(this.id, this.name, this.role, this.battingStyle, this.bowlingStyle, this.status);

 
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      json['id'] as int,
      json['name'] as String,
      json['role'] as String,
      json['battingStyle'] as String,
      json['bowlingStyle'] as String,
      json['status'] as String,
    );
  }

  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'role': role,
    'battingStyle': battingStyle,
    'bowlingStyle': bowlingStyle,
    'status': status,
  };
}
