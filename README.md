# Flickr Clone

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
