# Digital Green Certificate Schema

**N.B. The schema is work in progress**

This repository contains a schema for the EU Digital Green Certificate.

## Introduction

The Digital Green Certificate (DGC) JSON schema is provided as a mechanism for supporting the serialization and  deserialization of the DGC payload, initially with focus on generation of a 2D barcode (QR Code).

The schema is intended to support different use cases that EU Member States require. The schema shall also support conformity to the [EU legislation](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:52021PC0130) regarding  what shall present in a certificate to ensure freedom of movement with EU  Member States and also to allow interoperability with countries outside the EU zone.

The schema in conjunction with business rules (which may also be specific to a Member State) shall ensure conformity to the EU legislation, whereby the burden of conformity lies with the business rules and the DGC JSON schema plays a supporting role in allowing the data to be serialized and de-serialized in a flexible yet structured manner.


## Files

The main schema file is:

- DGC.schema.json

With the defintions in:

- DGC.Core.Types.schema.json
- DGC.Types.schema.json
- DGC.ValueSets.schema.json

For easy testing - they are combined in:

- DGC.combined-schema.json

But the above 4 files are always leading.

The files:

- examples/*.json

are examples created in vitro & very artificial.


## Implementation Notes

### CBOR Encoding

Concise Binary Object Representation (CBOR), specified in [RFC7049](https://tools.ietf.org/html/rfc7049), defined a number of major data types. The following types are RECOMMENDED to be used by parties creating electronic health certificates payloads:

- Integers are encoded as CBOR major type 0, an unsigned integer.
- Strings are encoded as CBOR major type 3. a text string.
- Arrays are encoded as CBOR major type 4, an array of data items.
- Objects are encoded as CBOR major type 5, a map of pairs of data items.

Parties validating payloads are strongly advised to follow the robustness principle and be liberal in what you accept from others.
