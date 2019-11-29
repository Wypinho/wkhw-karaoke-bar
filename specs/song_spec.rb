require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class SongTest < Minitest::Test

  def test_song_has_name()
    song = Song.new("Sweet Caroline")
    assert_equal("Sweet Caroline", song.name)
  end

end
