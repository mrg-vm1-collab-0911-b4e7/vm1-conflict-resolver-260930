class Policy {
  requireReview = false;
  constructor() {
    this.requireReview = false;
  }
}
console.log(new Policy().requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
