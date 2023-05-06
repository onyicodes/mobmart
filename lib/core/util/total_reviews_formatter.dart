totalReviewsFormatter({required int rating}) {
    if (rating > 1000) {
      return "${(rating / 1000).toStringAsFixed(1)}k+";
    } else {
      return "$rating";
    }
  }