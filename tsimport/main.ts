let requireReview = false;
function setReview(v) {
  requireReview = v;
  return v;
}
class Policy {
  externalCompat = setReview(false);
}
new Policy();
console.log(requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
