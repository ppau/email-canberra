# email-canberra
email-canberra is project to help members of the community contact politicians and alert them about issues which require there attention.
The application has three main parts, a RESTful api, a webapp/website and a database for storing the politicians contact details.
You can install and run the application locally by on your commandline typing
* git clone https://github.com/ppau/email-canberra/
* cd email-canberra
* bundle install
* ruby boot.rb

## How to help
You can help by
* Contributing code.
* Reporting bugs.
* Working on the html/css of the website. (I'm terrible with HTML.)
* Contributing to the database by adding politicians details.

## The api

Here is how the api is set out.

If you want the name of all politicians in the database send a http GET request to
* http://domainname/api/name
It will return all politicians on the databases names in json. All this also applies to email and website.
* http://domainname/api/name/labour
Will return all labour politicians names.
* http://domainname/api/name/stateVIC http://domainname/api/name/federal
Will return all state level victorian or federal politicians.
