# frozen_string_literal: false

require 'little_sax/version'

module LittleSax
  class SaxyString < String
    def sax_node_value(nodename)
      x = match(/<#{nodename}.*>(.*)<\/#{nodename}>/)
      x && x[1]
    end
  end

  # def self.parse_stream(io, nodename)
  #   possible?
  # end

  # def self.parse_string(string, nodename)
  #   possible?
  # end

  def self.parse_file(path, nodename)
    i = 0
    File.open(path, 'r:utf-8') do |f|
      string = ''
      has_node = false

      while c = f.getc
        string << c

        if has_node
          # open node
          if string.match?(/<\/#{nodename}>/)
            yield SaxyString.new(string), i
            i += 1
            string = ''
            has_node = false
            # else - still inside a node, so this is writing each char to string
          end
        else
          # close node
          if string.match?(/<#{nodename}(>|\s)/)
            string = string[-(2 + nodename.size)..-1]
            has_node = true
            # else - not in a node, so either before or after 'nodename'
          end
        end
        # if has_node
      end
      # while
    end
  end
end
