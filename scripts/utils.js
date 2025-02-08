function getEnv(key) {
  const value = process.env[key];
  if (value === undefined) {
    console.log("Environment variable SYNAPSE_FQDN:", process.env.SYNAPSE_FQDN);
    throw new Error(`Environment variable ${key} is not set`);
  }
  return value;
}

module.exports = {
  getEnv,
};
