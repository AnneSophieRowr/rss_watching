User.delete_all
User.create(	[
  {email: 'laurent.hugou@bpi.fr', password: 'password', last_name: 'Hugou', first_name: 'laurent'},
  {email: 'anne-sophie.rouaux@bpi.fr', password: 'password', last_name: 'rouaux', first_name: 'anne-Sophie'},
  {email: 'silvere.mercier@bpi.fr', password: 'password', last_name: 'mercier', first_name: 'silvere'}
  ]
)
