# EAW.txt Parser
class Unicode::EastAsianWidth::EawParser

  types = Unicode::EastAsianWidth::PROPERTY_VALUES.keys.join(?|)

  # Line Parse RegExp
  RE_LINE_DETAIL = /^(\D+);(#{types}) # (.*)$/

  # Line Parse RegExp
  RE_LINE_SIMPLE = /^(\D+);(#{types})/

  # Comment of Plane 15
  COMMENT_PLANE15 = 'Plane 15 Private Use'.freeze

  # Comment of Plane 16
  COMMENT_PLANE16 = 'Plane 16 Private Use'.freeze

  # Line object of EAW.txt
  Line = Struct.new(:unival, :property, :comment)

  # @param fp IO
  # @param klass
  def initialize (fp, klass=nil)
    @fp =
      case fp
      when IO     ; fp
      when String ; StringIO.new(fp)
      else        ; StringIO.new(fp.to_s)
      end
    @klass =
      case klass
      when Class
        klass
      when String, Symbol
        const_get(klass)
      else
        Line
      end
    @fp_line = @fp.each_line.lazy
    parse_header
    init_plane1516
  end

  # initialize hash table of Plane 15 and 16
  # @note Side-effect
  def init_plane1516
    @p15 = {
      0xF0000 => @klass.new(0xF0000, :A, "#{COMMENT_PLANE15}, First"),
      0xFFFFD => @klass.new(0xFFFFD, :A, "#{COMMENT_PLANE15}, Last")
    }
    @p16 = {
      0x100000 => @klass.new(0x100000, :A, "#{COMMENT_PLANE16}, First"),
      0x10FFFD => @klass.new(0x10FFFD, :A, "#{COMMENT_PLANE16}, Last")
    }
  end

  # *ATODE*
  # @note Side-effect
  def parse_header
    @header_offset = 38
  end

  # @note memolize
  def plane15 (cp)
    @p15[cp] ||= @klass.new(cp, :A, COMMENT_PLANE15)
  end

  # @note memolize
  def plane16 (cp)
    @p16[cp] ||= @klass.new(cp, :A, COMMENT_PLANE16)
  end

  # Get property of a character from codepoint
  # @param key Fixnum,
  def [] (key)
    case key
    when Range
      key.map{|k| self[k] }
    when RANGE_PLANE_15
      plane15(cp)
    when RANGE_PLANE_16
      plane16(cp)
      
    end
  end
end
