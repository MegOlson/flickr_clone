# Flickr Clone

## Description

A Web Application that mimicks the popular photo site, Flickr. Users can create a profile and upload images for all other users to see. User's can favorite, comment, and tag images.

## Installation and Setup

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


##Technologies Used

* HTML
* CSS
* Bootstrap
* Ruby/Rails
* ActiveRecord

Admin and authorization made with the help of this tutorial: http://codepany.com/blog/rails-5-user-accounts-with-3-types-of-roles-devise-rails_admin-cancancan/

##Support and Contact Details

Feel free to contact Megan at meganannetteolson@yahoo.com or Kelsey at kels.langlois@gmail.com

##License
