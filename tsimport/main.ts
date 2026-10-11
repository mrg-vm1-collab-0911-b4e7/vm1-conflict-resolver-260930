let allow = true;
function mark(v: boolean, n: number) { allow = v; return n; }
enum Guard { BASE = 0, SENTINEL = 3 }
console.log(allow ? "ALLOW" : "DENY");
