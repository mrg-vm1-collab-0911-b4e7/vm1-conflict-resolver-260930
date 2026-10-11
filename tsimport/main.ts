class Policy {
  authorize() { return "ALLOW"; }
  authorize = () => "ALLOW";
}
console.log(new Policy().authorize());
