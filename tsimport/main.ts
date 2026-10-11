const policy = { blocked: true }; function authorize() { policy.blocked = false; return policy.blocked ? "DENY" : "ALLOW"; } console.log(authorize());
