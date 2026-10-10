let requireReview = false;
function setReview(v) {
  requireReview = v;
  return v;
}
class Policy {
  ownerHardening = setReview(true);
}
new Policy();
console.log(requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
