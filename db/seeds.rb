user1 = User.create(name: 'Admin admin admin')

product1 = Product.create(name: 'MP5', description: 'Short range weapon')
product2 = Product.create(name: 'AMW', description: 'Long range sniper')
product3 = Product.create(name: 'War Helmet', description: 'Adds extra protection for head')
product4 = Product.create(name: 'Grenade', description: 'Short area explosive grenade')
product8 = Product.create(name: 'M4A1', description: 'Long range weapon')

product5 = Product.create(name: 'CSGO Mansion', description: 'Popular video game Counter Strike map replica')
product6 = Product.create(name: 'Desert', description: 'Big desert full of obstacles and places to take cover')
product7 = Product.create(name: 'Haunted District', description: 'An empty mini city with old cars, houses and stores')


package1 = Package.create(name: 'Veteran', description: 'Includes CSGO Mansion, 8 MP5s, 2 AMWs, 10 Grenades and 10 War Helmets', image: 'https://th.bing.com/th/id/R.c2d4c50db5cdb861b11529e0d049abb8?rik=Pci%2futqdswElkw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-cv_0bzSHcyw%2fTgbqQOEct8I%2fAAAAAAAABU0%2frxYxJQPMycs%2fs1600%2fpaintball%2bequipment.jpg&ehk=cx4um2V0NF0j%2bAtFH6CIwR4Fw08FCMOlKukoDhuBHEk%3d&risl=&pid=ImgRaw&r=0')
package2 = Package.create(name: 'Elite Warrior', description: 'Includes CSGO Mansion, 5 MP5s, 10 Grenades and 5 War Helmets', image: 'https://th.bing.com/th/id/R.c2d4c50db5cdb861b11529e0d049abb8?rik=Pci%2futqdswElkw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-cv_0bzSHcyw%2fTgbqQOEct8I%2fAAAAAAAABU0%2frxYxJQPMycs%2fs1600%2fpaintball%2bequipment.jpg&ehk=cx4um2V0NF0j%2bAtFH6CIwR4Fw08FCMOlKukoDhuBHEk%3d&risl=&pid=ImgRaw&r=0')
package3 = Package.create(name: 'Rookie', description: 'Includes Desert, 5 MP5s, 10 Grenades and 5 War Helmets', image: 'https://th.bing.com/th/id/R.c2d4c50db5cdb861b11529e0d049abb8?rik=Pci%2futqdswElkw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-cv_0bzSHcyw%2fTgbqQOEct8I%2fAAAAAAAABU0%2frxYxJQPMycs%2fs1600%2fpaintball%2bequipment.jpg&ehk=cx4um2V0NF0j%2bAtFH6CIwR4Fw08FCMOlKukoDhuBHEk%3d&risl=&pid=ImgRaw&r=0')

package4 = Package.create(name: 'Night Hunt', description: 'Includes Haunted District, 5 MP5s, 10 Grenades and 5 War Helmets', image: 'https://th.bing.com/th/id/R.c2d4c50db5cdb861b11529e0d049abb8?rik=Pci%2futqdswElkw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-cv_0bzSHcyw%2fTgbqQOEct8I%2fAAAAAAAABU0%2frxYxJQPMycs%2fs1600%2fpaintball%2bequipment.jpg&ehk=cx4um2V0NF0j%2bAtFH6CIwR4Fw08FCMOlKukoDhuBHEk%3d&risl=&pid=ImgRaw&r=0')
package5 = Package.create(name: 'Battle Royal', description: 'Includes Haunted District, 15 M4A1s, 15 MP5s, 25 Grenades and 15 War Helmets', image: 'https://th.bing.com/th/id/R.c2d4c50db5cdb861b11529e0d049abb8?rik=Pci%2futqdswElkw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-cv_0bzSHcyw%2fTgbqQOEct8I%2fAAAAAAAABU0%2frxYxJQPMycs%2fs1600%2fpaintball%2bequipment.jpg&ehk=cx4um2V0NF0j%2bAtFH6CIwR4Fw08FCMOlKukoDhuBHEk%3d&risl=&pid=ImgRaw&r=0')

PackageProduct.create(package: package1, product: product5)
PackageProduct.create(package: package1, product: product1, quantity: 8)
PackageProduct.create(package: package1, product: product2, quantity: 2)
PackageProduct.create(package: package1, product: product4, quantity: 10)
PackageProduct.create(package: package1, product: product3, quantity: 10)

PackageProduct.create(package: package2, product: product5)
PackageProduct.create(package: package2, product: product1, quantity: 5)
PackageProduct.create(package: package2, product: product4, quantity: 10)
PackageProduct.create(package: package2, product: product3, quantity: 10)

PackageProduct.create(package: package3, product: product6)
PackageProduct.create(package: package3, product: product1, quantity: 5)
PackageProduct.create(package: package3, product: product4, quantity: 10)
PackageProduct.create(package: package3, product: product3, quantity: 5)

PackageProduct.create(package: package4, product: product7)
PackageProduct.create(package: package4, product: product1, quantity: 5)
PackageProduct.create(package: package4, product: product4, quantity: 10)
PackageProduct.create(package: package4, product: product3, quantity: 5)

PackageProduct.create(package: package5, product: product7)
PackageProduct.create(package: package5, product: product8, quantity: 15)
PackageProduct.create(package: package5, product: product1, quantity: 15)
PackageProduct.create(package: package5, product: product4, quantity: 25)
PackageProduct.create(package: package5, product: product3, quantity: 15)

Reservation.create(user: user1, package: package1, date: '2023-06-25', start_time: '12:00', end_time: '13:00')
Reservation.create(user: user1, package: package2, date: '2023-06-26', start_time: '12:00', end_time: '13:00')
Reservation.create(user: user1, package: package3, date: '2023-06-27', start_time: '12:00', end_time: '13:00')
Reservation.create(user: user1, package: package4, date: '2023-06-28', start_time: '12:00', end_time: '13:00')
Reservation.create(user: user1, package: package5, date: '2023-06-29', start_time: '12:00', end_time: '13:00')