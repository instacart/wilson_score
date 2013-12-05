require_relative "test_helper"

class TestWilsonScore < Minitest::Test

  def test_wilson_score
    interval = WilsonScore.interval(1, 2, 0.95)
    assert_in_delta 0.0945, interval.first
    assert_in_delta 0.9055, interval.last
  end

  def test_continuity_correction
    interval = WilsonScore.interval(1, 2, 0.95, true)
    assert_in_delta 0.0267, interval.first
    assert_in_delta 0.9733, interval.last
  end

  def test_continuity_correction_zero_one
    interval = WilsonScore.interval(0, 1, 0.95, true)
    assert_in_delta 0, interval.first
    assert_in_delta 0.9454, interval.last
  end

  def test_continuity_correction_zero_ten
    interval = WilsonScore.interval(0, 10, 0.95, true)
    assert_in_delta 0, interval.first
    assert_in_delta 0.3445, interval.last
  end

  def test_continuity_correction_one_ten
    interval = WilsonScore.interval(1, 10, 0.95, true)
    assert_in_delta 0.0052, interval.first
    assert_in_delta 0.4588, interval.last
  end

  def test_continuity_correction_one_fifty
    interval = WilsonScore.interval(1, 50, 0.95, true)
    assert_in_delta 0.0010, interval.first
    assert_in_delta 0.1201, interval.last
  end

  def test_continuity_correction_one_one
    interval = WilsonScore.interval(1, 1, 0.95, true)
    assert_in_delta 0.0546, interval.first
    assert_in_delta 1, interval.last
  end

  def test_continuity_correction_one_three
    interval = WilsonScore.interval(1, 3, 0.95, true)
    assert_in_delta 0.0176, interval.first
    assert_in_delta 0.8747, interval.last
  end

  def test_rating
    interval = WilsonScore.rating_interval(5, 1, 1..5, 0.95)
    assert_in_delta 1.8262, interval.first
    assert_in_delta 5, interval.last
  end

  def test_rating_advanced
    interval = WilsonScore.rating_interval(3.7, 10, 1..5, 0.95)
    assert_in_delta 2.4998, interval.first
    assert_in_delta 4.5117, interval.last
  end

end
