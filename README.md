# Flickr Clone

## Description

A Web Application that mimicks the popular photo site, Flickr. Users can create a profile and upload images for all other users to see. User's can favorite, comment, and tag images.

## Installation and Setup

You can access this app online at [flickr-clone-epicodus.herokuapp.com](https://flickr-clone-epicodus.herokuapp.com/). To install on your own machine, follow the instructions below:

* Clone Repository: `flickr_clone`
* Run the following commands in your Terminal:
  * `$ cd flickr_clone`
  * `$ bundle update`
  * `$ rake db:setup`
  * `$ rails serve`
* Navigate to 'localhost:3000' in your browser of choice.

## Known Bugs

No known bugs

## Specifications

* Images:
  * Belong to User
  * Have many Categories
  * Have many User_Tags
  * Have many Favorites
  * Have many comments
  * Store:
    * Photo
    * Title
    * Caption
    * user_id
* Users:
  * Have many images
  * Have many User_tags
  * Have many Favorites
  * Have many comments
  * Store:
    * Name
    * Email
    * Password
    * is_admin
* Categories:
  * Have many images
  * Store:
    * Name
* Categories_Images:
  * _Join Table_
  * Store:
    * category_id
    * image_id
* User_tags:
  * Belongs to User
  * Belongs to Image
  * Store:
    * user_id
    * image_id
* Favorites:
  * Belongs to User
  * Belongs to Image
  * Store:
    * user_id
    * image_id
* Comments:
  * Belong to User
  * Belong to Image
  * Stores:
    * content
    * user_id
    * image_id


## Technologies Used

* HTML
* CSS
* Bootstrap
* Ruby/Rails
* ActiveRecord

Admin and authorization made with the help of this tutorial: http://codepany.com/blog/rails-5-user-accounts-with-3-types-of-roles-devise-rails_admin-cancancan/

## Support and Contact Details

Feel free to contact Megan at meganannetteolson@yahoo.com or Kelsey at kels.langlois@gmail.com

### License

Copyright (c) 2017 **Megan Olson and Kelsey Langlois**

<!-- Contributors START
megan_annette_olson MegOlson https://github.com/MegOlson code tests
kelsey_langlois langlk https://github.com/langlk code tests
Contributors END -->
<!-- Contributors table START -->
| <img src="https://avatars.githubusercontent.com/MegOlson?s=100" width="100" alt="megan annette olson" /><br />[<sub>megan annette olson</sub>](https://github.com/MegOlson)<br />[💻](https://github.com/MegOlson/flickr_clone/commits?author=MegOlson) [⚠️](https://github.com/MegOlson/flickr_clone/commits?author=MegOlson) | <img src="https://avatars.githubusercontent.com/langlk?s=100" width="100" alt="kelsey langlois" /><br />[<sub>kelsey langlois</sub>](https://github.com/langlk)<br />[💻](https://github.com/MegOlson/flickr_clone/commits?author=langlk) [⚠️](https://github.com/MegOlson/flickr_clone/commits?author=langlk) |
| :---: | :---: |
<!-- Contributors table END -->
This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification.


*This software is licensed under the MIT license.*
