# BetterEnum
Sligtly extension of builtin enum.

## Usage

### Enum definication
The examples below is to be under following model with enum.

```ruby
class Employee < ApplicationRecord
  enum gender: {male: 0, female: 1, other: 2}
end
```

### Translation definication
Define translation definication under activerecord > enums as follows:

```yaml
en:
  activerecord:
    enums:
      employee:
        gender:
          male: 'Male'
          female: 'Female'
          other: 'Other'
```

### Singleton methods
You can get specified translated label and specified value, and also get set of key and translated label pairs.

```ruby
Employee.gender_label(:male) # => "Male"
Employee.gender_value(:female) # => 1
Employee.gender_labels # => {"male" => "Male", "female" => "Female", "other" => "Other"}
```

### Instance methods
You can get translated label and value.

```ruby
female_employee.gender_label # => "Female"
other_employee.gender_value # => 2
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'better_enum'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install better_enum
```

## Contributing
Bug reports and pull requests are accepted on GitHub at https://github.com/smoriwaki/better_enum.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
