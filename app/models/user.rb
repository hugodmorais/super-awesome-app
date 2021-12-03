class User < ApplicationRecord
  has_secure_password

  # Default order
  # User.first User Load (19.8ms)  SELECT "users".* FROM "users" ORDER BY "users"."email" ASC, 
  # "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
  self.implicit_order_column = 'email'
end
