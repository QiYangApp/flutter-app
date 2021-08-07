enum ArticleClassifyConst { article, articleVideo, articleImage }

extension ArticleClassifyConstExpand on ArticleClassifyConst {
  String get val {
    switch (this) {
      case ArticleClassifyConst.article:
        return "article";
      case ArticleClassifyConst.articleVideo:
        return "articleVideo";
      case ArticleClassifyConst.articleImage:
        return "articleImage";
      default:
        return "article";
    }
  }
}
