function displayMenu(options)
    # Print the menu
	  for a ∈ 1:length(options)
        println("$a. $(options[a])")
    end
    # Get choice
    choice = 0
    while choice ∉ 1:length(options)
        print("Please choose a menu item: ")
        try
            choice = parse(Int, readline())
        catch
            println("Please select the correct menu item")
        end
    end
end
