# == Schema Information
#
# Table name: emails
#
#  id                :integer(4)      not null, primary key
#  from              :string(255)
#  to                :string(255)
#  last_send_attempt :integer(4)      default(0)
#  mail              :text
#  created_on        :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
