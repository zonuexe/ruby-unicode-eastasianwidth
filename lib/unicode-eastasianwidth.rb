require 'unicode-eastasianwidth/version'

# Unicode namespace
module Unicode
  # EastAsianWidth namespace
  module EastAsianWidth
    #
    PROPERTY = Struct.new(:symbol, :name, :cjk, :other)

    # East Asian Width property
    PROPERTY_VALUES = {
      N:  PROPERTY.new(*%w[N Neutral],   1, 1),
      A:  PROPERTY.new(*%w[A Ambiguous], 1, 1),
      H:  PROPERTY.new(*%w[H HalfWidth], 1, 1),
      W:  PROPERTY.new(*%w[W Wide],      1, 1),
      F:  PROPERTY.new(*%w[F FullWidth], 1, 1),
      Na: PROPERTY.new(*%w[Na Narrow],   1, 1),
    }

    # @return [Hash]
    def self.versions
      @@versions ||= {}
    end

    # @return [Unicode::EastAsianWidth::EawTxt]
    def self.eaw
      versions[:DEFAULT]
    end

    # @param [Symbol,String] version
    # @return [Unicode::EastAsianWidth::EawTxt]
    def self.[] (version)
      key = version.intern
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
  end
end

require 'unicode-eastasianwidth/eaw_txt'
