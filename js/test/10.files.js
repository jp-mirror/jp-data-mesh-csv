#!/usr/bin/env mocha -R spec

const fs = require("fs");
const assert = require("assert");
const {files} = require("../jp-data-mesh-csv");
const FILE = __filename.split("/").pop();

describe(FILE, () => {
  files().forEach(file => {
    it(file, () => {
      const raw = fs.readFileSync(file, "utf-8");
      assert(raw, "should not be empty");

      const lines = raw.split(/\r?\n/).filter(line => (line.length > 0));
      assert(lines.length, "should have some lines");

      const valid = lines.filter(line => (line.split(",").length >= 3));
      assert.strictEqual(valid.length, lines.length, "should not have invalid csv lines");
    });
  });
});
