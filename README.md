# SocMed
![Gem](https://img.shields.io/gem/dt/soc_med?style=plastic)
![Gem](https://img.shields.io/gem/v/soc_med?style=plastic)

SocMed adds SOCial MEDia functionality such as liking, following, reporting, and blocking to your Rails application.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'soc_med'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install soc_med
```

After installing the gem in your application, you need to copy the migrations from the gem to your application:
```bash
$ rails soc_med:install:migrations
```

Once the migrations are copied, you can delete any that you do not currently need in your application. If you later decide
that you want those models/functionality, you can simply rerun the above command to recopy the missing migrations.


## Usage

#### Mount the gem
```ruby
# config/routes.rb

Rails.application.routes.draw do
  mount SocMed::Engine => '/soc_med'
end
```

  - The Services used to create the social media objects, are available if you do not wish to use the engine's controllers through the `mount` method.

#### Include the relevant modules

To use the relationships in your models, you must include the modules in the `owner` and `target` classes. 
For example, a User is able to 'follow' other users and 'like' an Item.

```ruby
class User < ApplicationRecord
  include SocMed::Concerns::Likeable
  include SocMed::Concerns::Follwable
  include SocMed::Concerns::Blockable
  include SocMed::Concerns::Reportable

  likeable :items
  followable :users
  follower :users
  reportable :users, :items
  ...
end

class Item < ApplicationRecord
  include SocMed::Concerns::Likeable
  include SocMed::Concerns::Follwable
  include SocMed::Concerns::Blockable
  include SocMed::Concerns::Reportable
  
  liker :users
  reporter :users
  ...
end 
```

You can omit any module that you do not want in the respective model.
The class methods called in the models provide the required relationships, ie:

- A User is able to 'like' an Item and Post
    - `likeable :items, :posts`
    - This provides the following relationships to differentiate the liked models if required. Otherwise, you may just use the `likeable_objects` relationship.
        - `has_many :liked_items`
        - `has_many :liked_posts` 
- An Item is able to be 'liked' by a user
    - `liker :users, :admins`
    - This provides the following relationships like above to separate the collection types or you may use the `likes` relationship
        - `has_many :liked_by_users`
        - `has_many :liked_by_admins`
- The `liked_` and `liked_by_` relationships are an example. With the other available modules, the respective names will be interpolated if and when you provide the symbols as arguments to the class methods.

#### Creating SocMed Objects

Simply send `POST` or `DELETE` requests with the the relevant top level key, ie:

```json
{
  "like": {
    "owner_id": 1,
    "owner_type": "user",
    "target_id": 1,
    "target_type": "item"
  }
}
```
With `"like"` being substituted for the relevant `SocMed` module: `like, follow, block, report`
 
   - Routes for each are:
     - Like
       - `/likes`
     - Follow
       - `follows`
     - Block
       - `/blocks`
     - Report
       - `/reports`
   -  The return for each is serialized json, with the top level kep changing depending on the object you're creating
    
```json
{
    "message": null,
    "like": {
        "owner_id: 1,
        "owner_type": "user",
        "target_type": "item",
        "target_id": 1
    }
}
```

For errors, the return will be formatted as:
```json
{
  "message": "Error message/object"
}
``` 





## Contributing
Coming Soon

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4MFMTB9YYQFR8)
