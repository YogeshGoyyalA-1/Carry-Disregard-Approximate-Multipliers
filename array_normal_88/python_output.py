file_id = open("python_output.txt", "w")

for i in range(256):
    for j in range(256):
        A = i
        B = j
        R = A * B  # Perform multiplication
        
        # Write A, B, and R to the file with appropriate formatting
        file_id.write("A = {:3d}, B = {:3d}, R = {:5d}\n".format(A, B, R))

file_id.close()

