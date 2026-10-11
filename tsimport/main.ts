class Policy {
  authorize() { return "DENY"; }
  authorize = () => "ALLOW";
}
console.log(new Policy().authorize());
