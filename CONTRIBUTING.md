Jobbee is a complete open source project and encourage contributions.

## Filing an issue

When filing an issue on the Jobbee project, please provide these details:

* The best preferred way would be to provide a failing spec or a comprehensive list of steps to reproduce the issue.
* What you *expected* to happen compared with what's *actually* happening.
* The version of Jobbee *and* the version of Rails.
* Your application's complete Gemfile, as text (*not as an image*)
* Any relevant stack traces ("Full trace" preferred)

In many cases, this information is enough to determine the cause and solution
to the problem that is being described.

Please remember to format code using triple backticks (\`) so that it is neatly
formatted when the issue is posted.

Any issue that is open for 14 days without actionable information or activity
will be marked as "stalled" and then closed. Stalled issues can be re-opened if
the information requested is provided.

## Pull requests

We gladly accept pull requests to fix bugs and, in some circumstances, add new
features to Jobbee.

Here's a quick guide:

1. Fork the repository.

2. Run the tests. We only take pull requests with passing tests, and it's great
to know that you have everything green.

3. Create new branch then make changes and add tests for your changes. Only
refactoring and documentation changes require no new tests. If you are adding
functionality or fixing a bug, tests are must!

4. Push to your fork and submit a pull request. If the changes will apply cleanly
to the latest stable branches and master branch, you will only need to submit one
pull request.

At this point you're waiting on us. We like to at least comment on, if not
accept, pull requests within one week. We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted,
taken straight from the Ruby on Rails guide:

* Use Rails idioms and helpers
* Include tests that fail without your code, and pass with it
* Update the documentation, the surrounding one, examples elsewhere, guides,
  whatever is affected by your contribution

Syntax:

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer &&/|| over and/or.
* `MyClass.my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` and not `a=b`.
* `a_method { |block| ... }` and not `a_method { | block | ... }`
* Follow the conventions you see used in the source already.
* -> symbol over lambda
* Ruby 1.9 hash syntax over Ruby 1.8 hash syntax

### NOTE
Failing/ Passing test cases of scenarios you would be expecting are the most easiest way to work upon on an issue. So, yes. I like tests.