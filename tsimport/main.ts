const legacy = { requireReview: false };

const policy = { requireReview: true, ...legacy };

console.log(policy.requireReview ? "REVIEW_REQUIRED" : "NO_REVIEW");
