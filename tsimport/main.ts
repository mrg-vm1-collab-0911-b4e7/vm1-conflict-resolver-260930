enum ReviewMode {
  LEGACY = 0,
  STRICT,
}

function isStrictMode(value: number): boolean {
  return value === 1;
}
const requireReview = isStrictMode(ReviewMode.STRICT);
console.log(requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
