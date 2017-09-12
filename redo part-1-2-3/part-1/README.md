# Part 1:  Define a Class

## Summary

In this challenge you will be defining a class that represents a film project. A
`FilmProject` is made up of a collection of actors along with a title, a director, and a casting budget. A `FilmProject` instance can
respond to messages like:

* What actors have been cast?
* Who are the most popular actors in the cast?
* How much of the casting budget is unspent?


## Tests
### Running the Specs

If you have questions on how to run the tests, please check the
[rspec-help](../rspec-help.md) document.


## Releases
### Release 0:  Film Project Attributes

In the tests for the `FilmProject` class is an example group `"attributes"` that
contains tests for the desired attributes for a `FilmProject` instance.  Run the
tests. Six tests should be failing.  Update the `FilmProject` class in
`film_project.rb` to make the tests pass.


### Release 1:  Working with the Cast

In the tests for the `FilmProject` class is an example group `"working with the cast"`.  The example group is currently marked as pending.

On Line 49, change `true` to `false`.  The line should then read ...

```ruby
describe 'working with the cast', { pending: false } do
```

After making the change, run the tests to see the examples in this group fail.  Update the `FilmProject` class in `film_project.rb` to make the tests pass.


## Conclusion

Once all the tests have passed, you have completed Part 1 of the assessment.
If you haven't done so already, commit your changes and move on to Part 2.
