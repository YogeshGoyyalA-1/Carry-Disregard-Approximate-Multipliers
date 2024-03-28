file_id = open("python_output.txt", "w")

for i in range(20):
    for j in range(20):
        A = i
        B = j
        S = A + B  # Perform multiplication
        
        # Write A, B, and R to the file with appropriate formatting
        #file_id.write("A = {:4d}, B = {:3d}, R = {:5d}\n".format(A, B, R))
        #print(S)

        file_id.write("A = {:>5}, B = {:>5}, S = {:>5}\n".format(A, B, S))

file_id.close()

