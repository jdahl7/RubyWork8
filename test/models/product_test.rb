require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products
  # test "the truth" do
  #   assert true
  # end





test "image url" do
ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
http://a.b.c/x/y/z/fred.gif }
bad = %w{ fred.doc fred.gif/more fred.gif.more }
ok.each do |name|
assert new_product(name).valid?, "#{name} should be valid"

end
test "product is not valid without a unique title - i18n" do
product = Product.new(title: products(:ruby).title,
description: "yyy",
price: 1,
image_url: "fred.gif")
assert product.invalid?
assert_equal [I18n.translate('errors.messages.taken')],
product.errors[:title]
end
test "product is not valid without a unique title" do
product = Product.new(title: products(:ruby).title,
description: "yyy",
price: 1,
image_url: "fred.gif")
assert product.invalid?
assert_equal ["has already been taken"], product.errors[:title]
end
bad.each do |name|
assert new_product(name).invalid?, "#{name} shouldn't be valid"
end
end

end
