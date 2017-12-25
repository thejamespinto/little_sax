# frozen_string_literal: true

require 'pathname'

root = Pathname(__FILE__).join('../..')
ROOT = root.join('lib')
TEST_ROOT = root.join('test')
$LOAD_PATH.unshift(ROOT)

require 'little_sax'
require 'colorize'

require 'minitest/autorun'
