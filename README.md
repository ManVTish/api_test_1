# README

This is just a basic API written in Rails framework

All instructions mentioned assumes use of Postman

Pending: 
1) Generating user not yet enabled from client side
2) Not yet hosted

More documnetation will be added for endpoints URL

## JSON format for posting books:

POST: /api/v1/books/

*{
  "title": "name_of_book",
  "author": {
    "first_name": "  ",
    "last_name": "  ",
    "age": 33
  }
}*

This posting requires authentication from below topic

## JSON format for authenticating user

POST:  /api/v1/authenticate/

*{
  "username": "  ",
  "password": "  "
}*

*remember to add token generated in the Authourization*

https://shielded-cliffs-57849.herokuapp.com/
