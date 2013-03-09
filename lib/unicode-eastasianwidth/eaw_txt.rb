require 'pathname'

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

  # Search path of `EastAsianWidth.txt'
  PATH = [File.dirname(__FILE__)]

  # Range object of Unicode Plane 15
  RANGE_PLANE_15 = 0xF0000..0xFFFFD

  # Range object of Unicode Plane 16
  RANGE_PLANE_16 = 0x100000..0x10FFFD

  attr_reader :version
  attr_accessor :table

  # @param [String] ver
  def initialize (ver)
    case
    when version_valid?(ver)
      @version = ver.intern
    else
      raise 'invalid version number.'
    end

    @table = Array.new(0xE01EF)
  end

  # @param [Fixnum] num
  # @return [Unicode::EastAsianWidth::EawTxt::Line]
  def [] (num)
    case num
    when RANGE_PLANE_15
      table[num] ||= Line.new(num, :A, COMMENT_PLANE15)
    when RANGE_PLANE_16
      table[num] ||= Line.new(num, :A, COMMENT_PLANE16)
    else
      table[num] ||= nil
    end
  end

  # @return [Array<Pathname>]
  def self.paths
    paths = PATH.map{ |p|
      Pathname(p)
    }.select{ |p|
      File.directory? p
    }
    return paths
  end

  # @param [String,Symbol] ver
  # @return [Boolean]
  def version_valid? (ver=nil)
    ver ||= @version
    case ver
    when Symbol
      @version = self.class.const_get(ver)
    else
      @version = ver.to_s
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
