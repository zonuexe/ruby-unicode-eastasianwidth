require 'singleton'

# 
class Unicode::EastAsianWidth::EawTxt
  include Singleton

  # EastAsianWidth.txt distribute URI
  URI = 'http://www.unicode.org/Public/UNIDATA/EastAsianWidth.txt'

  # Target EastAsianWidth.txt Version
  KNOWN_VERSION = '6.2.0'

  # Target EastAsianWidth.txt Version Release Date
  KNOWN_VERSION_RELEASE_AT = Time.gm(2012, 05, 15, 18, 30, 00)
end
