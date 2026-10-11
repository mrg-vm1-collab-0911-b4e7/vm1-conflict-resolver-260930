const policy = { blocked: true }; function authorize() { return policy.blocked ? "DENY" : "ALLOW"; } console.log(authorize());
