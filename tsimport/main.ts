class Policy {
  authorize() { return "DENY"; }
}
console.log(new Policy().authorize());
