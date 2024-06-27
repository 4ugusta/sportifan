class Venue {
  String? id;
  String? venueName;
  String? venueRating;
  String? venueCharge;
  String? venueLocation;
  String? status;

  Venue(this.id, this.venueName, this.venueRating, this.venueCharge,
      this.venueLocation, this.status);

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      json['id'] as String?,
      json['venueName'] as String?,
      json['venueRating'] as String?,
      json['venueCharge'] as String?,
      json['venueLocation'] as String?,
      json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'venueName': venueName,
        'venueRating': venueRating,
        'venueCharge': venueCharge,
        'venueLocation': venueLocation,
        'status': status,
      };
}
