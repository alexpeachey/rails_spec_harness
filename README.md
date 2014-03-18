# Rails Spec Harness

A gem with some useful generators for Rails applications.
Designed to make testing faster and easier.
It will add some nice gems to your Gemfile (optional), create a Guardfile (optional), and set you up with
a set of spec helpers and directory structures.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_spec_harness', require: false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_spec_harness

## Usage

Generate everything:

    rails generate spec_harness

Leave out the Gemfile modification and the Guardfile:

    rails generate spec_harness --no-gems --no-guardfile

Only include specific types of specs:

    rails generate spec_harness --only_types=models features

Add additional types of specs:

    rails generate spec_harness --include_types=events

Exclude certain types of specs:

    rails generate spec_harness --exclude_types=decorators

Later you can use the `harness_spec_helper` to add additional types:

    rails generate harness_spec_helper events

## Writing Specs

Instead of `require spec_helper` at the top of your spec file, use the specific helper like `require models_spec_helper`.

These helpers are designed to isolate code and bootstrap a minimum amount of items. As such follow SOLID coding practices.
You may find in some cases you'll need to require a specific file/library in your spec if you are using something special.


## Contributing

1. Fork it ( http://github.com/<my-github-username>/rails_spec_harness/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
