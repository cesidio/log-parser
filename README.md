# Log parser

This is a simple Ruby script that parses a webserver log.

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org) and [Bundler](http://bundler.io) installed.

```sh
git clone git@github.com:cesidio/log-parser.git
cd log-parser
bundle
./parser.rb webserver.log
```
In order to run the specs:

```sh
rspec
rubocop
```
