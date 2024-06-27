class Venue {
  constructor(id, venueName, venueRating, venueCharge, venueLocation, status) {
    this.id = id;
    this.venueName = venueName;
    this.venueCharge = venueCharge;
    this.venueLocation = venueLocation;
    this.venueRating = venueRating;
    this.status = status;
  }
}

module.exports = Venue;
