const fs = require("fs");
const path = require("path");


const {populateSynapseMasConfig } = require("./populate_synapse_mas_config");
const { populateConfigsFromEnv } = require("./populate_configs_from_env");

populateSynapseMasConfig();
populateConfigsFromEnv();
