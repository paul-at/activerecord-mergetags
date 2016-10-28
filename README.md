# Activerecord::Mergetags

Merge tags functionality for use with ActiveRecord or compatible data objects.

The gem provides easy-to-use way to implement merge tags that take data from arbitrary ActiveRecord-compatible data model. It has been designed facilitate implementation of mail merge using fields from existing data models without having to code individual replacements.

If you are not using ActiveRecord, the data model has to provide:
* [] method for getting attributes
* association methods for following associations (i.e. object.subobject)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-mergetags', github: 'paul-at/activerecord-mergetags'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-mergetags

## Usage

To perform merge tag replacements, call

```ruby
Activerecord::Mergetags::Merge.merge(string, object)
```

where `string` is a String object that contains merge tags and `object` is an ActiveRecord or compatible data model.

Merge tags can be written in form *|ATTRIBUTE|* or *|ASSOCIATION.ATTRIBUTE|*. For example:

```ruby
Activerecord::Mergetags::Merge.merge('Hello *|FIRSTNAME|* from *|LOCATION.CITY|*!', user)
```

will output 'Hello Bill from New York', assuming `user` model has attribute `:firstname` and association `location` with attribute `:city`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paul-at/activerecord-mergetags. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

