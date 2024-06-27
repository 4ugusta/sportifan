class Profile {
    constructor(id,bio, username, emailId, phoneNumber, userId,
         status ) {
            this.id = id;
            this.bio = bio
            this.username = username
            this.emailId =emailId
            this.phoneNumber = phoneNumber
            this.userId=userId
            this.status = status;
    }
}

module.exports = Profile;