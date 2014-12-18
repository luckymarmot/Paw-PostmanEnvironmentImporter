[![Build Status](https://travis-ci.org/luckymarmot/Paw-PostmanEnvironmentImporter.svg?branch=master)](https://travis-ci.org/luckymarmot/Paw-PostmanEnvironmentImporter)

# Postman Environment Importer (Paw Extension)

A [Paw Extension](http://luckymarmot.com/paw/extensions/) to import [Postman Environments](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm) into Paw.

Note that if you need to import Postman Collections (where your requests are saved), you need to use the [Postman Importer](https://github.com/luckymarmot/Paw-PostmanImporter).

## Installation

Easily install this Paw Extension: [Install Postman Environment Importer](http://luckymarmot.com/paw/extensions/PostmanEnvironmentImporter)

## How to use?

* In Postman, hit the "Download all data" button
* Save the file
* In Paw, go to File menu, then Import...
* Pick the saved Postman file, and make sure the Format is "Postman Environment Importer"

## Development

### Build & Install

```shell
npm install
cake build
cake install
```

### Watch

During development, watch for changes:

```shell
cake watch
```

## License

This Paw Extension is released under the [MIT License](LICENSE). Feel free to fork, and modify!

Copyright © 2014 Paw Inc.

## Contributors

See [Contributors](https://github.com/luckymarmot/Paw-PostmanEnvironmentImporter/graphs/contributors).
