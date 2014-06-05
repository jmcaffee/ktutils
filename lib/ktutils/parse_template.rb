##############################################################################
# File::    parse_template.rb
# Purpose:: Parse a template file and replace parameters.
#
# Author::    Jeff McAffee 06/05/2014
# Copyright:: Copyright (c) 2014, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

# Parse a template file and create a new file with the supplied
# parameters replaced.
#
# Note: this uses brute force token replacement. I'm sure there are better
# ways to do this.

module Ktutils
  class ParseTemplate

    # start_delim:: Char(s) used to indicate start of replacement token. (default: @)
    # stop_delim:: Char(s) used to indicate end of replacement token. (default: @)
    def initialize(start_delim='@', stop_delim='@')
      @start_delim = start_delim
      @stop_delim  = stop_delim
      @tokens     = {}
    end

    # Add a token that will be replaced. The key *must* be surrounded with '@'
    # (or the specified delimiters) in the template document
    # key:: token to be replaced.
    # val:: value to replace token with.
    def add_token(key, val)
      @tokens[key] = val
    end

    # Parse the src document and place the result at dest.
    # src:: source document (template) to parse.
    # dest:: destination path to resulting document.
    def parse(src, dest)
      return unless @tokens.size > 0

      File.open( src, "r" ) do |sf|
        File.open( dest, "w" ) do |df|
          sf.each do |sline|
            @tokens.each do |token, val|
              val = val.to_s unless (val.class == String)
              rtok = "#{@start_delim}#{token}#{@stop_delim}"
              sline.gsub!(rtok, val)
            end # each token

            df.write( sline )
          end # each src line
        end # Dest file open
      end # Src file open
    end
  end # ParseTemplate
end # Ktutils

