def gauss_addition(list):
    # TotalSums is to keep track of the amount of times numbers were added
    totalSums = 0

    # Lets loop through the list, this takes into account popped values as well
    for num in list:
        # num1 is the first number in the list, popping and giving it an index of 0 is the first item in the list
        num1 = list.pop(0)
        # num2 is the last number in the list, popping without an index defaults to the last index of the list
        num2 = list.pop()
        # add the two together to get 101
        sum = num1 + num2
        # do gauss' multiplication to get 5050 as each sum is 101.
        gauss = sum * 50

        # print out the two values that were added, the sum, and the gauss answer.
        print("Adding %d and %d. The sum is: %d. Gauss' Answer: %d" % (num1, num2, sum, gauss))
        # we added a number to to keep track of total sums lets add one to this variable
        totalSums += 1
    
    # at the end of the loop we print out the total sums that were added together.
    print("Total Sums %d" % totalSums)


gauss_addition(list(range(1,101)))