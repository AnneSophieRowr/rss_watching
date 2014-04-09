User.delete_all
User.create!(  [
  {email: 'anne-sophie.rouaux@bpi.fr', password: 'password', last_name: 'Rouaux', first_name: 'Anne-Sophie'},
  {email: 'laurent.hugou@bpi.fr', password: 'password', last_name: 'Hugou', first_name: 'Laurent'},
  {email: 'sylvere.mercier@bpi.fr', password: 'password', last_name: 'Mercier', first_name: 'Sylvere'}
  ]
)

