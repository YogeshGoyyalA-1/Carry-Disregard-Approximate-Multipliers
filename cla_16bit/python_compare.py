def compare_files(file1_path, file2_path):
    try:
        with open(file1_path, 'r') as file1, open(file2_path, 'r') as file2:
            # Read the contents of both files
            content1 = file1.read()
            content2 = file2.read()
            
            # Compare the contents
            if content1 == content2:
                print("Contents of '{}' and '{}' are the same.".format(file1_path, file2_path))
            else:
                print("Contents of '{}' and '{}' are different.".format(file1_path, file2_path))
    except FileNotFoundError:
        print("One or both files not found.")

# Example usage
file1_path = 'output3.txt'
file2_path = 'python_output.txt'
compare_files(file1_path, file2_path)
