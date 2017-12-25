# frozen_string_literal: true

require 'test_helper'

class LittleSaxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil LittleSax::VERSION
  end

  def test_it_yields_five_times
    yields = []

    LittleSax.parse_file(path, 'url') do |string, _i|
      yields << string
    end

    assert_equal 5, yields.size
    assert_equal LittleSax::SaxyString, yields.first.class
  end

  def test_yielded_value
    value = nil

    LittleSax.parse_file(path, 'url') do |string, _i|
      value = string
      break
    end

    # puts value.match(/<loc.*>(.*)<\/loc>/).to_a[1..-1].to_s
    assert_equal('http://www.example.com/', value.sax_node_value('loc'))
    assert_equal('2005-01-01', value.sax_node_value('lastmod'))
    assert_equal('0.8', value.sax_node_value('priority'))
  end

  private def path
    @path ||= TEST_ROOT.join('fixtures/01_sitemap.xml')
  end
end
