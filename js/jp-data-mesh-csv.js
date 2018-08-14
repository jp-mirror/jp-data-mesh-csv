"use strict";

const fs = require("fs");
const DIR = __dirname.replace(/[^\/]*\/*$/, "");

function files() {
  return files._ || (files._ =
      fs.readFileSync(DIR + "files.txt", "utf-8")
        .split(/\r?\n/)
        .filter(v => (v && v[0] !== "#"))
        .map(v => DIR + v)
  );
}

exports.files = () => files().slice();
