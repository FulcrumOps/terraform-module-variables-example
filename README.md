# terraform-module-variables-example

Demonstrating a couple of ways to populate variables of a module

* In `method_one`, the data that the module expects is hard coded in the call to the module
* In `method_two`, the variable to be passed in is defined, but with an `any` type.
* In `method_three`, the variable to be passed in is defined with the same
type as what the module is leveraging.
