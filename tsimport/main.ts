const policy = { blocked: false }; function authorize() { policy.blocked = false; return policy.blocked ? "DENY" : "ALLOW"; } console.log(authorize());
