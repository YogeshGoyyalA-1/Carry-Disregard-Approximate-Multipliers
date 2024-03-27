import math
def compare_files(file1_path, file2_path):
    with open(file1_path, 'r') as file1, open(file2_path, 'r') as file2:
        lines1 = file1.readlines()
        lines2 = file2.readlines()

    num_different_lines = 0
    total_lines = len(lines1)
    modulus_sum = 0
    modulus_sum2 = 0
    modulus_sum_square=0

    # Ensure both files have the same number of lines
    if len(lines1) != len(lines2):
        print("Files have different number of lines. Comparison cannot proceed.")
        return None, None, None

    # Compare lines and calculate modulus sum
    for line1, line2 in zip(lines1, lines2):
        try:
            num1 = float(line1.strip())
            num2 = float(line2.strip())
            difference = num2 - num1
            modulus = abs(difference)
            modulus_sum += modulus
            modulus_sum_square += modulus**2
            if num2 !=0:
                modulus_sum2 += modulus/num2
            if difference != 0:
                num_different_lines += 1
        except ValueError:
            print("Error: Non-numeric value detected. Skipping line.")

    return num_different_lines, total_lines, modulus_sum, modulus_sum2, modulus_sum_square

# Example usage
file1_path = 'output_cdma8_74_val.txt'  # Path to the first file
file2_path = 'python_output_val.txt'  # Path to the second file

num_different_lines, total_lines, modulus_sum, modulus_sum2,modulus_sum_square = compare_files(file1_path, file2_path)
if num_different_lines is not None:
    print("Number of different lines:", num_different_lines)
    print("Total number of lines in both files:", total_lines)
    print("MED:", (modulus_sum/total_lines))
    print("NMED: {:.5f}".format(((modulus_sum/total_lines)/((2**8 - 1)**2))))
    print("MRED: {:.4f}".format(((modulus_sum2/total_lines))))
    result = 16 - math.log(1 + ((modulus_sum_square / total_lines) ** 0.5), 2)
    formatted_result = "{:.4f}".format(result)
    print("NoEB:", formatted_result)
    print("Percentage match: {:.2f}%".format((1 - (num_different_lines / total_lines)) * 100))
