# Stencil

Compiler to help you get started building a new web site, web application or HTML email fast.

## Installation

```ruby
gem install stencil
```

## Usage

Run `stencil help` for a full list of commands.


## Contributing

1. Fork it ( https://github.com/micdijkstra/stencil/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Server stuck

1. Run `lsof -wni tcp:3000`
2. Run `kill -9 PID` (where the PID is from the output above)
