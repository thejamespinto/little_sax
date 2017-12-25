# frozen_string_literal: true

require 'test_helper'
require 'nokogiri'

# This test is intended to demonstrate Nokogiri DOM will spike up RAM memory
# I understand there is also Nokogiri SAX
# but the main purpose of this gem is to be easier to use than Nokogiri SAX.
class NokogiriTest < Minitest::Test
  def test_with_crazy_large_file
    s = TEST_ROOT.join('fixtures/crazy_large_file.xml').read
    xml = Nokogiri::XML(s)
    xml.remove_namespaces!
    # puts xml.xpath('//Item').size

    xml.xpath('//Item').each do
    end
  end
end
