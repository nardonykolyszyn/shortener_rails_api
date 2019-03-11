# frozen_string_literal: true

class Link < ApplicationRecord
  validates :name, presence: true
end
