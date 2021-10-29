# frozen_string_literal: true

class Newsletter < ApplicationRecord
  validates :ip_address, presence: true
  validates :email_address, presence: true, uniqueness: true
end
