class Policy {
  requireReview = true;
}
console.log(new Policy().requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
