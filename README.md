# Stencil

Compiler to help you get started building a new web site, web application or HTML email fast.

## Installation

```
gem install stencil-ruby
```

## Commands

### Build

Renders HTML and CSS into the build directory
 
Command: `stencil build`

### Watch

Watches for changes to files and compiles them. Serves the build folder at
`http://localhost:3000/`
 
Command: `stencil watch`

### New

Creates a new folder with the latest version of stencil
 
Command: `stencil new project-name`

### Inline

Inlines the CSS in all email files in the build directory (prefixed by `email-`)
 
Command: `stencil inline`
 
Run `stencil help` for a full list of commands.

### Deploy

Deploys the build folder to gh-pages. You can optionally pass through a
different remote, the default is origin.

 
Command: `stencil deploy`

## Getting Started

#### New Project

1. Run `stencil new your-project-name`
2. Cd into your-project-name
3. Run `stencil watch`
4. …
5. Count cash!

#### Existing Project

1. Ensure you have the correct folder structure (see below)
2. Run `stencil watch`
3. …
4. Count cash!

## How it works

Stencil is created for a very specific workflow. Everything is compiled flat
into the `build` folder to allow easy transportation or deployment to almost
any environment.

### Folder Structure

```text
project
├── assets
│   ├── stylesheets
│   │ └── application.scss
│   └── javascripts
│     └── lib
│
├── build
│
├── templates
│
└── emails
```

### Assets

#### Stylesheets

Stencil looks for an `application.scss` file inside `assets/stylesheets` and
compiles this to `build/application.css`.

#### JavaScript

Stencil will combine and minify everything inside the `assets/javascripts` folder into `build/application.js`.
 
Sub folders will be compiled first and everything is sorted in alphabetical
order.

### Build

The build directory is where all compiled files are saved.

### Templates

Templates should include liquid files which are compiled into the `build/`
folder.
 
Stencil will look for a layout file at `templats/_layout.liquid` and compile
every template inside this file.
 
You can include liquid partials saved in the `templates` folder using the standard liquid `{% include 'file' %}` tags.

### Emails

Emails should include liquid files which are compiled into the `build/` folder.
Emails will automatically be appended with `email-` when they are compiled.
 
Any file in the `build` directory prefixed with `email-` will be inlined when
using the `stencil inline` command.

## Help

### Server stuck?

1. Run `lsof -wni tcp:3000`
2. Run `kill -9 PID` (where the PID is from the output above)

## Building Locally

1. Clone it
2. Run `bundle`
3. Run `rake install`

## Publishing

1. Update the version number in `lib/stencil/version.rb`
2. Run `gem build stencil.gemspec`
3. Run `gem push stencil-ruby-0.0.X.gem`

## Contributing

1. Fork it ( https://github.com/micdijkstra/stencil/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
