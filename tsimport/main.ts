enum ReviewMode {
  LEGACY = 0,
  COMPAT,
}

const requireReview = false;
console.log(requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
