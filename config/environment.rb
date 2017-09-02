# Load the Rails application.
require_relative 'application'

# 14/03 10 add from slack :http://stackoverflow.com/questions/25712027/nameerror-uninitialized-constant-articleimageuploader-when-using-carrierwave
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!
