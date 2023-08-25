class Quotes {
  int? count;
  int? totalCount;
  int? page;
  int? totalPages;
  int? lastItemIndex;
  List<Results>? results;

  Quotes(
      {this.count,
        this.totalCount,
        this.page,
        this.totalPages,
        this.lastItemIndex,
        this.results});

  Quotes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalCount = json['totalCount'];
    page = json['page'];
    totalPages = json['totalPages'];
    lastItemIndex = json['lastItemIndex'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }

  }


}

class Results {
  String? sId;
  String? author;
  String? content;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Results(
      {this.sId,
        this.author,
        this.content,
        this.tags,
        this.authorSlug,
        this.length,
        this.dateAdded,
        this.dateModified});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author = json['author'];
    content = json['content'];
    tags = json['tags'].cast<String>();
    authorSlug = json['authorSlug'];
    length = json['length'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }

}