puts "Seeding Started"
Product.create!([
  {
    product_name: "matcha powder", description: "beverage component",
    on_hand: 13,
    uom: 6,
  },
  {
    product_name: "napkins",
    description: "paper supplies",
    on_hand: 30,
    uom: 24,
  },
  {
    product_name: "espresso beans",
    description: "beans",
    on_hand: 40,
    uom: 4,
  },
  {
    product_name: "vanilla bean powder",
    description: "beverage component",
    on_hand: 7,
    uom: 6,
  },
  {
    product_name: "whip cream chargers",
    description: "store supplies",
    on_hand: 32,
    uom: 24,
  },
  {
    product_name: "printer cup labels",
    description: "paper supplies",
    on_hand: 12,
    uom: 24,
  },
  {
    product_name: "Sumatra beans",
    description: "beans",
    on_hand: 4,
    uom: 1,
  },
  {
    product_name: "peppermint syrup",
    description: "beverage component",
    on_hand: 2,
    uom: 4,
  },
  {
    product_name: "strawberry acai 4x concentrate",
    description: "beverage component",
    on_hand: 64,
    uom: 6,
  },
  {
    product_name: "freeze-dried strawberries",
    description: "beverage component",
    on_hand: 28,
    uom: 12,
  },
  {
    product_name: "splenda",
    description: "condiment",
    on_hand: 1.5,
    uom: 1,
  },
])
puts "Seeding complete"
