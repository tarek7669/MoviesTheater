class TicketsModel {
  num? id;
  num? price;
  num? userId;
  num? movieDateId;
  String? createdAt;
  List<ReservedSeats>? reservedSeats;
  User? user;
  MovieDate? movieDate;

  TicketsModel(
      {this.id,
        this.price,
        this.userId,
        this.movieDateId,
        this.createdAt,
        this.reservedSeats,
        this.user,
        this.movieDate});

  TicketsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    userId = json['userId'];
    movieDateId = json['movieDateId'];
    createdAt = json['createdAt'];
    if (json['reservedSeats'] != null) {
      reservedSeats = <ReservedSeats>[];
      json['reservedSeats'].forEach((v) {
        reservedSeats!.add(new ReservedSeats.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    movieDate = json['movieDate'] != null
        ? new MovieDate.fromJson(json['movieDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['userId'] = this.userId;
    data['movieDateId'] = this.movieDateId;
    data['createdAt'] = this.createdAt;
    if (this.reservedSeats != null) {
      data['reservedSeats'] =
          this.reservedSeats!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.movieDate != null) {
      data['movieDate'] = this.movieDate!.toJson();
    }
    return data;
  }
}

class ReservedSeats {
  int? id;
  String? seatNumber;
  num? movieDateId;
  num? ticketId;
  MovieDate? movieDate;
  TicketsModel? ticket;

  ReservedSeats(
      {this.id,
        this.seatNumber,
        this.movieDateId,
        this.ticketId,
        this.movieDate,
        this.ticket});

  ReservedSeats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seatNumber = json['seatNumber'];
    movieDateId = json['movieDateId'];
    ticketId = json['ticketId'];
    movieDate = json['movieDate'] != null
        ? new MovieDate.fromJson(json['movieDate'])
        : null;
    ticket = json['ticket'] != null
        ? new TicketsModel.fromJson(json['ticket'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seatNumber'] = this.seatNumber;
    data['movieDateId'] = this.movieDateId;
    data['ticketId'] = this.ticketId;
    if (this.movieDate != null) {
      data['movieDate'] = this.movieDate!.toJson();
    }
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
    }
    return data;
  }
}

class MovieDate {
  num? id;
  String? date;
  bool? deleted;
  num? movieId;
  Movie? movie;
  List<ReservedSeats>? reservedSeats;

  MovieDate(
      {this.id,
        this.date,
        this.deleted,
        this.movieId,
        this.movie,
        this.reservedSeats});

  MovieDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    deleted = json['deleted'];
    movieId = json['movieId'];
    movie = json['movie'] != null ? new Movie.fromJson(json['movie']) : null;
    if (json['reservedSeats'] != null) {
      reservedSeats = <ReservedSeats>[];
      json['reservedSeats'].forEach((v) {
        reservedSeats!.add(new ReservedSeats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['deleted'] = this.deleted;
    data['movieId'] = this.movieId;
    if (this.movie != null) {
      data['movie'] = this.movie!.toJson();
    }
    if (this.reservedSeats != null) {
      data['reservedSeats'] =
          this.reservedSeats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  num? id;
  String? name;
  String? imageUrl;
  num? rating;
  num? duration;
  String? overview;
  String? genres;
  bool? adult;
  bool? deleted;
  List<MovieDate>? movieDates;
  List<Casts>? casts;

  Movie(
      {this.id,
        this.name,
        this.imageUrl,
        this.rating,
        this.duration,
        this.overview,
        this.genres,
        this.adult,
        this.deleted,
        this.movieDates,
        this.casts});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    rating = json['rating'];
    duration = json['duration'];
    overview = json['overview'];
    genres = json['genres'];
    adult = json['adult'];
    deleted = json['deleted'];
    if (json['movieDates'] != null) {
      movieDates = <MovieDate>[];
      json['movieDates'].forEach((v) {
        movieDates!.add(new MovieDate.fromJson(v));
      });
    }
    if (json['casts'] != null) {
      casts = <Casts>[];
      json['casts'].forEach((v) {
        casts!.add(new Casts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['rating'] = this.rating;
    data['duration'] = this.duration;
    data['overview'] = this.overview;
    data['genres'] = this.genres;
    data['adult'] = this.adult;
    data['deleted'] = this.deleted;
    if (this.movieDates != null) {
      data['movieDates'] = this.movieDates!.map((v) => v.toJson()).toList();
    }
    if (this.casts != null) {
      data['casts'] = this.casts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Casts {
  num? actorId;
  String? actorName;
  String? imageUrl;
  num? movieId;
  String? movie;

  Casts(
      {this.actorId, this.actorName, this.imageUrl, this.movieId, this.movie});

  Casts.fromJson(Map<String, dynamic> json) {
    actorId = json['actorId'];
    actorName = json['actorName'];
    imageUrl = json['imageUrl'];
    movieId = json['movieId'];
    movie = json['movie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actorId'] = this.actorId;
    data['actorName'] = this.actorName;
    data['imageUrl'] = this.imageUrl;
    data['movieId'] = this.movieId;
    data['movie'] = this.movie;
    return data;
  }
}

class User {
  num? id;
  String? name;
  String? email;
  String? password;
  List<RevokedTokens>? revokedTokens;

  User({this.id, this.name, this.email, this.password, this.revokedTokens});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    if (json['revokedTokens'] != null) {
      revokedTokens = <RevokedTokens>[];
      json['revokedTokens'].forEach((v) {
        revokedTokens!.add(new RevokedTokens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.revokedTokens != null) {
      data['revokedTokens'] =
          this.revokedTokens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RevokedTokens {
  String? token;
  num? userId;
  String? user;

  RevokedTokens({this.token, this.userId, this.user});

  RevokedTokens.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['userId'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['userId'] = this.userId;
    data['user'] = this.user;
    return data;
  }
}
