class Policy {
  requireReview = true;
  constructor() {
    this.requireReview = false;
  }
}
console.log(new Policy().requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
