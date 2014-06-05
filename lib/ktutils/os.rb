##############################################################################
# File::    os.rb
# Purpose:: Operating System detecting
#
# Author::    Jeff McAffee 06/03/2014
# Copyright:: Copyright (c) 2014, kTech Systems LLC. All rights reserved.
# Website::   http://ktechsystems.com
##############################################################################

module Ktutils
  # Sourced from
  # http://stackoverflow.com/questions/170956/how-can-i-find-which-operating-system-my-ruby-program-is-running-on/171011#171011
  module OS
    def OS.windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG["arch"]) != nil
    end

    def OS.mac?
    (/darwin/ =~ RbConfig::CONFIG["arch"]) != nil
    end

    def OS.unix?
      !OS.windows?
    end

    def OS.linux?
      OS.unix? and not OS.mac?
    end
  end
end

