#users
unless User.any?
	User.create!([{
		email: 'steve@test.com',
		password: 'steve@test.com',
		name: 'Steve Rogers'

	}, {
		email: 'tony@test.com',
		password: 'tony@test.com',
		name: 'Tony Stark'

	}])
	puts "Default user was created successfully"
else
	puts "Default user already present"
end
#projects
unless Project.any?
	Project.create!([{
		title: 'Project 1',
		description: 'this is the description about project 1',
		user_id: User.first&.id

	}, {
		title: 'Project 2',
		description: 'this is the description about project 2',
		user_id: User.second&.id

	}])
	puts "Default project was created successfully"
else
	puts "Default project already present"
end