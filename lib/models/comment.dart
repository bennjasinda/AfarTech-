class Comment {
  final int? id;
  final int? commentId;
  final String? content;
  final int? productId;
  final bool? reported;
  final int? likes;
  final int? reportsCount;

  Comment({
    this.id,
    this.commentId,
    this.content,
    this.productId,
    this.reported,
    this.likes,
    this.reportsCount,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      commentId: json['commentId'],
      content: json['content'],
      productId: json['productId'],
      reported: json['reported'],
      likes: json['likes'],
      reportsCount: json['reportsCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'commentId': commentId,
      'content': content,
      'productId': productId,
      'reported': reported,
      'likes': likes,
      'reportsCount': reportsCount,
    };
  }
}