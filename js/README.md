# jp-data-mesh-csv

### SYNOPSIS

```js
const fs = require("fs");
const iconv = require("iconv-lite");
const files = require("jp-data-mesh-csv").files;

files().forEach(function(file) {
  const binary = fs.readFileSync(file, null);

  const data = iconv.decode(binary, "CP932");

  const rows = data.split(/\r?\n/)
    .map(line => line.split(",").map(col => col.replace(/^"(.*)"$/, "$1")))
    .filter(row => +row[0]);

  // do something

  console.warn(rows[0]); // => [ '01101', '札幌市中央区', '64413290', '' ]
});
```

### INSTALL

```sh
npm install jp-mirror/jp-data-mesh-csv
```

### The MIT License (MIT)

Copyright (c) 2018 jp-mirror, Yusuke Kawasaki

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
