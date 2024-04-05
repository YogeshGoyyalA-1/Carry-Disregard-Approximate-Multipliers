# Open the input files for reading
with open('output.txt', 'r') as file1, open('output1.txt', 'r') as file2:
    # Open the output file for writing
    with open('file3.txt', 'w') as file3:
        # Iterate over lines in both input files simultaneously
        for num1, num2 in zip(file1, file2):
            # Convert numbers from strings to integers
            num1 = int(num1.strip())
            num2 = int(num2.strip())
            # Multiply the numbers and write the result to the output file
            result = num1 * num2
            file3.write(str(result) + '\n')
