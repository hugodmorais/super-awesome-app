class Bank < ApplicationRecord
  has_many :bank_agencies
  has_many :properties
end
