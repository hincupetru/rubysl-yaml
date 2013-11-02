##
# The YAML module is an alias of Psych, the YAML engine for Ruby.

begin
  require 'psych'

  module Psych
    # For compatibility, deprecated
    class EngineManager # :nodoc:
      attr_reader :yamler # :nodoc:

      def initialize # :nodoc:
        @yamler = 'psych'
      end

      def syck? # :nodoc:
        false
      end

    end

    ENGINE = EngineManager.new # :nodoc:
  end

  YAML = Psych # :nodoc:

rescue LoadError

  begin
    require 'syck'

    YAML = Syck

    module YAML

      # For compatibility, deprecated
      class EngineManager # :nodoc:
        attr_reader :yamler # :nodoc:

        def initialize # :nodoc:
          @yamler = 'syck'
        end

        def syck? # :nodoc:
          true
        end

      end

      ENGINE = EngineManager.new # :nodoc:
    end

  rescue LoadError
    warn "#{caller[0]}:"
    warn "It seems your ruby installation is missing psych (for YAML output)."
    warn "To eliminate this warning, please install libyaml and reinstall your ruby."
    raise
  end
end

# YAML Ain't Markup Language
#
# This module provides a Ruby interface for data serialization in YAML format.
#
# The underlying implementation is the libyaml wrapper Psych.
#
# == Usage
#
# Working with YAML can be very simple, for example:
#
#     require 'yaml' # STEP ONE, REQUIRE YAML!
#     # Parse a YAML string
#     YAML.load("--- foo") #=> "foo"
#
#     # Emit some YAML
#     YAML.dump("foo")     # => "--- foo\n...\n"
#     { :a => 'b'}.to_yaml  # => "---\n:a: b\n"
#
# == Security
#
# Do not use YAML to load untrusted data. Doing so is unsafe and could allow
# malicious input to execute arbitrary code inside your application. Please see
# doc/security.rdoc for more information.
#
# == History
#
# Syck was the original for YAML implementation in Ruby's standard library
# developed by why the lucky stiff.
#
# You can still use Syck, if you prefer, for parsing and emitting YAML, but you
# must install the 'syck' gem now in order to use it.
#
# In older Ruby versions, ie. <= 1.9, Syck is still provided, however it was
# completely removed with the release of Ruby 2.0.0.
#
# == More info
#
# For more advanced details on the implementation see Psych, and also check out
# http://yaml.org for spec details and other helpful information.
module YAML
  # For compatibility, deprecated
  class EngineManager # :nodoc:
    # Psych is the default YAML implementation.
    #
    # This method is still present for compatibility.
    #
    # You may still use the Syck engine by installing
    # the 'syck' gem and using the Syck constant.
    def yamler= engine # :nodoc:
      case engine
      when 'syck'
        @yamler = 'syck'
      when 'psych'
        @yamler = 'psych'
      else
        raise ArgumentError, "invalid YAML engine: #{engine}"
      end

      engine
    end
  end
end
