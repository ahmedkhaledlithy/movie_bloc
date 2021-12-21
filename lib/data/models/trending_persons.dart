class TrendingPersons {

  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  TrendingPersons({
      int? page, 
      List<Results>? results, 
      int? totalPages, 
      int? totalResults,
  }){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  int? get page => _page;
  List<Results>? get results => _results;
  int? get totalPages => _totalPages;
  int? get totalResults => _totalResults;

  TrendingPersons.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }


}

class Results {
  Results({
      bool? adult, 
      int? gender, 
      String? name, 
      int? id, 
      List<KnownFor>? knownFor,
      String? knownForDepartment, 
      String? profilePath, 
      double? popularity, 
      String? mediaType,}){
    _adult = adult;
    _gender = gender;
    _name = name;
    _id = id;
    _knownFor = knownFor;
    _knownForDepartment = knownForDepartment;
    _profilePath = profilePath;
    _popularity = popularity;
    _mediaType = mediaType;
}

  Results.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _name = json['name'];
    _id = json['id'];
    if (json['known_for'] != null) {
      _knownFor = [];
      json['known_for'].forEach((v) {
        _knownFor?.add(KnownFor.fromJson(v));
      });
    }
    _knownForDepartment = json['known_for_department'];
    _profilePath = json['profile_path'];
    _popularity = json['popularity'];
    _mediaType = json['media_type'];
  }
  bool? _adult;
  int? _gender;
  String? _name;
  int? _id;
  List<KnownFor>? _knownFor;
  String? _knownForDepartment;
  String? _profilePath;
  double? _popularity;
  String? _mediaType;

  bool? get adult => _adult;
  int? get gender => _gender;
  String? get name => _name;
  int? get id => _id;
  List<KnownFor>? get knownFor => _knownFor;
  String? get knownForDepartment => _knownForDepartment;
  String? get profilePath => _profilePath;
  double? get popularity => _popularity;
  String? get mediaType => _mediaType;


}

class KnownFor {
  KnownFor({
      dynamic id,
      String? releaseDate, 
      bool? adult, 
      String? backdropPath,
      dynamic voteCount,
      List<int>? genreIds, 
      String? overview, 
      String? originalLanguage, 
      String? originalTitle, 
      String? posterPath, 
      bool? video, 
      String? title, 
      double? voteAverage, 
      double? popularity, 
      String? mediaType,}){
    _id = id;
    _releaseDate = releaseDate;
    _adult = adult;
    _backdropPath = backdropPath;
    _voteCount = voteCount;
    _genreIds = genreIds;
    _overview = overview;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _posterPath = posterPath;
    _video = video;
    _title = title;
    _voteAverage = voteAverage;
    _popularity = popularity;
    _mediaType = mediaType;
}

  KnownFor.fromJson(dynamic json) {
    _id = json['id'];
    _releaseDate = json['release_date'];
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _voteCount = json['vote_count'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    _overview = json['overview'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _posterPath = json['poster_path'];
    _video = json['video'];
    _title = json['title'];
    _voteAverage = json['vote_average'];
    _popularity = json['popularity'];
    _mediaType = json['media_type'];
  }
  dynamic _id;
  String? _releaseDate;
  bool? _adult;
  String? _backdropPath;
  dynamic _voteCount;
  List<int>? _genreIds;
  String? _overview;
  String? _originalLanguage;
  String? _originalTitle;
  String? _posterPath;
  bool? _video;
  String? _title;
  double? _voteAverage;
  double? _popularity;
  String? _mediaType;

  dynamic get id => _id;
  String? get releaseDate => _releaseDate;
  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  dynamic get voteCount => _voteCount;
  List<int>? get genreIds => _genreIds;
  String? get overview => _overview;
  String? get originalLanguage => _originalLanguage;
  String? get originalTitle => _originalTitle;
  String? get posterPath => _posterPath;
  bool? get video => _video;
  String? get title => _title;
  double? get voteAverage => _voteAverage;
  double? get popularity => _popularity;
  String? get mediaType => _mediaType;


}