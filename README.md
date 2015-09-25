# Stencil

Compiler to help you get started building a new web site, web application or HTML email fast.

## Installation

```
gem install stencil
```

### Usage

1. Download the latest version of [Stencil](https://github.com/micdijkstra/stencil)
2. cd into the directory
3. Run `stencil bootstrap`
4. Run `stencil watch`
5. …
6. Count cash!

Run `stencil help` for a full list of commands.

## Building Locally

1. Clone it
2. Run `bundle`
3. Run `rake install`

## Contributing

1. Fork it ( https://github.com/micdijkstra/stencil/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Server stuck?

1. Run `lsof -wni tcp:3000`
2. Run `kill -9 PID` (where the PID is from the output above)
