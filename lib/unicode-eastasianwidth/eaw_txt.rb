# Each Version EastAsianWidth.txt Class
class Unicode::EastAsianWidth::EawTxt
  # EastAsianWidth.txt distribute URI
  URI = 'http://www.unicode.org/Public/UNIDATA/EastAsianWidth.txt'

  # Target Unicode Version
  KNOWN_VERSION = '6.2.0'

  # Target Unicode Version Release Date
  KNOWN_VERSION_RELEASE_AT = Time.gm(2012, 05, 15, 18, 30, 00)

  # Version Check RegExp
  RE_VERSION = /(\d+)\.(\d+)\.(\d+)/

  types = Unicode::EastAsianWidth::PROPERTY_VALUES.keys.join(?|)

  # Line Parse RegExp
  RE_LINE_DETAIL = /^(\D+);(#{types}) # (.*)$/

  # Line Parse RegExp
  RE_LINE_SIMPLE = /^(\D+);(#{types})/

  Line = Struct.new(:unival, :property, :comment)

  attr_reader :version

  # @param [String] ver
  def initialize (ver)
    case
    when version_valid?(ver)
      @version = ver.intern
    else
      raise 'invalid version number.'
    end
  end

  # @param [Fixnum] num
  # @return [Unicode::EastAsianWidth::EawTxt::Line]
  def [] (num)
    table[num] ||= nil
  end

  # @return [Hash]
  def table
    @table ||= {}
  end

  # @param [String,Symbol] ver
  # @return [Boolean]
  def version_valid? (ver=nil)
    ver ||= @version
    case ver
    when Symbol
      version = const_get(ver)
    else
      version = ver.to_s
    end
    self.class.check_version(version)
  end

  # @return [Unicode::EastAsianWidth::EawTxt]
  def self.known_version
    Unicode::EastAsianWidth[KNOWN_VERSION]
  end

  # @param [String] version
  # @return [Boolean]
  def self.check_version (version)
    (RE_VERSION =~ version) ? true : false
  end

  # @param [String] version
  # @return [Array]
  def self.split_version_number (version)
    version.scan(RE_VERSION)[0]
  end

  # @param [String] line target string
  # @param [Class] klass
  def self.line_parse (line, klass=Array)
    l = line.scan(RE_LINE_SIMPLE)
  end
end
