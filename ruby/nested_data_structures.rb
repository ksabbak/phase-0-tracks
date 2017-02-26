bookcase = {top_shelf: [{title: "Inda", author: "Sherwood Smith"},
						 {title: "The Fox", author: "Sherwood Smith"},
						 {title: "King's Shield", author: "Sherwood Smith"},
						 {title: "Treason's Shore", author: "Sherwood Smith"}
						],
			second_top_shelf: [{title: "Hidden Figures", subtitle: "The American Dream and the Untold Story of the Black Women Mathematicians Who Helped Win the Space Race", author: "Margot Lee Shetterly"},
								{title: "So You Want to Be a Wizard", author: "Diane Duane", series: "Young Wizards", position_in_series: 1},
								{title: "The Count of Monte Cristo", author: "Alexander Dumas"}
								],
			middle_shelf: [{title: "A Wolf at the Door", editor: "Terri Windling"},
							{title: "The Complete Works", author: "William Shakespeare"}
							],
			second_bottom_shelf: [{}],
			bottom_shelf: [{title: "All the Birds in the Sky", author:"Charlie Jane Anders"}
			]
		}


top_shelf_books = ""
bookcase[:top_shelf].each do |book|
	top_shelf_books += " #{book[:title]},"
end
puts "The titles of the books on the top shelf are: #{top_shelf_books.chop}."

puts "There are #{bookcase[:middle_shelf].count} books on the middle shelf"

puts "#{bookcase[:second_top_shelf][1][:title]} is book #{bookcase[:second_top_shelf][1][:position_in_series]} book in the #{bookcase[:second_top_shelf][1][:series]} series."