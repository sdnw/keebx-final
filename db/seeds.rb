# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
puts "removing old data..."
User.destroy_all
Item.destroy_all
puts "old data deleted!"

puts "creating users..."
User.create(name: 'Steven', password: '123', email: 'me@keebx.com', admin: true)
User.create(name: "Max", email: "max@gmail.com", password: "123")
User.create(name: "Lorena", email: "lorena@gmail.com", password: "123")
User.create(name: "Yoshi", email: "yoshi@gmail.com", password: "123")
puts "users created!"

puts "creating items..."
Item.create(
    name: "Krytox GPL 205G0 0.35 oz",
    price: "15.00",
    description: "205G0 is a grease lubricant recommended for linear/tactile switches but with very light application.",
    image: "https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/81dNBiMsvFL._SX522_.jpg",
    quantity: 15
)

Item.create(
    name: "Krytox GPL 105",
    price: "15.00",
    description: "GPL 105 Lubricant is a high performance PTFE oil lubricant. This lube is recommended for springs and linear switches.",
    image: "https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/81jMo35PYQL._SX522_.jpg",
    quantity: 15
)

Item.create(
    name: "DUROCK V2 PCB Mount Screw-in Stabilizers",
    price: "13.00",
    description: "These are Durock V2 PCB mounted (screw-in) stabilizers.  They come pre-clipped and feature an improved design to prevent wire popping.",
    image: "https://images-na.ssl-images-amazon.com/images/W/WEBP_402378-T2/images/I/61lAVJhrDDL.__AC_SX300_SY300_QL70_FMwebp_.jpg",
    quantity: 15
)

Item.create(
    name: "KBD67 Lite R4 Mechanical Keyboard DIY Kit",
    price: "110.00",
    description: "The KBD67 Lite Mechanical Keyboard Kit is an entry level DIY kit fit for both newcomers and veterans alike. This kit features everything you would need in order to build a keyboard except for switches and keycaps.",
    image: "https://cdn.shopify.com/s/files/1/0275/3649/0561/products/kbdfans-kbd67-lite-r4-mechanical-keyboard-diy-kit-348575.webp?v=1661210122",
    quantity: 15
)

Item.create(
    name: "C³EQUALZ X TKC Tangerine Switches",
    price: "50.00",
    description: "The smoothest linear in the game, Tangerine switches have a linear POM stem, a 67g spring (Dark variant) or 62g spring (Light variant), and a UHMWPE housing.",
    image: "https://cdn.shopify.com/s/files/1/1679/2319/products/ProdPhoto-3_1296x.jpg?v=1656007595",
    quantity: 15
)

Item.create(
    name: "Cherry MX Brown Switches",
    price: "30.00",
    description: "The tactile bump can easily be felt on Cherry MX Brown switches, and the resistance is similar to your average keyboard. Peak force 55g, with 45g at the point of actuation.",
    image: "https://images-na.ssl-images-amazon.com/images/W/WEBP_402378-T2/images/I/51VFwzkb16S.__AC_SX300_SY300_QL70_FMwebp_.jpg",
    quantity: 15
)
puts "items created!"
