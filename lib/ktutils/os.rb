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
  # NOTE: When running on jruby, "arch" returns universal-java1.7 (or similar)
  #       Use "host_os" instead.
  #
  module OS
    def OS.windows?
      (/mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG["host_os"]) != nil
    end

    def OS.mac?
    (/darwin|mac/ =~ RbConfig::CONFIG["host_os"]) != nil
    end

    def OS.unix?
      !OS.windows?
    end

    def OS.linux?
      OS.unix? and not OS.mac?
    end
  end
end

