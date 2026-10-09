const legacy = { requireReview: false };

const policy = { requireReview: false, ...legacy };

console.log(policy.requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
