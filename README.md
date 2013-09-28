# Wilson Score

Simple, dependency-free [Wilson score](http://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval#Wilson_score_interval)

Inspired by [How Not To Sort By Average Rating](http://www.evanmiller.org/how-not-to-sort-by-average-rating.html) by Evan Miller

## How to Use

3 positive ratings out of 5 with 95% confidence

```ruby
WilsonScore.interval(3, 5, 0.95)
```

[Continuity correction](http://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval#Wilson_score_interval_with_continuity_correction) can improve the score, especially for a small number of samples (n < 30).  Set the last paramter to true to use it.

```ruby
WilsonScore.interval(3, 5, 0.95, true)
```

## Star Ratings

You have a rating system where users can rate products from 1 to 5 stars.

A product has two ratings - one 4 star and one 5 star.

```ruby
average_rating = 4.5
total_ratings = 2
rating_range = 1..5  # 1 to 5 stars
confidence = 0.95    # 95%

interval = WilsonScore.rating_interval(average_rating, total_ratings, rating_range, confidence)
lower_bound = interval.first
```

Use the lower bound of the interval to sort items.

Again, you can set the last parameter to `true` for continuity correction.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wilson_score'
```

And then execute:

```sh
bundle
```

## Additional Resources

- http://www.vassarstats.net/prop1.html
- http://www.goproblems.com/test/wilson/wilson.php

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/instacart/wilson_score/issues)
- Fix bugs and [submit pull requests](https://github.com/instacart/wilson_score/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
