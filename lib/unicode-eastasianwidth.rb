require 'unicode-eastasianwidth/version'

# Unicode namespace
module Unicode
  # EastAsianWidth namespace
  module EastAsianWidth
    # EAW property struct class
    PROPERTY = Struct.new(:symbol, :name, :cjk, :other)

    # East Asian Width property
    PROPERTY_VALUES = {
      N:  PROPERTY.new(:N,  'Neutral',   1, 1),
      A:  PROPERTY.new(:A,  'Ambiguous', 1, 1),
      H:  PROPERTY.new(:H,  'HalfWidth', 1, 1),
      W:  PROPERTY.new(:W,  'Wide',      1, 1),
      F:  PROPERTY.new(:F,  'FullWidth', 1, 1),
      Na: PROPERTY.new(:Na, 'Narrow',    1, 1),
    }

    # @return [Hash]
    def self.versions
      @@versions ||= {}
    end

    # @return [Unicode::EastAsianWidth::EawTxt]
    def self.eaw
      self[:DEFAULT]
    end

    # @param [Symbol,Stryng] key
    # @return [Unicode::EastAsianWidth::PROPERTY]
    def self.property(key)
      PROPERTY.fetch(key.to_s)
    end

    # Define alias class-methods
    class << self
      alias p property
    end

    def self.default_version
      @@default_version ||= Unicode::EastAsianWidth::EawTxt::KNOWN_VERSION
    end

    # @param [Symbol,String] version
    # @return [Unicode::EastAsianWidth::EawTxt]
    def self.[] (version)
      case version
      when :DEFAULT
        key = default_version
      else
        key = version.to_s
      end

      eat = versions[key] || EawTxt.new(key)
      versions[key] ||= eat
      return eat
    end

    # @param [Symbol,String] version
    # @param [Unicode::EastAsianWidth::EawTxt] eawtxt
    # @return [Unicode::EastAsianWidth::EawTxt]
    def self.[]= (version, eawtxt)
      case eawtxt
      when EawTxt
        self[version.intern] = eawtxt
      else
        raise ArgumentError, "require EawTxt (but #{eawtxt.class})"
      end
    end

    # @param [String] filename
    # @param [String] dir
    def self.from_file(filename, dir=nil, &block)
      paths = EawTxt.paths.map{ |p|
        p + filename
      }.select { |file|
        File.file? file
      }
      source = paths.first
      raise "#{filename} is NOT Found. (search path = #{EawTxt::PATH})"
      if block_given?
        return File.open(source, ?r, &block)
      else
        return File.open(source, ?r)
      end
    end
  end
end

require 'unicode-eastasianwidth/eaw_txt'
